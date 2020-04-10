<%@page import="java.util.Date"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@include file="header.jsp" %>
<div id="page-wrapper" style="min-height: 800px;">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                    <i class="fa fa-user-plus"></i> Edit Student
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
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Edit Student Info</h4>
                    </div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/admin/updateStudent" method="post">
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label class="control-label">Student Name:</label>
                                    <input value="${student.studentName}" name="studentName" type="text" class="form-control"/>
                                    <input value="${student.studentId}" name="studentId" type="hidden" class="form-control"/>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Email:</label>
                                    <input value="${student.email}" name="email" type="eamil" class="form-control"/>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Bathc Name:</label>
                                    <select name="batchId" class="form-control" id="batchId">
                                        <option value="">-- select batch --</option>
                                        <c:forEach var="row" items="${batches}">
                                            <option value="${row.batchId}">${row.batchName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Father Name:</label>
                                    <input value="${student.fatherName}" name="fatherName" type="text" class="form-control"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Mother Name:</label>
                                    <input value="${student.motherName}" name="motherName" type="text" class="form-control"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Gender:</label>
                                    <div class="input-group">
                                        <c:if test="${student.gender == false}">
                                            <input type="radio" name="gender" value="0" checked=""/> Male
                                            <input type="radio" name="gender" value="1"/> Female
                                        </c:if>
                                        <c:if test="${student.gender == true}">
                                            <input type="radio" name="gender" value="0"/> Male
                                            <input type="radio" name="gender" value="1" checked=""/> Female
                                        </c:if>

                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Date of Birth:</label>
                                    <input value="${student.dob}" pattern="dd-MM-yyyy" name="dob" type="date" class="form-control"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Present Address:</label>
                                    <textarea name="presentAddress" class="form-control">${student.presentAddress}</textarea>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Permanent Address:</label>
                                    <textarea name="permanentAddress" class="form-control">${student.permanentAddress}</textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Religion:</label>
                                    <input value="${student.religion}" name="religion" type="text" class="form-control"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Nationality:</label>
                                    <input value="${student.nationality}" name="nationality" type="text" class="form-control"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <label class="control-label">Father Mobile:</label>
                                    <input value="${student.fatherMobile}" name="fatherMobile" type="text" class="form-control"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Mother Mobile:</label>
                                    <input value="${student.motherMobile}" name="motherMobile" type="text" class="form-control"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Home Mobile:</label>
                                    <input value="${student.homeMobile}" name="homeMobile" type="text" class="form-control"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Student Mobile:</label>
                                    <input value="${student.studentMobile}" name="studentMobile" type="text" class="form-control"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Register Date:</label>
                                    <input value="${student.registerDate}" pattern="dd-MM-yyyy" name="registerDate" type="date" class="form-control"/>
                                    <input value="${student.photo}" type="hidden" name="photo"/>
                                </div>
                                
                            </div>
                           
                            <div class="form-group"> 
                                <button type="submit" class="btn btn-success">Update</button>
                                <button type="reset" class="btn btn-default">Reset</button>
                                <a href="${pageContext.request.contextPath}/admin/list_student" class="btn btn-warning pull-right">
                                    Back to list
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

    document.getElementById("batchId").value = ${student.batch.batchId};
</script>
<%@include file="footer.jsp" %>