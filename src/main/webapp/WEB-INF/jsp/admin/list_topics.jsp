<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-file"></i> Topics
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

                        <table  width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Topics Title</th>
                                    <th>Lesson Title</th>
                                    <th>Description</th>
                                    <th>Duration</th>
                                    <th>Video</th>
                                    <th>Status</th>
                                    <th style="width: 105px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${topics}">
                                    <tr>
                                        <td>${row.topicsId}</td>
                                        <td>${row.topicsTitle}</td>
                                        <td>${row.lesson.lessonTitle}</td>
                                        <td>${row.description}</td>
                                        <td>${row.duration}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.videoUrl != null}">
                                                    <iframe src="${row.videoUrl}"></iframe>
                                                    <a href="${pageContext.request.contextPath}/admin/addTopicsVideo/${row.topicsId}" class="btn btn-success btn-sm"><i class="fa fa-upload"></i> Upadte Video</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <button class="btn btn-danger"><i class="fa fa-times"></i>Video not available</button>
                                                    <a href="${pageContext.request.contextPath}/admin/addTopicsVideo/${row.topicsId}" class="btn btn-success btn-sm pull-right"><i class="fa fa-upload"></i> Add Video</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${row.status}</td>
                                        <td>
                                            <c:if test="${row.status == false}">
                                                <a href="${pageContext.request.contextPath}/admin/update_topics_status/${row.topicsId}/${row.status}" class="btn btn-warning"><i class="fa fa-arrow-up"></i></a>
                                                </c:if>
                                                <c:if test="${row.status == true}">
                                                <a href="${pageContext.request.contextPath}/admin/update_topics_status/${row.topicsId}/${row.status}" class="btn btn-default"><i class="fa fa-arrow-down"></i></a>
                                                </c:if>

                                            <a href="${pageContext.request.contextPath}/admin/edit_topic/${row.topicsId}" class="btn btn-success"><i class="fa fa-edit"></i></a>
                                            <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/delete_topic/${row.topicsId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
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