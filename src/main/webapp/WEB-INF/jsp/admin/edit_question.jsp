<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>

<div ng-app="qApp"  id="page-wrapper" style="min-height: 800px;">

    <div class="container-fluid" ng-controller="qCtrl">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-file"></i> Create Question
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
                        <h4>Update Question</h4>
                    </div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/admin/updateQuestion" method="post">
                            <input type="hidden" name="questionId" value="${question.questionId}"/>
                            <div class="form-group">
                                <label class="control-label">Question:</label>
                                <textarea name="questionType" class="form-control">${question.questionType}</textarea>
                            </div>

                            Options: 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">A.</label>
                                        <textarea name="aone" class="form-control">${question.aone}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">B.</label>
                                        <textarea name="atwo" class="form-control">${question.atwo}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">C.</label>
                                        <textarea name="athree" class="form-control">${question.athree}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">D.</label>
                                        <textarea name="afour" class="form-control">${question.afour}</textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Correct Answer:</label>
                                <select id="canswer" name="canswer" class="form-control">
                                    <option value="select">--- Select Correct Answer ---</option>
                                    <option value="aone">A</option>
                                    <option value="atwo">B</option>
                                    <option value="athree">C</option>
                                    <option value="afour">D</option>
                                </select>
                            </div>

                            <div class="form-group"> 
                                <button type="submit" class="btn btn-success">Update</button>
                                <button type="reset" class="btn btn-default">Reset</button>
                                <a href="${pageContext.request.contextPath}/admin/list_question" class="btn btn-warning pull-right">
                                    <i class="fa fa-backward"></i> Back to List
                                </a>
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
    document.getElementById("canswer").value = '${question.canswer}';
</script>

<%@include file="footer.jsp" %>