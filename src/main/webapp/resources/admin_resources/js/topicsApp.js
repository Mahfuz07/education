var topicsApp = angular.module("topicsApp", []);

topicsApp.controller("topicsCtrl", function($scope, $http){
    
    //get All Courses
    $scope.courses = [];
    $scope.getAllCourse = function(){
        $http({
            method: 'GET',
            url: 'topics/allCoursesInfo'
        }).then(function (response) {
            $scope.courses = response.data;
        });
    };
    $scope.getAllCourse();
    
    
    $scope.clickedCourse = {};
    
    $scope.lessons = [];
    $scope.getAllLessonsByCourseId = function(){
//        alert($scope.clickedCourse.courseId);
        $http({
            method: 'GET',
            url: 'topics/lessonByCourseId/' + $scope.clickedCourse.courseId
        }).then(function (response) {
            $scope.lessons = response.data;
        });
        //alert($scope.lessons[0].lessonTitle);
    };
    
    $scope.clickedLesson = {};
    
});