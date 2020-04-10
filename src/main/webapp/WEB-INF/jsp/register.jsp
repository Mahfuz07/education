<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
</script>

<script type="text/javascript">
     var registerApp = angular.module("registerApp", []);
    registerApp.controller("registerCtrl", function ($http, $scope) {
        $scope.myUrl="${pageContext.request.contextPath}";
        $scope.users = [];
        $scope.getAllUsers = function () {
            $http({
                method: 'GET',
                url:'users/allUsers'
            }).then(function (response) {
                $scope.users = response.data;
            });
        };
        $scope.getAllUsers();
        
        //check username
        $scope.username = "";
        $scope.errorUserName = "";
        $scope.checkUserNameExists = function(){
            
            for (var i = 0; i < $scope.users.length; i++) {
                if($scope.users[i].username == $scope.username){
                    $scope.errorUserName = "Username already exist. Try another one";
                    document.getElementById('submit').style = "display:none";
                    break;
                }else{
                    $scope.errorUserName = "";
                    document.getElementById('submit').style = "display:inline-block";
                }
            }
    
        };
        
        //check email
        $scope.email = "";
        $scope.errorEmail = "";
        $scope.checkEmailExists = function(){
            
            for (var i = 0; i < $scope.users.length; i++) {
                if($scope.users[i].email == $scope.email){
                    $scope.errorEmail = "Email already exist. Try another one";
                    document.getElementById('submit').style = "display:none";
                    break;
                }else{
                    $scope.errorEmail = "";
                    document.getElementById('submit').style = "display:inline-block";
                }
            }
    
        };
        
        
        
        
    });  
</script>
<div class="col-md-12" ng-app="registerApp" ng-controller="registerCtrl">
    <div class="col-md-12" style="height:590px ; margin-bottom: 10px;border:1px solid #DDD; padding: 10px; border-radius: 5px; background: url('resources/img/register_page_background.jpg') no-repeat #31b131; background-size: cover; baseline-shift: super;">

        <c:if test="${sm != null}">
            <div class="alert alert-success alert-dismissable col-md-6">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Success!</strong> ${sm}
            </div>
        </c:if>
        <c:if test="${em != null}">
            <div class="alert alert-danger alert-dismissable col-md-6">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Error!</strong> ${em}
            </div>
        </c:if>

        <div class="panel panel-default col-md-offset-8">
            <div class="panel-heading">
                <h3 style="margin: 0px;" align="center"><i class="fa fa-registered"></i> Register</h3>
            </div>
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/register" method="post">
                    <div class="form-group">
                        <label>Select User Type</label>
                        <select name="userType" class="form-control">
                            <c:forEach var="row" items="${userRoles}">
                                <c:if test="${row.roleName != 'ROLE_ADMIN'}">
                                    <option value="${row.roleName}">
                                        <c:choose>
                                            <c:when test="${row.roleName == 'ROLE_USER'}">
                                                <c:out value="User"/>
                                            </c:when>
                                            <c:when test="${row.roleName == 'ROLE_STUDENT'}">
                                                <c:out value="Student"/>
                                            </c:when>
                                            <c:when test="${row.roleName == 'ROLE_TEACHER'}">
                                                <c:out value="Teacher"/>
                                            </c:when>
                                        </c:choose>
                                    </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>User Name:</label>
                        <input autocomplete="0" ng-model="username" ng-change="checkUserNameExists()" type="text" name="username" class="form-control" placeholder="Enter Username" required=""/>
                        <span style="color: tomato;">{{errorUserName}}</span>
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input ng-model="email" ng-change="checkEmailExists()" type="email" name="email" class="form-control" placeholder="Enter valid email address" required=""/>
                        <span style="color: tomato;">{{errorEmail}}</span>
                    </div>
                    <div class="form-group">
                        <label>Password: (4 to 8 character long)</label>
                        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Enter Password" required="" minlength="4" maxlength="8"/>
                    </div>
                    <div class="form-group">
                        <label>Gender:</label>
                        <div class="input-group">
                            <input type="radio" name="gender" value="1" checked=""/> Male
                            <input type="radio" name="gender" value="0"/> Female
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Date of Birth: (dd-MM-yyyy)</label>
                        <input type="datetime" name="dob" class="form-control" required=""/>
                    </div>


                    <button id="submit" type="submit" class="btn btn-success">Register</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </form>
            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>

</div>