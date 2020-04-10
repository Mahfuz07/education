<%@include file="header.jsp" %>

<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-edit"></i> Edit User
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
                        <h4>Edit User Info</h4>
                    </div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/admin/updateUser" method="post" commandName="users">
                            <div class="form-group">
                                <label class="control-label" for="userName">User Name:</label>
                                <input value="${user.userId}" name="userId" type="hidden" class="form-control"/>
                                <input value="${user.username}" name="username" type="text" class="form-control" id="userName"/>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="role">Role: </label>
                                <select name="authority" class="form-control" id="authority">
                                    <c:forEach var="row" items="${userRoles}">
                                        <option value="${row.roleName}">${row.roleName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group"> 
                                <button type="submit" class="btn btn-success">Update</button>
                                <button type="reset" class="btn btn-default">Reset</button>
                                <a href="${pageContext.request.contextPath}/admin/list_user" class="btn btn-warning pull-right">List Page</a>
                            </div>
                        </form>
                    </div>
                    <div class="panel-footer"></div>
                </div>

            </div>

        </div>





    </div>
</div>

<script type="text/javascript">
    document.getElementById("authority").value = "${user.authority}";
</script>

<%@include file="footer.jsp" %>