
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>--%>
<script type="text/javascript">
    var liveApp = angular.module("liveApp", []);
    liveApp.controller("liveCtrl", function ($http, $scope) {

        $scope.courses = [];
        $scope.getAllCourse = function () {
            $http({
                method: 'GET',
                url: '/courses/course_with_details_by_cid/' + ${courseId}}).then(function (response) {
                $scope.courses = response.data;
            });
        };
        $scope.getAllCourse();
        $scope.selectedtopics = {};
        $scope.clickedTopics = function (topics, pptFile, notesFile, lessonId) {
            $scope.lessonId = lessonId;
            $scope.selectedtopics = topics;
            $scope.pptFile = pptFile;
            $scope.notesFile = notesFile;
            $scope.getAllComments($scope.selectedtopics.topicsId);
//            alert("topics = " + $scope.selectedtopics.topicsId);
//            alert("topics = " + $scope.selectedtopics.topicsTitle);
//            alert("topics = " + $scope.selectedtopics.videoUrl);
        };
        
        
        //comments section start from here
        //get comments
        $scope.allComments = [];
        $scope.getAllComments = function(id){
            $http({
                method: 'GET',
                url: '/comments/allCommentsByTopicsId/' + id
            }).then(function (response) {
                $scope.allComments = response.data;
            });
        };
        
        
        //save commens
        $scope.comment = "";
        $scope.userName = "";
        $scope.topicsId = "";
        $scope.submitComment = function(){
//            alert($scope.userName);
//            alert($scope.topicsId);
//            alert($scope.comment);
            
            $scope.commentToSave = {'commentsId':'','username':'','topicsId':'','comment':''};
            
            $scope.commentToSave.comment = $scope.comment;
            $scope.commentToSave.username = $scope.userName;
            $scope.commentToSave.topicsId = $scope.topicsId;
            
            $http({
            method: 'POST',
                    url: '/comments/saveComments',
                    data: angular.toJson($scope.commentToSave),
                    headers: {
                        'Content-Type': 'application/json'
                    }
            }).then(function (response) {
//                $scope.receiveSaveComments = response.data();
//                $scope.message = "Comment Saved Successfully";
//                alert($scope.message);
                $scope.getAllComments($scope.topicsId);
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
                url: '/subComments/allSubComments'
            }).then(function (response) {
                $scope.allScomments = response.data;
            });
        };
        $scope.getAllSComments();
        
        
        //save sub comments
        $scope.cid = "";
        $scope.subComments = "";
        $scope.submitSubComment = function(subComments, cid){
            $scope.subComments = subComments;
            $scope.cid = cid;
//            alert($scope.subComments);
//            alert($scope.cid);
            $scope.sComments = {'subCommentsId':'','commentsId':'','subComments':'','username':''};
            $scope.sComments.commentsId = $scope.cid;
            $scope.sComments.subComments = $scope.subComments;
            $scope.sComments.username = $scope.userName;
            
            $http({
            method: 'POST',
                    url: '/subComments/saveSubComments',
                    data: angular.toJson($scope.sComments),
                    headers: {
                        'Content-Type': 'application/json'
                    }
            }).then(function (response) {;
                $scope.getAllComments($scope.topicsId);
                $scope.getAllSComments();
            }, function (reason) {
                $scope.error_message = reason.data;
            });
            
        };
        
        
    });
    liveApp.filter('trustAsResourceUrl', ['$sce', function ($sce) {
            return function (val) {
                return $sce.trustAsResourceUrl(val);
            };
        }]);


</script>

<div class="col-md-12" style="margin-top: -10px;">
    <div class="col-md-12" ng-app="liveApp" ng-controller="liveCtrl" style="background: #fff; padding: 20px; border:1px solid #DDD;">
    <div class="row">

        <div class="col-md-6">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default" ng-repeat="course in courses">
                        <div class="panel-heading">
                            <b>Course:  {{course.courseName}}</b>
                        </div>
                        <!-- .panel-heading -->
                        <div class="panel-body">
                            <div ng-repeat="lesson in course.lessons" class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a style="text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#collapse{{$index + 1}}"> Lesson: &nbsp; {{lesson.lessonTitle}} <i class="fa fa-chevron-down pull-right"></i></a>
                                        </h4>
                                    </div>
                                    <div id="collapse{{$index + 1}}" class="panel-collapse collapse">
                                        <div ng-click="clickedTopics(topics, lesson.presentationFile, lesson.notesFile, lesson.lessonId)" data-toggle="modal" data-target="#videoModal" class="panel-body" ng-repeat="topics in lesson.topicses" style="cursor: pointer;">
                                            {{$index + 1}}. {{topics.topicsTitle}} <i class="fa fa-play-circle pull-right"></i>
                                        </div>
                                    </div>
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

        <div id="videoModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" style="width: 90%;">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <a href="${pageContext.request.contextPath}/course/${courseId}" class="btn btn-default pull-right">&times;</a>
                        <h4 class="modal-title">{{selectedtopics.topicsTitle}}</h4>
                    </div>
                    <div class="modal-body" style="overflow: auto;">
                        <div class="col-md-8">
                            <div class="courseVideoFrame" style="width:100%; height: 100%; background: #333; padding: 20px 20px 20px 20px; box-sizing: border-box;">
                                <iframe width="854" height="480" src="{{selectedtopics.videoUrl| trustAsResourceUrl}}" frameborder="0" allowfullscreen></iframe>
                                
                                <!--<div class="col-md-12"></div>-->
                                <a href="{{notesFile}}" class="btn btn-success" style="margin-top: 15px;"><i class="fa fa-download"></i> Download Notes</a>
                                <a href="{{pptFile}}" class="btn btn-success" style="margin-top: 15px;"><i class="fa fa-download"></i> Download Presentation</a>
                                <c:if test="${username == null}">
                                    <button onclick="alert('Please Login First to give Exam')" class="btn btn-warning pull-right" style="margin-top: 15px;">MCQ Exam</button>
                                </c:if>
                                <c:if test="${username != null}">
                                    <a href="${pageContext.request.contextPath}/lessonMcqTest/{{lessonId}}" class="btn btn-warning pull-right" style="margin-top: 15px;">MCQ Exam</a>
                                </c:if>
                            
                            </div>
                        </div>

                        <!-- comments -->
                        <sec:authorize access="!isAuthenticated()">
                            <div class="col-md-4">
                                <h2>Please Login first to make and see the comments.</h2>
                                <a class="btn btn-warning" href="${pageContext.request.contextPath}/login"><i class="fa fa-link"></i> Login</a>
                            </div>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <div class="col-md-4">
                            <!-- Left-aligned -->
                            
                            <input type="hidden" ng-model="userName = '${username}'"/>
                            <input type="hidden" ng-model="topicsId = selectedtopics.topicsId"/>
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
                
                                    <div style="margin-left:40px;" ng-if="scrow.commentsId == row.commentsId" ng-repeat="scrow in allScomments">
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
                                            <input ng-bind="cid = {{row.commentsId}}" type="hidden" class="form-control">
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
                    <div class="modal-footer">
                        <a href="${pageContext.request.contextPath}/course/${courseId}" class="btn btn-danger"><i class="fa fa-times"></i> Close</a>
                        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                    </div>
                </div>

            </div>
        </div>


        <div class="col-md-6">
            <div class="row">
                <!-- live video -->
                <div class="col-md-12">
                    <div ng-repeat="course in courses" style="width:100%; height: 100%; background: #333; padding: 20px 20px 20px 20px; box-sizing: border-box;">
                        <p style="color: #fff;">Course Intro</p>
                        <iframe width="100%" height="360" src='{{course.introVideo | trustAsResourceUrl}}' frameborder="0" allowfullscreen></iframe>
                        <a href="${pageContext.request.contextPath}/resources/{{course.courseBook}}" class="btn btn-success" style="margin-top: 15px; width: 100%"><i class="fa fa-download"></i> Download Course Book</a>
                    </div>
                </div>

                
                
            </div>
        </div>
    </div>
 </div>
</div>
