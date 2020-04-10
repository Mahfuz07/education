<script type="text/javascript">
    var courseApp = angular.module("courseApp", []);
    courseApp.controller("courseCtrl", function ($http, $scope) {

        $scope.courses = [];
        $scope.getAllCourse = function () {
            $http({
                method: 'GET',
                url: 'courses/all_courses_with_lesson_and_topics'
            }).then(function (response) {
                $scope.courses = response.data;
            });
        };
        $scope.getAllCourse();

    })
</script>

<div class="col-md-12" style="margin-top: -10px;">
    <div ng-app="courseApp" ng-controller="courseCtrl" class="col-md-12" style="background: #fff; padding: 20px; border: 1px solid #DDD;">
        <div class="row">
            <div class="col-md-4" ng-repeat="course in courses">
                <div class="panel panel-default" style="height: 336px; overflow: hidden;">
                    <div class="panel-heading" style="height: 80px; text-align: center; font-weight: bold; font-size: 16px;">
                        <a style="text-decoration: none; color: #555;" href="${pageContext.request.contextPath}/course/{{course.courseId}}">{{course.courseName}}</a>
                    </div>
                    <div ng-repeat="lesson in course.lessons| limitTo: 5" class="panel-body" style="border-bottom: 1px solid #DDD;">
                        <a style="text-decoration: none;" href="${pageContext.request.contextPath}/course/{{course.courseId}}">{{lesson.lessonTitle}}</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>