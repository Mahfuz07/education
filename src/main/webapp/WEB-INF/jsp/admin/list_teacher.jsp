<%@include file="header.jsp" %>

<div id="page-wrapper"  style="min-height: 800px;">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-list-ul"></i> Manage Student
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
                        <h4>Student List</h4>
                    </div>
                    <div class="panel-body">

                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>Photo</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Status</th>
                                    <th style="width: 150px; text-align: center;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${users}">
                                    <tr>
                                        <td>${row.userId}</td>
                                        <td>${row.username}</td>
                                        <td style="width: 100px; text-align: center;">
                                            <img width="100px" src="${pageContext.request.contextPath}/resources/${row.photo}" alt="${row.username}"/>
                                        </td>
                                        
                                        <td>${row.email}</td>
                                        <td>${row.mobile}</td>
                                        
                                        <td>${row.enabled}</td>
                                        <td style="text-align: center;">
                                            <c:if test="${row.enabled == false}">
                                                <a href="${pageContext.request.contextPath}/admin/update_teacher_status/${row.userId}/${row.enabled}" class="btn btn-warning"><i class="fa fa-arrow-up"></i></a>
                                                </c:if>
                                                <c:if test="${row.enabled == true}">
                                                <a href="${pageContext.request.contextPath}/admin/update_teacher_status/${row.userId}/${row.enabled}" class="btn btn-default"><i class="fa fa-arrow-down"></i></a>
                                                </c:if>

                                            <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/delete_teacher/${row.userId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
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