<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-file"></i> Lesson
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
                        <h4>Lesson List</h4>
                    </div>
                    <div class="panel-body">


                        <table style="text-align: center;"  width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Lesson Name</th>
                                    <th>Course Name</th>
                                    <th>Description</th>
                                    <th style="width: 120px">Presentation</th>
                                    <th style="width: 120px">Notes</th>
                                    <th>Status</th>
                                    <th style="width: 120px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${lessons}">
                                    <tr>
                                        <td>${row.lessonId}</td>
                                        <td>${row.lessonTitle}</td>
                                        <td>${row.course.courseName}</td>
                                        <td>${row.description}</td>
                                        <td>
                                            <c:choose>
                                            <c:when test="${row.presentationFile != null}">
                                            <a class="btn btn-default" href="${pageContext.request.contextPath}/resources/${row.presentationFile}"><i class="fa fa-file-powerpoint-o"></i></a>
                                                <a href="${pageContext.request.contextPath}/admin/edit_lesson_ppt/${row.lessonId}" class="btn btn-warning"><i class="fa fa-edit"></i> </a>
                                                <a href="" class="btn btn-danger"><i class="fa fa-trash"></i> </a>
                                            </c:when>
                                                <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/admin/edit_lesson_ppt/${row.lessonId}" class="btn btn-warning"><i class="fa fa-edit"></i> </a>
                                            <a href="" class="btn btn-danger"><i class="fa fa-trash"></i> </a>
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td>
                                            <c:choose>
                                            <c:when test="${row.notesFile != null}">
                                            <a class="btn btn-default" href="${pageContext.request.contextPath}/resources/${row.notesFile}"><i class="fa fa-file-pdf-o"></i></a>
                                            <a href="${pageContext.request.contextPath}/admin/edit_lesson_notes/${row.lessonId}" class="btn btn-warning"><i class="fa fa-edit"></i> </a>
                                            <a href="" class="btn btn-danger"><i class="fa fa-trash"></i> </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/admin/edit_lesson_ppt/${row.lessonId}" class="btn btn-warning"><i class="fa fa-edit"></i> </a>
                                                <a href="" class="btn btn-danger"><i class="fa fa-trash"></i> </a>
                                            </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td>${row.status}</td>
                                        <td>
                                            <c:if test="${row.status == false}">
                                                <a href="${pageContext.request.contextPath}/admin/update_lesson_status/${row.lessonId}/${row.status}" class="btn btn-warning"><i class="fa fa-arrow-up"></i></a>
                                                </c:if>
                                                <c:if test="${row.status == true}">
                                                <a href="${pageContext.request.contextPath}/admin/update_lesson_status/${row.lessonId}/${row.status}" class="btn btn-default"><i class="fa fa-arrow-down"></i></a>
                                                </c:if>

                                            <a href="${pageContext.request.contextPath}/admin/edit_lesson/${row.lessonId}" class="btn btn-success"><i class="fa fa-edit"></i></a>
                                            <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/delete_lesson/${row.lessonId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
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
</div>

<%@include file="footer.jsp" %>