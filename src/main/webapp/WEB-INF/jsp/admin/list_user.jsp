<%@include file="header.jsp" %>

<div id="page-wrapper"  style="min-height: 800px;">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-list-ul"></i> Users List
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

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4>Users List</h4>
                    </div>
                    <div class="panel-body">
                        
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>User Name</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th style="width: 150px; text-align: center;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="row" items="${users}">
                                        <tr>
                                            <td>${row.userId}</td>
                                            <td>${row.username}</td>
                                            <td>${row.email}</td>
                                            <td>${row.authority}</td>
                                            <td>${row.enabled}</td>
                                            <td style="text-align: center;">
                                                <c:if test="${row.enabled == false}">
                                                    <a href="${pageContext.request.contextPath}/admin/update_user_status/${row.userId}/${row.enabled}" class="btn btn-warning"><i class="fa fa-arrow-up"></i></a>
                                                    </c:if>
                                                    <c:if test="${row.enabled == true}">
                                                    <a href="${pageContext.request.contextPath}/admin/update_user_status/${row.userId}/${row.enabled}" class="btn btn-default"><i class="fa fa-arrow-down"></i></a>
                                                    </c:if>

                                                <!--<a href="${pageContext.request.contextPath}/admin/edit_user/${row.userId}" class="btn btn-success"><i class="fa fa-edit"></i></a>-->
                                                <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/delete_user/${row.userId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            
                    </div>
                    <div class="panel-footer"></div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>User Role List</h4>
                    </div>
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-responsive">
                            <thead>
                                <tr>
                                    <th style="width: 35px;">ID</th>
                                    <th>Role Name</th>
                                    <th style="width: 50px; text-align: center;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${userRoles}">
                                    <tr>
                                        <td>${row.roleId}</td>
                                        <td>${row.roleName}</td>
                                        <td style="text-align: center;">                                            
                                            <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/delete_user_role/${row.roleId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer"></div>
                </div>
            </div>
        </div>


    </div>

</div>

<%@include file="footer.jsp" %>