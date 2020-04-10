<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<div ng-app="topicsApp"  id="page-wrapper" style="min-height: 800px;">
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
                        <h4>Edit Topics</h4>
                    </div>
                    <div class="panel-body" ng-controller="topicsCtrl">

                        <form action="${pageContext.request.contextPath}/admin/updateTopics" method="post">

                            <div class="form-group">
                                <label class="control-label"></label>
                                <input type="hidden"  name="topicsId" value="${topic.topicsId}"/>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Select Course:</label>
                                <select id="courseId" name="courseId" class="form-control">
                                    <c:forEach var="row" items="${courses}">
                                        <option value="${row.courseId}">${row.courseName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Select Lesson:</label>
                                <select id="lessonId" name="lessonId" class="form-control">
                                    <c:forEach var="row" items="${lessons}">
                                        <option value="${row.lessonId}">${row.lessonTitle}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Topics Title:</label>
                                <input value="${topic.topicsTitle}"  name="topicsTitle" type="text" class="form-control" id="lessonTitle" placeholder="Enter Topic Title"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Description</label>
                                <textarea class="form-control" name="description">${topic.description}</textarea>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Topics Duration (minute):</label>
                                <input value="${topic.duration}"  name="duration" type="number" class="form-control"/>
                            </div>

                            <div class="form-group"> 
                                <button type="submit" class="btn btn-success">Update</button>
                                <button type="reset" class="btn btn-default">Reset</button>
                                <a href="${pageContext.request.contextPath}/admin/list_topics" class="btn btn-warning pull-right">Back to list</a>
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

    document.getElementById("courseId").value = ${topic.course.courseId};
    document.getElementById("lessonId").value = ${topic.lesson.lessonId};
</script>

<%@include file="footer.jsp" %>