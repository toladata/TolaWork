//App specific Angular JavaScript
(function(){

	var app = angular.module("helpdesk", ['angularUtils.directives.dirPagination', 'ngTextTruncate']);

	app.config(function($interpolateProvider, $httpProvider) {
		  $interpolateProvider.startSymbol('[[');
		  $interpolateProvider.endSymbol(']]');
		  $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    	$httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';

		});

	app.controller("TicketController", ['$scope', '$http', function ($scope, $http) {
    //variables

      $scope.types = {
        'problem': 1,
        'enhancement': 2,
        'Bug or Error': 3
      };

      $scope.items_per_page = {
         '5': 5,
         '10':10,
         '15':15,
         '20':20
       };        

    $scope.status = {
         'Open': 1,
         'Reopened': 2,
         'Resolved': 3,
         'Closed': 4,
         'Duplicate': 5,
         'Progress' : 6
       };        

       $scope.other_filters = {
         'Created by me': 1,
         'Assigned to me': 2,
         'Closed by me': 3
       };

      $scope.query_params = {
        'filtering': {},
        'sorting': null,
        'sortreverse': true,
        'keyword': null,
        'other_filter': null
        };

      $scope.sort = {
       'Title': 'title',
       'Queue': 'queue',
       'Status': 'status',
       'Priority': 'priority',
       'Assigned_to': 'assigned_to',
       'Type': 'type',
       'Votes': 'votes'        
     };

       $scope.queue_id = [];
       $scope.tag_id = [];
       $scope.type_id = [];
       $scope.other_filter = [];
       $scope.statuses = [];
       $scope.keyword = null;
       $scope.pageSize = 10;
       $scope.tickets = [];
       $scope.sorting = [];
       $scope.sortreverse = true;

       $scope.numberOfPages=function(){
             return Math.ceil($scope.getData().length/$scope.pageSize);                
           }
       

       //Get the filter variables
       $scope.getQueues = function(){
        $http({ method: 'GET', url: '/helpdesk/tickets/get_queues/' })           

           .success(function (response){ $scope.queues = response; })
       } 

       $scope.getTags = function(){
        $http({ method: 'GET', url: '/helpdesk/tickets/get_tags/' })           

           .success(function (response){ $scope.t_tags = response;}) 
       }  

       //My tickets
       $scope.getMyTickets = function(){
            $http({ method: 'GET', url: '/helpdesk/tickets/get_my_tickets/' })                    
            .success(function (response){ $scope.tickets = response; })
           }        

       $scope.getAssignedTickets = function(){
            $http({ method: 'GET', url: '/helpdesk/tickets/get_tickets_assigned_to_me/' })                    
            .success(function (response){ $scope.tickets = response; })
           }        

      $scope.getClosedTickets = function(){
            $http({ method: 'GET', url: '/helpdesk/tickets/get_tickets_closed_by_me/' })                    
            .success(function (response){ $scope.tickets = response; })
           } 

      $scope.getFollowUps = function(){
            $http({ method: 'GET', url: '/helpdesk/tickets/get_follow_ups/' })                    
            .success(function (response){ $scope.follow_ups = response; console.log($scope.follow_ups); })
           } 

      $scope.getDependencies = function(){
            $http({ method: 'GET', url: '/helpdesk/tickets/get_dependencies/' })                    
            .success(function (response){ $scope.dependencies = response; })
           }

      $scope.getTicketChanges = function(){
            $http({ method: 'GET', url: '/helpdesk/tickets/get_ticket_change/' })                    
            .success(function (response){ $scope.ticketchanges = response; console.log($scope.ticketchanges); })
           }
      $scope.getTicketAttachments = function(){
            $http({ method: 'GET', url: '/helpdesk/tickets/get_attachments/' })                    
            .success(function (response){ $scope.attachments = response; console.log($scope.attachments); })
           }

      $scope.filterTickets = function (){
            //filtering object
            $scope.query_params.filtering.assigned_to__id__in = $scope.assigned_id;
            $scope.query_params.filtering.submitter_mail__in = $scope.submitter_mail;
            $scope.query_params.filtering.status__in = $scope.statuses;
            $scope.query_params.filtering.type__in = $scope.type_id;
            $scope.query_params.filtering.queue__id__in = $scope.queue_id;
            $scope.query_params.filtering.created__gte = $scope.date_from;
            $scope.query_params.filtering.created__lte = $scope.date_to;

            //end of filter object
            $scope.query_params.sorting = $scope.sorting;
            $scope.query_params.sortreverse = $scope.sortreverse;
            $scope.query_params.keyword = $scope.keyword;
            $scope.query_params.other_filter = $scope.other_filter;

            console.log($scope.query_params);
            console.log($scope.queue_id);
 
            $http({ 
                    method: 'POST', 
                    url: '/helpdesk/tickets/filter_tickets/', 
                    data: $scope.query_params
                })           

            .success(function (response){
               $scope.tickets = response;
               console.log($scope.tickets);
            })            

            .error(function (response){
               console.log(response);
           })
       }

    $scope.filterTickets();
    $scope.getTicketAttachments();
    $scope.getTags();
    $scope.getQueues();
    $scope.getFollowUps();
    $scope.getDependencies();
    $scope.getTicketChanges();
	
	}]);

})();
