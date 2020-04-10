<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-pencil"></i> Add Post
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
                <div class="row">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-edit"></i> Create Post
                        </div>
                        <div class="panel-body">
                            <form action="${pageContext.request.contextPath}/admin/updatePost" method="post">
                                <div class="form-group">
                                    <label>Post Title</label>
                                    <input type="hidden" name="postId" value="${post.postId}" class="form-control"/>
                                    <input type="text" name="postTitle" value="${post.postTitle}" class="form-control"/>
                                </div>

                                <div class="form-group">
                                    <label>Post Subtitle</label>
                                    <input type="text" name="postSubTitle" value="${post.postSubTitle}" class="form-control"/>
                                </div>

                                <div class="form-group">
                                    <label>Post Content</label>
                                    <textarea name="postContent" class="form-control" rows="10">${post.postContent}</textarea>
                                </div>

                                <div class="form-group">
                                    <label>Select Sub Categories</label>
                                    <div class="input-group">
                                        <c:forEach var="row" items="${subCategories}">
                                            <input type="checkbox" name="subCategoryId" value="${row.subCategoryName}"/> ${row.subCategoryName}
                                        </c:forEach>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Update</button>
                                <a href="${pageContext.request.contextPath}/admin/list_posts" class="btn btn-warning pull-right"><i class="fa fa-backward"></i> Back to List</a>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>