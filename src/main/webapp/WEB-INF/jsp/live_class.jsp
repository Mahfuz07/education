
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var liveClassApp = angular.module("liveClassApp", []);
    liveClassApp.controller("liveClassCtrl", function ($http, $scope, $filter) {
        
        $scope.currentDate = new Date();
        
        
        //previous date
        $scope.preDate = new Date($scope.currentDate);
        $scope.preDate.setDate($scope.currentDate.getDate() - 1);
        $scope.preDate.setHours("24");
        $scope.preDate.setMinutes("00");
        $scope.preDate.setSeconds("00");
        //alert($scope.preDate);
        
        //next date
        $scope.nextDate = new Date($scope.currentDate);
        $scope.nextDate.setDate($scope.currentDate.getDate() + 1);
        $scope.nextDate.setHours("00");
        $scope.nextDate.setMinutes("00");
        $scope.nextDate.setSeconds("00");
        
        //alert($scope.nextDate);
        

        $scope.events = [];
        $scope.getAllEvents = function () {
            $http({
                method: 'GET',
                url: 'events/allEvents'
            }).then(function (response) {
                $scope.events = response.data;
            });
        };
        $scope.getAllEvents();

    });
        
    liveClassApp.filter('trustAsResourceUrl', ['$sce', function ($sce) {
            return function (val) {
                return $sce.trustAsResourceUrl(val);
            };
        }]);
</script>

<div class="col-md-12" ng-app="liveClassApp" ng-controller="liveClassCtrl">
    <div class="row">

        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-default" style="cursor: pointer;">
                        <div class="panel-heading">
                            <i class="fa fa-calendar"></i> Todyas Events
                        </div>
                        <!-- .panel-heading -->


                        <div class="panel-body">
                            <div ng-show="preDate <= event.eventDate && event.eventDate < nextDate" ng-if="event.status == 1" class="col-md-4"  ng-repeat="event in events">
                                <a href="${pageContext.request.contextPath}/live_class_event/{{event.eventId}}" style="text-decoration: none; color: #555;">
                                    <div class="panel panel-default">

                                        <div class="panel-heading">
                                            <img width="100%" src="${pageContext.request.contextPath}/resources/{{event.eventPhoto}}"/>
                                            <h4>{{event.eventName}} <i class="fa fa-play-circle-o pull-right"></i></h4> 
                                        </div>

                                        <div class="panel-body">
                                            <font color="tomato" style="font-weight: bold; font-size: 20px;">Creator: {{event.eventCreatorName}} </font><br/>
                                            Date: {{event.eventDate | date : "MMM d, y h:mm:ss a"}} <br/>
                                            <div id="timeBox"></div>

                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>



                        <!-- .panel-body -->
                    </div>


                    <div class="panel panel-default" style="cursor: pointer;">
                        <div class="panel-heading">
                            <i class="fa fa-calendar"></i> Upcoming Events
                        </div>
                        <!-- .panel-heading -->
                        <div class="panel-body">


                            <div ng-show="event.eventDate > nextDate" ng-if="event.status == 1" class="col-md-4"  ng-repeat="event in events">
                                <a href="${pageContext.request.contextPath}/live_class_event/{{event.eventId}}" style="text-decoration: none; color: #555;">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <img width="100%" src="${pageContext.request.contextPath}/resources/{{event.eventPhoto}}"/>
                                            <h4>{{event.eventName}} <i class="fa fa-play-circle-o pull-right"></i></h4> 
                                        </div>
                                        <div class="panel-body">
                                            <font color="tomato" style="font-weight: bold; font-size: 20px;">Creator: {{event.eventCreatorName}} </font><br/>
                                            Date: {{event.eventDate | date : "MMM d, y h:mm:ss a"}} <br/>
                                            <div id="timeBox"></div>

                                        </div>
                                    </div>
                                </a>
                            </div>




                        </div>
                        <!-- .panel-body -->
                    </div>
                                            
                                            
                    <div class="panel panel-default" style="cursor: pointer;">
                        <div class="panel-heading">
                            <i class="fa fa-calendar"></i> Previous Events
                        </div>
                        <!-- .panel-heading -->
                        <div class="panel-body">
                            <div ng-show="event.eventDate < preDate" ng-if="event.status == 1" class="col-md-4"  ng-repeat="event in events">
                                <a href="${pageContext.request.contextPath}/live_class_event/{{event.eventId}}" style="text-decoration: none; color: #555;">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <img width="100%" src="${pageContext.request.contextPath}/resources/{{event.eventPhoto}}"/>
                                            <h4>{{event.eventName}} <i class="fa fa-play-circle-o pull-right"></i></h4> 
                                        </div>
                                        <div class="panel-body">
                                            <font color="tomato" style="font-weight: bold; font-size: 20px;">Creator: {{event.eventCreatorName}} </font><br/>
                                            Date: {{event.eventDate | date : "MMM d, y h:mm:ss a"}} <br/>
                                            <div id="timeBox"></div>

                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- .panel-body -->
                    </div>

                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>


        
    </div>
</div>
