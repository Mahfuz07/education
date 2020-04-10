<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-file"></i> Batch
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
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Course List</h4>
                    </div>
                    <div class="panel-body">

                        <table  width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Code</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Pdf Book</th>
                                    <th>Intro Video</th>
                                    <th>Status</th>
                                    <th style="width: 105px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${courses}">
                                    <tr>
                                        <td>${row.courseId}</td>
                                        <td>${row.courseCode}</td>
                                        <td>${row.courseName}</td>
                                        <td>${row.description}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.courseBook != null}">
                                                    <a style="margin-bottom: 5px;" class="btn btn-default" href="${pageContext.request.contextPath}/resources/${row.courseBook}"><i class="fa fa-file-pdf-o"></i></a>
                                                    <a href="${pageContext.request.contextPath}/admin/editCourseBook/${row.courseId}" class="btn btn-warning"><i class="fa fa-refresh"></i> Update Book</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${pageContext.request.contextPath}/admin/editCourseBook/${row.courseId}" class="btn btn-primary"><i class="fa fa-plus"></i> Add Book</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.introVideo == null}">
                                                    <a href="${pageContext.request.contextPath}/admin/editCourseVideo/${row.courseId}" class="btn btn-primary"><i class="fa fa-plus"></i> Add Intro Video</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <iframe src="${row.introVideo}"></iframe>
                                                    <a href="${pageContext.request.contextPath}/admin/editCourseVideo/${row.courseId}" class="btn btn-warning"><i class="fa fa-refresh"></i> Update Video</a>
                                                </c:otherwise>
                                            </c:choose>
                                            
                                        </td>
                                        <td>${row.status}</td>
                                        <td>
                                            <c:if test="${row.status == false}">
                                                <a href="${pageContext.request.contextPath}/admin/update_course_status/${row.courseId}/${row.status}" class="btn btn-warning"><i class="fa fa-arrow-up"></i></a>
                                                </c:if>
                                                <c:if test="${row.status == true}">
                                                <a href="${pageContext.request.contextPath}/admin/update_course_status/${row.courseId}/${row.status}" class="btn btn-default"><i class="fa fa-arrow-down"></i></a>
                                                </c:if>

                                            <a href="${pageContext.request.contextPath}/admin/editCourse/${row.courseId}" class="btn btn-success"><i class="fa fa-edit"></i></a>
                                            <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/deleteCourse/${row.courseId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
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