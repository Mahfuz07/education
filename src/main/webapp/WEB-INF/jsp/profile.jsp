
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var profileApp = angular.module("profileApp", []);
    profileApp.controller("profileCtrl", function ($http, $scope) {

        //get user info by username
        $scope.user = {};
        $scope.username = document.getElementById("userName").value;
        $scope.getUser = function () {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/users/userByUserName/' + $scope.username
            }).then(function (response) {
                $scope.user = response.data;
            });
        };
        $scope.getUser();

        //display Student Info table
        $scope.userStudent = {};
        $scope.displayStudentTable = function () {
            //get student info by username
            $http({
                method: 'GET',
                url: 'http://localhost:8080/students/student/' + $scope.username
            }).then(function (response) {
                $scope.userStudent = response.data;
            });


            //table display management
            document.getElementById("studentTable").style = "display: inline";
            document.getElementById("studentUpdateTable").style = "display: none";
        };

        //display student info Update table
        $scope.displayStudentEditTable = function () {
            document.getElementById("studentTable").style = "display: none";
            document.getElementById("studentUpdateTable").style = "display: inline";
        };

        //get user student info



        //update not user info
        $scope.displayUserInfoUpdateTable = function () {
            document.getElementById("userInfoUpdateTable").style = "display:block";
            document.getElementById("userInfoTable").style = "display:none";

        };


    });
</script>

<div class="col-md-12" ng-app="profileApp" ng-controller="profileCtrl">

    <input type="hidden" id="userName" value="${username}"/>
    <img data-toggle="modal" data-target="#myModal" ng-if="user.photo === null" width="200px" class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/resources/img/avatar1.png" alt=""/>
    <img data-toggle="modal" data-target="#myModal" ng-if="user.photo !== null" width="200px" class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/resources/{{user.photo}}" alt=""/>
    <span style="margin-left: 10px; font-size: 30px; font-weight: bold;">{{user.username| uppercase}}</span>

    <div class="panel panel-default" style="margin-top: -80px;">
        <div class="panel-heading" style="height: 80px; padding-left: 205px; font-weight: bold;">
            <p ng-if="user.userType === 'ROLE_USER'">Role: USER</p>
            <p ng-if="user.userType === 'ROLE_STUDENT'">Role: STUDENT</p>
            <p>Email: {{user.email}}</p>
        </div>

        <div class="panel-body">

            <table id="userInfoTable" class="table table-bordered table-striped table-responsive">
                <tr>
                    <th style="font-size: 25px;" colspan="2">User Information <a ng-click="displayUserInfoUpdateTable()" href="" class="btn btn-success pull-right"><i class="fa fa-edit"></i> Edit Profile</a></th>
                </tr>
                <tr>
                    <th style="width: 20%">First Name</th>
                    <td>{{user.firstName}}</td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td>{{user.lastName}}</td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>
                        <p ng-if="user.gender === true">Male</p>
                        <p ng-if="user.gender === false">Female</p>
                    </td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>{{user.email}}</td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td>{{user.dob| date: "dd/MM/yyyy"}}</td>
                </tr>
                <tr>
                    <th>Role</th>
                    <td>
                        <p ng-if="user.userType === 'ROLE_USER'">USER</p>
                        <p ng-if="user.userType === 'ROLE_STUDENT'">STUDENT</p>
                    </td>
                </tr>
                <tr>
                    <th>Mobile</th>
                    <td>{{user.mobile}}</td>
                </tr>

            </table>

            <form action="${pageContext.request.contextPath}/updateUserInfo" method="post">
                <table style="display: none" id="userInfoUpdateTable" class="table table-bordered table-striped table-responsive">
                    <tr>
                        <th style="font-size: 25px;" colspan="2"><i class="fa fa-edit"></i> Edit User Information <a href="" class="btn btn-default pull-right"><i class="fa fa-refresh"></i> Update Profile</a></th>
                    </tr>
                    <tr>
                        <th style="width: 20%">Username</th>
                        <td><input readonly="" type="text" name="username" value="{{user.username}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th style="width: 20%">First Name</th>
                        <td><input type="text" name="firstName" value="{{user.firstName}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Last Name</th>
                        <td><input type="text" name="lastName" value="{{user.lastName}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Gender</th>
                        <td>
                            <div class="input-group">
                                <input type="radio" name="gender" value="1" ng-checked="user.gender === true"/> Male
                                <input type="radio" name="gender" value="0" ng-checked="user.gender === false"/> Female
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><input type="email" value="{{user.email}}" name="email" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Date of Birth (dd-MM-yyyy)</th>
                        <td>
                            <input type="date" class="form-control" value="{{user.dob}}" name="dob" />

                        </td>
                    </tr>
                    <tr>
                        <th>Role</th>
                        <td>
                            <p ng-if="user.userType === 'ROLE_USER'">USER</p>
                            <p ng-if="user.userType === 'ROLE_STUDENT'">STUDENT</p>
                        </td>
                    </tr>
                    <tr>
                        <th>Mobile</th>
                        <td><input type="text" name="mobile" class="form-control" value="{{user.mobile}}"/></td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <button type="submit" class="btn btn-success"><i class="fa fa-refresh"></i> Update</button>
                        </th>
                    </tr>

                </table>
            </form>






            <button ng-if="user.userType === 'ROLE_STUDENT'" ng-click="displayStudentTable()" class="btn btn-warning" style="margin-bottom: 10px;"><i class="fa fa-search-plus"></i> Show Student Info</button>

            <table id="studentTable" style="display: none;" ng-if="user.userType === 'ROLE_STUDENT'" class="table table-bordered table-responsive table-striped">
                <tr>
                    <th style="font-size: 25px;" colspan="2">Student Information <a ng-click="displayStudentEditTable()" href="" class="btn btn-success pull-right"><i class="fa fa-edit"></i> Edit Student Info</a></th>
                </tr>
                <tr>
                    <th style="width: 20%;">Father Name</th>
                    <td>{{userStudent.fatherName}}</td>
                </tr>
                <tr>
                    <th>Mother Name</th>
                    <td>{{userStudent.motherName}}</td>
                </tr>
                <tr>
                    <th>Religion</th>
                    <td>{{userStudent.religion}}</td>
                </tr>
                <tr>
                    <th>Nationality</th>
                    <td>{{userStudent.nationality}}</td>
                </tr>
                <tr>
                    <th>Father Mobile</th>
                    <td>{{userStudent.fatherMobile}}</td>
                </tr>
                <tr>
                    <th>Mother Mobile</th>
                    <td>{{userStudent.motherMobile}}</td>
                </tr>
                <tr>
                    <th>Home Mobile</th>
                    <td>{{userStudent.homeMobile}}</td>
                </tr>
                <tr>
                    <th>Present Address</th>
                    <td>{{userStudent.presentAddress}}</td>
                </tr>
                <tr>
                    <th>Permanent Address</th>
                    <td>{{userStudent.permanentAddress}}</td>
                </tr>
            </table>



            <!-- student edit table -->
            <form action="${pageContext.request.contextPath}/updateStudentInfo" method="post">
                <table id="studentUpdateTable" style="display: none; width: 100%" ng-if="user.userType === 'ROLE_STUDENT'" class="table table-bordered table-responsive table-striped">

                    <tr>
                        <th style="font-size: 25px;" colspan="2"><i class="fa fa-edit"></i> Edit Student Information <a ng-click="" href="" class="btn btn-default pull-right"><i class="fa fa-refresh"></i> Update Student Info</a></th>
                    </tr>
                    <tr>
                        <th style="width: 20%;">User Name</th>
                        <td><input type="text" name="username" value="${username}" class="form-control" readonly=""/></td>
                    </tr>
                    <tr>
                        <th style="width: 20%;">Father Name</th>
                        <td><input type="text" name="fatherName" value="{{userStudent.fatherName}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Mother Name</th>
                        <td><input type="text" name="motherName" value="{{userStudent.motherName}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Religion</th>
                        <td><input type="text" name="religion" value="{{userStudent.religion}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Nationality</th>
                        <td><input type="text" name="nationality" value="{{userStudent.nationality}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Father Mobile</th>
                        <td><input type="text" name="fatherMobile" value="{{userStudent.fatherMobile}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Mother Mobile</th>
                        <td><input type="text" name="motherMobile" value="{{userStudent.motherMobile}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Home Mobile</th>
                        <td><input type="text" name="homeMobile" value="{{userStudent.homeMobile}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Present Address</th>
                        <td><input type="text" name="presentAddress" value="{{userStudent.presentAddress}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th>Permanent Address</th>
                        <td><input type="text" name="permanentAddress" value="{{userStudent.permanentAddress}}" class="form-control"/></td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <button type="submit" class="btn btn-success"><i class="fa fa-refresh"></i> Update</button>
                        </th>
                    </tr>
                </table>
            </form>





            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Update Profile Photo</h4>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/updateUserPhoto" method="post" enctype="multipart/form-data">

                                <input type="hidden" name="username" value="${username}"/>

                                <div class="form-group">
                                    <label class="control-label">Upload Photo: Required Size (200 x 200)px</label>
                                    <div class="input-group">
                                        <label class="input-group-btn">
                                            <span class="btn btn-primary">
                                                Brows &hellip; <input accept=".jpg, .jpeg, .png" type="file" name="file" style="display: none;">
                                            </span>
                                        </label>
                                        <input type="text" class="form-control" readonly>
                                    </div>
                                </div>


                                <div class="form-group"> 
                                    <button type="submit" class="btn btn-success">Update</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>



</div>
