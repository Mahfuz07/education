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
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Manage Batch</h4>
                    </div>
                    <div class="panel-body">

                        <table style="text-align: center;"  width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Event Name</th>
                                    <th>Creator</th>
                                    <th>Start Date</th>
                                    <th>Description</th>
                                    <th>Video</th>
                                    <th>Notes</th>
                                    <th>Presentation</th>
                                    <th>Status</th>
                                    <th style="width: 105px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${events}">
                                    <tr>
                                        <td>${row.eventId}</td>
                                        <td>
                                            ${row.eventName}
                                            <img style="margin-top: 20px;" width="150px" src="${pageContext.request.contextPath}/resources/${row.eventPhoto}"/>
                                            <a href="${pageContext.request.contextPath}/admin/editEventPhoto/${row.eventId}" class="btn btn-warning" style="margin-top: 20px;"><i class="fa fa-refresh"></i> Update Photo</a>
                                        </td>
                                        <td>${row.eventCreatorName}</td>
                                        <td>${row.eventDate}</td>
                                        <td>${row.description}</td>
                                        <td>
                                            <iframe src="${row.videoUrl}"></iframe>
                                            <a href="${pageContext.request.contextPath}/admin/edit_event_video/${row.eventId}" class="btn btn-warning"><i class="fa fa-refresh"></i> Update Video</a>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.notesFile != null}">
                                                    <a style="margin-bottom: 10px;" href="${pageContext.request.contextPath}/resources/${row.notesFile}" class="btn btn-primary"><i class="fa fa-file-pdf-o"></i> </a>
                                                    <a href="${pageContext.request.contextPath}/admin/edit_event_notes/${row.eventId}" class="btn btn-warning"><i class="fa fa-refresh"></i> </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${pageContext.request.contextPath}/admin/edit_event_notes/${row.eventId}" class="btn btn-danger"><i class="fa fa-upload"></i> </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.presentationFile != null}">
                                                    <a href="${pageContext.request.contextPath}/resources/${row.presentationFile}" class="btn btn-primary"><i class="fa fa-file-powerpoint-o"></i> </a>
                                                    <a href="${pageContext.request.contextPath}/admin/edit_event_ppt/${row.eventId}" class="btn btn-warning"><i class="fa fa-refresh"></i> </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${pageContext.request.contextPath}/admin/edit_event_ppt/${row.eventId}" class="btn btn-danger"><i class="fa fa-upload"></i> </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${row.status}</td>
                                        <td>
                                            <c:if test="${row.status == false}">
                                                <a href="${pageContext.request.contextPath}/admin/update_event_status/${row.eventId}/${row.status}" class="btn btn-warning"><i class="fa fa-arrow-up"></i></a>
                                            </c:if>
                                            <c:if test="${row.status == true}">
                                                <a href="${pageContext.request.contextPath}/admin/update_event_status/${row.eventId}/${row.status}" class="btn btn-default"><i class="fa fa-arrow-down"></i></a>
                                            </c:if>

                                            <a href="${pageContext.request.contextPath}/admin/edit_event/${row.eventId}" class="btn btn-success"><i class="fa fa-edit"></i></a>
                                            <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/delete_event/${row.eventId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
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