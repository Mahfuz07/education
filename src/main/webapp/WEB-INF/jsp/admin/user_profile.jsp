<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>

<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-user"></i> User Profile
                </h2>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <c:if test="${sm != null}">
                    <div class="alert alert-success alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> ${sm}
                    </div>
                </c:if>
                <c:if test="${em != null}">
                    <div class="alert alert-danger alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> ${em}
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row" style="margin-top: 20px;">
            <div class="col-md-12">
                <input id="userName" type="hidden" value="${username}"/>

                <div class="panel panel-primary">
                    <div class="panel-heading" style="height: auto;">
                        <c:choose>
                            <c:when test="${user.photo == null}">
                                <img style="cursor: pointer; border: 2px solid #fff;" data-toggle="modal" data-target="#editUserPhoto" width="150px" height="150px" src="${pageContext.request.contextPath}/resources/img/avatar1.png" alt=""/>
                            </c:when>
                            <c:otherwise>
                                <img style="cursor: pointer; border: 2px solid #fff;" data-toggle="modal" data-target="#editUserPhoto" width="200px" height="200px" src="${pageContext.request.contextPath}/resources/${user.photo}" alt=""/>
                            </c:otherwise>
                        </c:choose>
                        <h1>${user.username}</h1>
                        <h3>${user.email}</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-responsive">
                            <tr>
                                <th colspan="2">
                                    User Information
                                    <a data-toggle="modal" data-target="#editUserModal" href="" class="btn btn-warning pull-right"><i class="fa fa-edit"></i> Edit Info</a>
                                </th>
                            </tr>
                            <tr>
                                <th style="width: 25%">First Name</th>
                                <td>${user.firstName}</td>
                            </tr>
                            <tr>
                                <th>Last Name</th>
                                <td>${user.lastName}</td>
                            </tr>
                            <tr>
                                <th>Gender</th>
                                <td>
                                    <c:if test="${user.gender == true}">
                                        Male
                                    </c:if>
                                    <c:if test="${user.gender == false}">
                                        Female
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th>Date of Birth</th>
                                <td>${user.dob}</td>
                            </tr>
                            <tr>
                                <th>Mobile</th>
                                <td>${user.mobile}</td>
                            </tr>
                        </table>


                        <c:if test="${teacher.username != null}">
                            <table class="table table-bordered table-striped table-responsive">
                                <tr>
                                    <th colspan="2">
                                        Teacher Info
                                        <a data-toggle="modal" data-target="#editTeacherModal" href="" class="btn btn-warning pull-right"><i class="fa fa-edit"></i> Edit Teacher Info</a>
                                    </th>
                                </tr>
                                <tr>
                                    <th style="width: 25%">Designation</th>
                                    <td>${teacher.designation}</td>
                                </tr>
                                <tr>
                                    <th>Join Date</th>
                                    <td>${teacher.joinDate}</td>
                                </tr>
                                <tr>
                                    <th>Present Address</th>
                                    <td>${teacher.presentAddress}</td>
                                </tr>
                                <tr>
                                    <th>Permanent Address</th>
                                    <td>${teacher.permanentAddress}</td>
                                </tr>
                                <tr>
                                    <th>Details</th>
                                    <td>${teacher.details}</td>
                                </tr>
                            </table>
                        </c:if>

                    </div>



                    <div id="editUserModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <form action="${pageContext.request.contextPath}/admin/updateUserProfile" method="post">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Update User Info</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>First Name:</label>
                                            <input type="hidden" name="userId" value="${user.userId}" class="form-control"/>
                                            <input type="text" name="firstName" value="${user.firstName}" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name:</label>
                                            <input type="text" name="lastName" value="${user.lastName}" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Gender:</label>
                                            <div class="input-group">
                                                <input type="radio" name="gender" value="1" <c:if test="${user.gender == true}">checked=""</c:if>/> Male
                                                <input type="radio" name="gender" value="0" <c:if test="${user.gender == false}">checked=""</c:if>/> Female
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Date of Birth (dd-MM-yyyy)</label>
                                                <input type="text" name="dob" value="${user.dob}" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Mobile</label>
                                            <input type="text" name="mobile" value="${user.mobile}" class="form-control"/>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success pull-left">Update</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>  






                    <div id="editTeacherModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <form action="${pageContext.request.contextPath}/admin/updateTeacherProfile" method="post">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Update User Info</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Designation:</label>
                                            <input type="hidden" name="username" value="${teacher.username}" class="form-control"/>
                                            <input type="text" name="designation" value="${teacher.designation}" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Join Date:</label>
                                            <input type="text" name="joinDate" value="${teacher.joinDate}" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label>Present Address</label>
                                            <textarea name="presentAddress" class="form-control">${teacher.presentAddress}</textarea>

                                        </div>
                                        <div class="form-group">
                                            <label>Permanent Address</label>
                                            <textarea name="permanentAddress" class="form-control">${teacher.permanentAddress}</textarea>

                                        </div>
                                        <div class="form-group">
                                            <label>Details</label>
                                            <textarea name="details" class="form-control">${teacher.details}</textarea>

                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success pull-left">Update</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>   


                    <div id="editUserPhoto" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <form action="${pageContext.request.contextPath}/admin/updateUserPhoto" method="post" enctype="multipart/form-data">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Update User Photo</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <input type="hidden" name="username" value="${user.username}" class="form-control"/>

                                        </div>

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

                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success pull-left">Update</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>   














                </div>



            </div>
        </div>





    </div>
</div>

<%@include file="footer.jsp" %>