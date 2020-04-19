<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<script type="text/javascript">
    var mqApp = angular.module("mqApp", []);
    mqApp.controller("mqCtrl", function ($scope, $http) {
        //get All Courses
        $scope.lesson = {};
        $scope.getLessonName = function (lessonId) {
            $scope.lessonId = lessonId;
            $http({
                method: 'GET',
                url: 'topics/allCoursesInfo'
            }).then(function (response) {
                $scope.lesson = response.data;
            });
        };

    });
</script>
<div ng-app="mqApp" ng-controller="mqCtrl" id="page-wrapper" style="min-height: 800px;">

    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-file"></i> Questions
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
                        <h4>Manage Questions</h4>
                    </div>
                    <div class="panel-body">

                        <table style="text-align: center;"  width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Question</th>
                                    <th>Status</th>
                                    <th style="width: 105px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${questions}">
                                    <tr>
                                        <td>${row.questionId}</td>
                                        <td style="text-align: left;">
                                            ${row.questionType}<br/>

                                            A. ${row.aone}<br/>
                                            B. ${row.atwo}<br/>
                                            C. ${row.athree}<br/>
                                            D. ${row.afour}<br/>
                                            <c:if test='${row.canswer == "aone"}'>
                                                <font color="green">Correct Answer. a</font>
                                            </c:if>
                                            <c:if test='${row.canswer == "atwo"}'>
                                                <font color="green">Correct Answer. b</font>
                                            </c:if>
                                            <c:if test='${row.canswer == "athree"}'>
                                                <font color="green">Correct Answer. c</font>
                                            </c:if>
                                            <c:if test='${row.canswer == "afour"}'>
                                                <font color="green">Correct Answer. d</font>
                                            </c:if>

                                        </td>
                                        <td>${row.status}</td>

                                        <td>
                                            <c:if test="${row.status == false}">
                                                <a href="${pageContext.request.contextPath}/admin/update_question_status/${row.questionId}/${row.status}" class="btn btn-warning"><i class="fa fa-arrow-up"></i></a>
                                                </c:if>
                                                <c:if test="${row.status == true}">
                                                <a href="${pageContext.request.contextPath}/admin/update_question_status/${row.questionId}/${row.status}" class="btn btn-default"><i class="fa fa-arrow-down"></i></a>
                                                </c:if>

                                            <a href="${pageContext.request.contextPath}/admin/edit_question/${row.questionId}" class="btn btn-success"><i class="fa fa-edit"></i></a>
                                            <a onclick="return confirm('Are you want to delete this item?')" href="${pageContext.request.contextPath}/admin/delete_question/${row.questionId}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
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