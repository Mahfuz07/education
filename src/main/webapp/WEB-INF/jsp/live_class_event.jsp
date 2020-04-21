
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var liveApp = angular.module("liveApp", []);
    liveApp.controller("liveCtrl", function ($http, $scope, $filter) {
        $scope.showComment = false;



        $scope.event = {};
        $scope.getPerticularEvent = function () {
            $http({
                method: 'GET',
                url: '/events/event/' + ${event.eventId}}).then(function (response) {
                $scope.event = response.data;
            });
        };

        $scope.getPerticularEvent();



        $scope.selectedEvent = {};
        $scope.clickedTopics = function (eventId) {
            $scope.selectedtopics = eventId;

            $scope.getAllComments($scope.selectedtopics.eventId);
            $scope.getAllSComments();
        };


        //comments section start from here
        //get comments
        $scope.allComments = [];
        $scope.getAllComments = function(id){
            $http({
                method: 'GET',
                url: '/eventComments/allEventCommentsByEventId/' + id
            }).then(function (response) {
                $scope.allComments = response.data;
            });
        };



        //save commens
        $scope.comment = null;
        $scope.userName = "";
        $scope.eventId = "";
        $scope.showsubmitComment = function(){
//            alert($scope.userName);
//            alert($scope.topicsId);
//            alert($scope.comment);

            $scope.commentToSave = {'eventsCommentsId':'','username':'','eventId':'','comment':''};

            $scope.commentToSave.comment = $scope.comment;
            $scope.commentToSave.username = $scope.userName;
            $scope.commentToSave.eventId = $scope.eventId;

            $http({
                method: 'GET',
                url: '/eventComments/allEventCommentsByEventId/' + id
            }).then(function (response) {
//                $scope.receiveSaveComments = response.data();
//                $scope.message = "Comment Saved Successfully";
//                alert($scope.message);
                $scope.getAllComments($scope.eventId);
                $scope.getAllSComments();
            }, function (reason) {
                $scope.error_message = reason.data;
            });


        };






        //save commens
        $scope.comment = null;
        $scope.userName = "";
        $scope.eventId = "";
        $scope.submitComment = function(){
//            alert($scope.userName);
//            alert($scope.topicsId);
//            alert($scope.comment);

            $scope.commentToSave = {'eventsCommentsId':'','username':'','eventId':'','comment':''};

            $scope.commentToSave.comment = $scope.comment;
            $scope.commentToSave.username = $scope.userName;
            $scope.commentToSave.eventId = $scope.eventId;


            $http({
                method: 'POST',
                url: '/eventComments/saveEventComments',
                data: angular.toJson($scope.commentToSave),
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(function (response) {
//                $scope.receiveSaveComments = response.data();
//                $scope.message = "Comment Saved Successfully";
//                alert($scope.message);
                $scope.getAllComments($scope.eventId);
                $scope.getAllSComments();
            }, function (reason) {
                $scope.error_message = reason.data;
            });


        };


        //sub comments start here
        //get all subcomments
        $scope.allScomments = [];
        $scope.getAllSComments = function(id){
            $http({
                method: 'GET',
                url: '/eventSubComments/allEventSubComments'
            }).then(function (response) {
                $scope.allScomments = response.data;
            });
        };
        $scope.getAllSComments();



        //save sub comments
        $scope.cid = "";
        $scope.subComments = null;
        $scope.submitSubComment = function(subComments, cid){
            $scope.subComments = subComments;
            $scope.cid = cid;
//            alert($scope.subComments);
//            alert($scope.cid);
            $scope.sComments = {'eventsSubCommentsId':'','eventsCommentsId':'','subComments':'','username':''};
            $scope.sComments.eventsCommentsId = $scope.cid;
            $scope.sComments.subComments = $scope.subComments;
            $scope.sComments.username = $scope.userName;

            $http({
                method: 'POST',
                url: '/eventSubComments/saveEventSubComments',
                data: angular.toJson($scope.sComments),
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(function (response) {;
                $scope.getAllComments($scope.eventId);
                $scope.getAllSComments();
            }, function (reason) {
                $scope.error_message = reason.data;
            });

        };

















        //start video
        $scope.clickedEvent = {'notesFile':'','presentationFile':''};
        $scope.videoToDisplay = '';
        $scope.startVideo = function (cevent) {
            $scope.clickedEvent = cevent;
            //convert database event date
            $scope.filteredDate = $filter('date')($scope.clickedEvent.eventDate, 'yyyy-MM-dd HH:mm:ss');
            $scope.clickedEvent.eventDate = $scope.filteredDate;
            //convert current date
            $scope.date = new Date();
            $scope.currentDate = $filter('date')($scope.date, 'yyyy-MM-dd HH:mm:ss');


            //compate current date with event date
            if($scope.currentDate < $scope.clickedEvent.eventDate){
//                alert("current Date " + $scope.currentDate + "\nEvent Date " + $scope.clickedEvent.eventDate);
                alert("You Can't See This Video Right Now. Please Come Back Later");
                $scope.clickedEvent = {'notesFile':'','presentationFile':''};
                $scope.getPerticularEvent();






            }else if($scope.clickedEvent.eventDate <= $scope.currentDate){
//                alert("current Date " + $scope.currentDate + "\nEvent Date " + $scope.clickedEvent.eventDate);
                $scope.showComment = true;
                $scope.clickedEvent = cevent;
                $scope.videoToDisplay = $scope.clickedEvent.videoUrl;
//                $scope.getAllEvents();

                $scope.getAllComments($scope.eventId);

            }
        };




    });
    liveApp.filter('trustAsResourceUrl', ['$sce', function ($sce) {
        return function (val) {
            return $sce.trustAsResourceUrl(val);
        };
    }]);
</script>
<script type="text/javascript">
    function cdtd(){
        time = document.getElementById('timeHolder').value;
        var xmas = new Date(time);
        var now = new Date();


        var timeDiff = xmas.getTime() - now.getTime();

        //document.getElementById('timeDisplay').innerHTML = xmas + "<br/>" + now + "<br/>" + timeDiff;


        if(timeDiff <= 0){
            clearTimeout(timer);
            document.getElementById("timeBox").style = "display : none";
            document.getElementById("timeBox2").style = "display : none";
        }

        var seconds = Math.floor(timeDiff/1000);
        var minutes = Math.floor(seconds/60);
        var hours = Math.floor(minutes/60);
        var days = Math.floor(hours/24);

        hours %= 24;
        minutes %= 60;
        seconds %= 60;

        document.getElementById("timeBox").innerHTML = "Remaining: <b style='color:tomato'>" + days + 'd ' + hours + "h " + minutes + "m " + seconds + "s</b>";
        document.getElementById("timeBox2").innerHTML = "<b style='color:tomato'>" + days + 'd ' + hours + "h " + minutes + "m " + seconds + "s</b>";

        var timer = setTimeout('cdtd()', 1000);

    }

</script>
<div class="col-md-12" style="margin-top: -10px;">
    <div class="col-md-12" ng-app="liveApp" ng-controller="liveCtrl" style="background: #fff; padding: 20px; border: 1px solid #DDD;">
        <div class="row">

            <div class="col-md-5">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="panel panel-default" style="cursor: pointer;">
                            <div class="panel-heading">
                                <i class="fa fa-dot-circle-o"></i> Live Event <span id="timeBox2" class="pull-right"></span>
                            </div>
                            <!-- .panel-heading -->
                            <div class="panel-body">

                                <div ng-click="startVideo(event)" class="panel panel-default">
                                    <div class="panel-heading">

                                            <c:if test="${event.eventPhoto != null}">

                                                 <img width="100%" src="${pageContext.request.contextPath}/resources/{{event.eventPhoto}}"/>

                                            </c:if>


                                        <h3>{{event.eventName}} <i class="fa fa-play-circle-o pull-right"></i></h3>
                                    </div>
                                    <div class="panel-body">
                                        <font color="tomato" style="font-weight: bold; font-size: 20px;">Creator: {{event.eventCreatorName}} </font><br/>
                                        Date: {{event.eventDate | date : "MMM d, y h:mm:ss a"}} <br/>
                                        <div id="timeBox"></div>

                                        <input type="hidden"  value="{{event.eventDate| date : 'MMM d, y h:mm:ss a'}}" id="timeHolder"/>

                                        <script type="text/javascript">
                                            cdtd();
                                        </script>
                                        Description : {{event.description}} <br/>
                                    </div>
                                </div>

                            </div>
                            <!-- .panel-body -->
                        </div>

                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            </div>


            <div class="col-md-7">
                <div class="row">
                    <!-- live video -->
                    <div class="col-md-12">
                        <div style="width:100%; height: 100%; background: #333; padding: 20px 20px 20px 20px; box-sizing: border-box;">
                            <iframe ng-if="videoToDisplay === ''" width="100%" height="360" src="https://www.youtube.com/embed/zMzYXOVp13c" frameborder="0" allowfullscreen></iframe>
                            <iframe ng-if="videoToDisplay !== ''" width="100%" height="360" src="{{videoToDisplay| trustAsResourceUrl}}" frameborder="0" allowfullscreen></iframe>

                            <a ng-if="clickedEvent.notesFile !== ''" href="${pageContext.request.contextPath}/resources/{{clickedEvent.notesFile}}" class="btn btn-success" style="margin-top: 15px;"><i class="fa fa-download"></i> Download Notes</a>
                            <a ng-if="clickedEvent.presentationFile !== ''" href="${pageContext.request.contextPath}/resources/{{clickedEvent.presentationFile}}" class="btn btn-success" style="margin-top: 15px;"><i class="fa fa-download"></i> Download Presentation</a>
                            <a ng-if="clickedEvent.notesFile !== '' || clickedEvent.presentationFile !== ''" href="" class="btn btn-warning pull-right" style="margin-top: 15px;">MCQ Exam</a>

                        </div>
                    </div>

                    <!-- comments -->

                </div>
            </div>
        </div>
        <div class="row">

            <div class="modal-body" style="overflow: auto;">

                <!-- comments -->
                <sec:authorize access="!isAuthenticated()">
                    <div class="col-md-4">
                        <h2>Please Login first to make and see the comments.</h2>
                        <a class="btn btn-warning" href="${pageContext.request.contextPath}/login"><i class="fa fa-link"></i> Login</a>
                    </div>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="col-md-12">
                        <!-- Left-aligned -->

                        <input type="hidden" ng-model="userName = '${username}'"/>
                        <input type="hidden" ng-model="eventId = ${event.eventId}"/>
                        <div class="form-group">
                            <label for="comment">Comment:</label>
                            <textarea ng-model="comment" class="form-control" rows="5" id="comment"></textarea>
                        </div>
                        <div class="form-group">
                            <button ng-click="submitComment()" type="submit" class="btn btn-primary"><i class="fa fa-send"></i> Submit</button>
                        </div>



                        <div class="" style="height: 370px; overflow:  scroll; scroll-behavior: inherit; border: 1px solid #DDD; box-sizing: border-box; box-shadow: 0px 0px 5px #DDD;">




                            <div ng-repeat="row in allComments" class="media" style="border-bottom: 1px solid #DDD;">
                                <div class="media-left">
                                    <img src="${pageContext.request.contextPath}/resources/img/avatar1.png" class="media-object" style="width:60px">
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">{{row.username}}</h4>
                                    <p>{{row.comment}}</p>
                                </div>

                                <div style="margin-left:40px;" ng-if="scrow.eventsCommentsId == row.eventsCommentsId" ng-repeat="scrow in allScomments">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="${pageContext.request.contextPath}/resources/img/avatar1.png" class="media-object" style="width:60px">

                                            </div>
                                            <div class="col-md-9">
                                                <h5 class="media-heading" style="font-weight: bold;">{{scrow.username}}</h5>
                                                <p>{{scrow.subComments}}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div style="margin-top: 5px;" id="collapse{{$index + 1}}" class="panel-collapse collapse">

                                    <div class="input-group">
                                        <input ng-bind="cid = {{row.eventsCommentsId}}" type="hidden" class="form-control">
                                        <input ng-model="subComments" type="text" class="form-control">
                                        <div class="input-group-btn btn-primary">
                                            <a ng-click="submitSubComment(subComments, cid)" href="" class="btn btn-primary">
                                                <i class="fa fa-send"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <a style="margin-top: 5px; margin-left:5px; margin-bottom: 5px;" class="btn btn-success btn-sm" data-toggle="collapse" data-parent="#accordion" href="#collapse{{$index + 1}}"> Reply </a>


                            </div>



                        </div>
                    </div>
                </sec:authorize>



            </div>
        </div>
    </div>
</div>
