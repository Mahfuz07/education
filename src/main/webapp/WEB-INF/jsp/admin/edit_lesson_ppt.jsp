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
            


            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Upload Presentation</h4>
                    </div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/admin/updateLessonPPT" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="hidden" name="lessonId" value="${lesson.lessonId}"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Please Upload new File</label>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <label class="input-group-btn">
                                        <span class="btn btn-primary">
                                            Brows &hellip; <input accept=".pptx" type="file" name="file" style="display: none;">
                                        </span>
                                    </label>
                                    <input type="text" class="form-control" readonly>

                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-default"  >
                                            <span class="glyphicon glyphicon-upload"></span>
                                        </button>
                                    </span>


                                </div>
                            </div>



<%--                            <div class="input-group">--%>
<%--                                --%>
<%--                                <span class="input-group-btn">--%>
<%--                                    <button id="fake-file-button-browse" type="button" class="btn btn-default">--%>
<%--                                        <span class="glyphicon glyphicon-file"></span>--%>
<%--                                    </button>--%>
<%--                                </span>--%>
<%--                                    <input accept=".pptx" name="file" type="file" id="files-input-upload" style="display:none">--%>
<%--                                    <input type="text" id="fake-file-input-name" disabled="disabled" placeholder="File not selected" class="form-control">--%>
<%--                                <span class="input-group-btn">--%>
<%--                                    <button type="submit" class="btn btn-default"  id="fake-file-button-upload">--%>
<%--                                        <span class="glyphicon glyphicon-upload"></span>--%>
<%--                                    </button>--%>
<%--                                </span>--%>
<%--                            </div>--%>
                            <div class="form-group">
                                <a style="margin-top: 20px; width:100%;" href="${pageContext.request.contextPath}/admin/list_lesson" class="btn btn-warning">Back to list</a>
                            </div>
                        </form>


                    </div>
                </div>
            </div>


            
        </div>










    </div>
</div>

<%@include file="footer.jsp" %>