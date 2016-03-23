"""
django-helpdesk - A Django powered ticket tracker for small enterprise.

(c) Copyright 2008 Jutda. All Rights Reserved. See LICENSE for details.

views/kb.py - Public-facing knowledgebase views. The knowledgebase is a
              simple categorised question/answer system to show common
              resolutions to common problems.
"""

from datetime import datetime
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.utils.translation import ugettext as _

from helpdesk.models import SuperKBCategory, KBCategory, KBItem


def index(request):
    supercategory_list = SuperKBCategory.objects.select_related()
    category_list = KBCategory.objects.all()

    if ('q' in request.GET) and request.GET['q'].strip():
        query_string = request.GET.get('q')
        item_list = KBItem.objects.filter((Q(title__icontains=query_string) | Q(question__icontains=query_string) | Q(answer__icontains=query_string )))

    else:
        item_list = KBItem.objects.all()

    paginator = Paginator(item_list, 15) # Show 15 items per page

    page = request.GET.get('page')
    try:
        item_list = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        item_list = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        item_list = paginator.page(paginator.num_pages)

    # TODO: It'd be great to have a list of most popular items here.
    return render_to_response('helpdesk/kb_index.html',
        RequestContext(request, {
            'superkbcategories':supercategory_list,
            'kb_categories': category_list,
            'kb_items': item_list
        }))


def category(request, slug):
    category = get_object_or_404(KBCategory, slug__iexact=slug)
    items = category.kbitem_set.all()
    return render_to_response('helpdesk/kb_category.html',
        RequestContext(request, {
            'category': category,
            'items': items,
        }))


def item(request, item):
    item = get_object_or_404(KBItem, pk=item)
    return render_to_response('helpdesk/kb_item.html',
        RequestContext(request, {
            'item': item
        }))


def vote(request, item):
    item = get_object_or_404(KBItem, pk=item)
    vote = request.GET.get('vote', None)
    if vote in ('up', 'down'):
        item.votes += 1
        if vote == 'up':
            item.recommendations += 1
        item.save()

    return HttpResponseRedirect(item.get_absolute_url())

def kb_list(request):

    context = {}

    # Query_params will hold a dictionary of parameters relating to
    # a query, to be saved if needed:
    query_params = {
        'filtering': {},
        'sorting': None,
        'sortreverse': True,
        'keyword': None,
        'other_filter': None,
        }

    from_saved_query = False

    # If the user is coming from the header/navigation search box, lets' first
    # look at their query to see if they have entered a valid ticket number. If
    # they have, just redirect to that ticket number. Otherwise, we treat it as
    # a keyword search.

    if request.GET.get('search_type', None) == 'header':
        query = request.GET.get('q')
        filter = None
        if query.find('-') > 0:
            try:
                queue, id = query.split('-')
                id = int(id)
            except ValueError:
                id = None

            if id:
                filter = {'queue__slug': queue, 'id': id }
        else:
            try:
                query = int(query)
            except ValueError:
                query = None

            if query:
                filter = {'id': int(query) }

        if filter:
            try:
                ticket = Ticket.objects.get(**filter)
                return HttpResponseRedirect(ticket.staff_url)
            except Ticket.DoesNotExist:
                # Go on to standard keyword searching
                pass

    saved_query = None
    if request.GET.get('saved_query', None):
        from_saved_query = True
        try:
            saved_query = SavedSearch.objects.get(pk=request.GET.get('saved_query'))
        except SavedSearch.DoesNotExist:
            return HttpResponseRedirect(reverse('helpdesk_kb_list'))
        if not (saved_query.shared or saved_query.user == request.user):
            return HttpResponseRedirect(reverse('helpdesk_kb_list'))

        try:
            import pickle
        except ImportError:
            import cPickle as pickle
        from helpdesk.lib import b64decode
        query_params = pickle.loads(b64decode(str(saved_query.query)))
    elif not (  'queue' in request.GET
            or  'assigned_to' in request.GET
            or  'status' in request.GET
            or  'q' in request.GET
            or  'sort' in request.GET
            or  'sortreverse' in request.GET
                ):

        # Fall-back if no querying is being done, force the list to only
        # show open/reopened/resolved (not closed) cases sorted by creation
        # date.

        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
    else:
        queues = request.GET.getlist('queue')
        if queues:
            try:
                queues = [int(q) for q in queues]
                query_params['filtering']['queue__id__in'] = queues
            except ValueError:
                pass

        owners = request.GET.getlist('assigned_to')
        if owners:
            try:
                owners = [int(u) for u in owners]
                query_params['filtering']['assigned_to__id__in'] = owners
            except ValueError:
                pass

        statuses = request.GET.getlist('status')
        if statuses:
            try:
                statuses = [int(s) for s in statuses]
                query_params['filtering']['status__in'] = statuses
            except ValueError:
                pass

        types = request.GET.getlist('types')
        if types:
            try:
                types = [int(s) for s in types]
                query_params['filtering']['type__in'] = types
            except ValueError:
                pass

        date_from = request.GET.get('date_from')
        if date_from:
            query_params['filtering']['created__gte'] = date_from

        date_to = request.GET.get('date_to')
        if date_to:
            query_params['filtering']['created__lte'] = date_to

        ### KEYWORD SEARCHING
        q = request.GET.get('q', None)

        if q:
            qset = (
                Q(title__icontains=q) |
                Q(description__icontains=q) |
                Q(resolution__icontains=q) |
                Q(submitter_email__icontains=q)
            )
            context = dict(context, query=q)

            query_params['other_filter'] = qset

        ### SORTING
        sort = request.GET.get('sort', None)
        if sort not in ('status', 'assigned_to', 'created', 'title', 'queue', 'priority'):
            sort = 'created'
        query_params['sorting'] = sort

        sortreverse = request.GET.get('sortreverse', None)
        query_params['sortreverse'] = sortreverse

    kb_items = KBItem.objects.select_related()
    queue_choices = Queue.objects.all()
    try:
       kb_item_qs = apply_query(kb_items, query_params)
    except ValidationError:
       # invalid parameters in query, return default query
        query_params = {
            'filtering': {'status__in': [1, 2, 3]},
            'sorting': 'created',
        }
        kb_item_qs = apply_query(kb_items, query_params)

    kb_item_paginator = paginator.Paginator(ticket_qs, 20)
    try:
        page = int(request.GET.get('page', '1'))
    except ValueError:
         page = 1

    try:
        kb_items = kb_item_paginator.page(page)
    except (paginator.EmptyPage, paginator.InvalidPage):
        kb_items = kb_item_paginator.page(kb_item_paginator.num_pages)

    search_message = ''
    if 'query' in context and settings.DATABASES['default']['ENGINE'].endswith('sqlite'):
        search_message = _('<p><strong>Note:</strong> The keyword search is case sensitive. This means the search will <strong>not</strong> be accurate.')


    try:
        import pickle
    except ImportError:
        import cPickle as pickle
    from helpdesk.lib import b64encode
    urlsafe_query = b64encode(pickle.dumps(query_params))

    user_saved_queries = SavedSearch.objects.filter(Q(user=request.user) | Q(shared__exact=True))

    querydict = request.GET.copy()
    querydict.pop('page', 1)

    print "TICKET TYPES:"
    print Ticket.TICKET_TYPE

    return render_to_response('helpdesk/kb_list.html',
        RequestContext(request, dict(
            context,
            query_string=querydict.urlencode(),
            kb_items=kb_items,
            user_choices=User.objects.filter(is_active=True,is_staff=True),
            queue_choices=queue_choices,
            status_choices=Ticket.STATUS_CHOICES,
            type_choices=Ticket.TICKET_TYPE,
            urlsafe_query=urlsafe_query,
            user_saved_queries=user_saved_queries,
            query_params=query_params,
            from_saved_query=from_saved_query,
            saved_query=saved_query,
            search_message=search_message,

        )))

