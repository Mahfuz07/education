<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-tags"></i> Edit Sub Category
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
                            <i class="fa fa-edit"></i> Edit Sub Category
                        </div>
                        <div class="panel-body">
                            <form action="${pageContext.request.contextPath}/admin/updateSubCategory" method="post">
                                <div class="form-group">
                                    <label>Select Category</label>
                                    <select id="categoryId" name="categoryId" class="form-control">
                                        <option value="0">--- Select Category Name --</option>
                                        <c:forEach var="row" items="${categories}">
                                            <option value="${row.categoryId}">${row.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Sub Category Name</label>
                                    <input value="${subCategory.subCategoryId}" type="hidden" name="subCategoryId" class="form-control"/>
                                    <input value="${subCategory.subCategoryName}" type="text" name="subCategoryName" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control">${subcategory.description}</textarea>
                                </div>
                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Update</button>
                                <a href="${pageContext.request.contextPath}/admin/list_sub_category" class="btn btn-warning pull-right"><i class="fa fa-backward"></i> Back to list</a>
                            </form>
                        </div>
                    </div>

                </div>
            </div>






        </div>





    </div>
</div>
<script type="text/javascript">
    document.getElementById("categoryId").value = ${subCategory.categoryId};
</script>
<%@include file="footer.jsp" %>