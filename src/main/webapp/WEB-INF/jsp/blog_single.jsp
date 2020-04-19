<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var post2App = angular.module("post2App", []);
    post2App.controller("post2Ctrl", function ($http, $scope) {

        $scope.posts = [];
        $scope.getAllPost = function () {
            $http({
                method: 'GET',
                url: 'posts/allPosts'
            }).then(function (response) {
                $scope.posts = response.data;
            });
        };
        $scope.getAllPost();



//        $scope.rating = function () {
//            $scope.ratings = {'ratingId': '', 'rating': '', 'postId': '', 'topicsId': '', 'eventId': '', 'username': ''};
//            $scope.ratings.rating = document.getElementById("input-21e").value;
//            $scope.ratings.postId = document.getElementById("postId").value;
//            $http({
//                method: 'POST',
//                url: 'http://localhost:8080/BlendedEducationSystem/ratings/savePostRatings',
//                data: angular.toJson($scope.ratings),
//                headers: {
//                    'Content-Type': 'application/json'
//                }
//            }).then(function (response) {
//                $scope.os = 1;
//            }, function (reason) {
//                $scope.oe = 0;
//            });
//        };

    });
</script>

<div ng-app="post2App" ng-controller="post2Ctrl" class="col-md-12" style="margin-top: -10px;">
    <div class="Panel panel-default">
        <div class="panel-body" style="min-height: 600px; background: #fff;">
            <div class="col-md-8">
                <div class="post-box" style="margin-bottom: 20px; padding-bottom: 20px;">
                    <div class="row">
                        <div class="col-md-11">
                            <h2 style="margin: 0;">${post.postTitle}</h2>
                        </div>
                        <div class="col-md-1">
                            <button class="btn btn-default pull-right"><i class="fa fa-eye"></i> ${post.views}</button>
                        </div>
                    </div>
                    <h5 style="font-weight: bold; color: tomato">${post.postSubTitle}</h5>
                    <p>Category: ${post.subCategoryId}</p>
                    <div class="row">
                        <div class="col-md-12">
                            <p class="pull-left">Author: ${post.authorName}</p>
                            <p class="pull-right">Published: ${post.postDate}</p>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <c:if test="${post.image != null}">
                            <div class="image_box col-md-12" style="margin-bottom: 10px;">
                                <img src="${pageContext.request.contextPath}/resources/${post.image}" width="100%"/>
                            </div>
                        </c:if>

                        <div class="content-box col-md-12" style="text-align: justify">
                            <p>${post.postContent}</p>
                        </div>
                    </div>

                    <sec:authorize access="isAuthenticated()">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <form action="${pageContext.request.contextPath}/savePostRatings" method="post">
                                    <div class="col-md-3" style="line-height: 30px;"><label>Rating: </label></div>
                                    <div class="col-md-12">
                                        <input type="hidden" name="postId" id="postId" value="${post.postId}"/>
                                        <input id="input-21e" name="rating" value="0" type="text" class="rating" data-min=0 data-max=5 data-step=1 data-size="xs" title="">
                                        <button type="submit" style="margin-top: 10px;">Submit</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                       </sec:authorize>
                </div>
            </div>


            <div class="col-md-4">
                <div class="panel panel-default" style="margin-bottom: 60px;">
                    <div class="panel-heading">
                        Recent Posts
                    </div>
                    <div class="panel-body" style="padding: 0">
                        <div class="list-group">
                            <span ng-repeat="post in posts| orderBy: '-postId' | limitTo: 5">
                                <a  href="${pageContext.request.contextPath}/single_blog/{{post.postId}}" class="" style="display: block; padding: 10px; border-bottom: 1px solid #DDD;">{{post.postTitle}}</a>
                                                                            </span>
                                                                        </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="panel panel-default" style="margin-bottom: 60px;">
                                                                                <div class="panel-heading">
                                                                                    Popular Posts
                                                                                </div>
                                                                                <div class="panel-body" style="padding: 0">
                                                                                    <div class="list-group">
                                                                                        <span ng-repeat="post in posts| orderBy: '-views' | limitTo: 5">
                                                                                            <a  href="${pageContext.request.contextPath}/single_blog/{{post.postId}}" class="" style="display: block; padding: 10px; border-bottom: 1px solid #DDD;">{{post.postTitle}}</a>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        </div>
                                                                        </div>

                                                                        </div>
                                                                        <script type="text/javascript">

                                                                        </script>