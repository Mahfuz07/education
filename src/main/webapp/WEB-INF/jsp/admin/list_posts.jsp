<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-cogs"></i> Manage Posts
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
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Manage Posts</h4>
                    </div>
                    <div class="panel-body">

                        <table style="text-align: center;"  width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Title</th>
                                    <th>SubTitle</th>
                                    <th>Sub Category</th>
                                    <th>Content</th>
                                    <th>Image</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th style="width: 105px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${posts}">
                                    <tr>
                                        <td>${row.postId}</td>
                                        <td>${row.postTitle}</td>
                                        <td>${row.postSubTitle}</td>
                                        <td>
                                            ${row.subCategoryId}
                                        </td>
                                        <td>${row.postContent}</td>
                                        <td>
                                            <c:if test="${row.image == null}">
                                                <a href="${pageContext.request.contextPath}/admin/uploadPostsPhoto/${row.postId}" class="btn btn-success"><i class="fa fa-arrow-up"></i> Upload Photo</a>
                                            </c:if>
                                            <c:if test="${row.image != null}">
                                                <img src="${pageContext.request.contextPath}/resources/${row.image}" width="150px" style="margin-bottom: 5px;"/>
                                                <a href="${pageContext.request.contextPath}/admin/uploadPostsPhoto/${row.postId}" class="btn btn-warning"><i class="fa fa-refresh"></i> Update Photo</a>
                                            </c:if> 
                                        </td>
                                        <td>${row.postDate}</td>
                                        <td>${row.status}</td>
                                        <td>
                                            <c:if test="${row.status == false}">
                                                <a href="${pageContext.request.contextPath}/admin/update_post_status/${row.postId}/${row.status}" class="btn btn-warning"><i class="fa fa-arrow-up"></i></a>
                                                </c:if>
                                                <c:if test="${row.status == true}">
                                                <a href="${pageContext.request.contextPath}/admin/update_post_status/${row.postId}/${row.status}" class="btn btn-default"><i class="fa fa-arrow-down"></i></a>
                                                </c:if>

                                            <a href="${pageContext.request.contextPath}/admin/edit_post/${row.postId}" class="btn btn-success"><i class="fa fa-edit"></i></a>
                                            <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/delete_post/${row.postId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>




    </div>
</div>

<%@include file="footer.jsp" %>