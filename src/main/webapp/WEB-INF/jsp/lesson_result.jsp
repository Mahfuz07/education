<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-12">

    <div class="col-md-12" style="background: #fff; padding: 10px; border: 1px solid tomato; margin-bottom: 10px;">
        <h2 style="margin:0px; text-align: center;">Hi <font style="color:tomato; text-transform: uppercase;">${username}</font>. Here is your Exam details. </h2>
    </div>
    
    <div class="col-md-12" style="background: #fff; padding: 10px; border: 1px solid #DDD;">

        <table style="text-align: center;"  width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">

            <thead>
                <tr>
                    <th>No</th>
                    <th>Lesson Name</th>
                    <th>Total Question</th>
                    <th>Pass mark (70%)</th>
                    <th>Correct Answer</th>
                    <th>Wrong Answer</th>
                    <th>Status</th>
                    <th>Exam Date</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1; %>
                <c:forEach var="row" items="${results}">
                    <tr>
                        <td><%= i++ %></td>
                        <td>${row.lessonName}</td>
                        <td>${row.totalQuestion}</td>
                        <td>${row.passMark}</td>
                        <td>${row.correctAnswer}</td>
                        <td>${row.wrongAnswer}</td>
                        <td>${row.passingStatus}</td>
                        <td>${row.examDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </div>

</div>