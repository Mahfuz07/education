<script type="text/javascript">
    var postApp = angular.module("postApp", []);
    postApp.controller("postCtrl", function ($http, $scope) {

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

    });
    postApp.filter('cut', function () {
        return function (value, wordwise, max, tail) {
            if (!value)
                return '';
            max = parseInt(max, 10);
            if (!max)
                return value;
            if (value.length <= max)
                return value;
            value = value.substr(0, max);
            if (wordwise) {
                var lastspace = value.lastIndexOf(' ');
                if (lastspace !== -1) {
                    //Also remove . and , so its gives a cleaner result.
                    if (value.charAt(lastspace - 1) === '.' || value.charAt(lastspace - 1) === ',') {
                        lastspace = lastspace - 1;
                    }
                    value = value.substr(0, lastspace);
                }
            }
            return value + (tail || ' ...');
        };
    });
</script>

<div ng-app="postApp" ng-controller="postCtrl" class="col-md-12" style="margin-top: -10px;">
    <div class="Panel panel-default">
        <div class="panel-body" style="min-height: 600px; background: #fff;">
            <div class="col-md-8">
                <table id="dataTables-example" width="100%" style="">
                    <thead>
                        <tr>
                            <th style="width: 100%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="post in posts| orderBy: '-postId'" >
                            <td style="width: 100%">
                                <div class="post-box" style="margin-bottom: 20px; border-bottom: 1px dotted #DDD; padding-bottom: 20px;">
                                    <div class="row">
                                        <div class="col-md-11">
                                            <h2 style="margin: 0;">{{post.postTitle}}</h2>
                                        </div>
                                        <div class="col-md-1">
                                            <button class="btn btn-default pull-right"><i class="fa fa-eye"></i> {{post.views}}</button>
                                        </div>
                                    </div>
                                    <h5 style="font-weight: bold; color: tomato">{{post.postSubTitle}}</h5>
                                    <p>Category: {{post.subCategoryId}}</p>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p class="pull-left">Author: {{post.authorName| uppercase}}</p>
                                            <p class="pull-right">Published: {{post.postDate| date}}</p>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom: 10px;">
                                        <div ng-show="post.image" class="image_box col-md-4" style="margin-bottom: 10px;">
                                            <img src="${pageContext.request.contextPath}/resources/{{post.image}}" width="100%"/>
                                        </div>
                                        <div ng-show="post.image" class="content-box col-md-8" style="text-align: justify">
                                            <p>{{post.postContent| cut:true:500:' ...'}}</p>
                                        </div>
                                        <div ng-hide="post.image" class="content-box col-md-12" style="text-align: justify">
                                            <p>{{post.postContent| cut:true:500:' ...'}}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <a href="${pageContext.request.contextPath}/single_blog/{{post.postId}}" class="btn btn-success pull-right">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- widgets -->
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
