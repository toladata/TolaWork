from feed.serializers import TicketSerializer
from helpdesk.models import Ticket

from django.shortcuts import get_object_or_404
from rest_framework import renderers, viewsets, filters
from rest_framework.response import Response

class TicketViewSet(viewsets.ModelViewSet):
    """
    A ViewSet for listing or retrieving Tickets
    """
    def list(self, request):
        queryset = Ticket.objects.all()
        serializer = TicketSerializer(instance=queryset,context={'request': request}, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = Ticket.objects.all()
        ticket = get_object_or_404(queryset, pk=pk)
        serializer = TicketSerializer(instance=ticket, context={'request':request})
        return Response(serializer.data)

    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer


