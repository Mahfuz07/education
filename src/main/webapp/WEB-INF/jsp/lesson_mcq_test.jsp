<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
    var lmcqApp = angular.module("lmcqApp", []);
    lmcqApp.controller("lmcqCtrl", function ($scope, $http) {

        //get All questions by lesson id
        $scope.questions = [];
        $scope.getAllQuestionsByLessonId = function () {
            $http({
                method: 'GET',
                url: 'questions/questionsByLessonId/' + ${lessonId}
            }).then(function (response) {
                $scope.questions = response.data;
            });
        };
        $scope.getAllQuestionsByLessonId();


        //logic implementation
        $scope.questionId = "";
        $scope.startExam = function(){
            $scope.questionId = $scope.questions[0].questionId;
            document.getElementById("start").style = "display:none";
            document.getElementById("answerdQuestions").style = "display:inline";
            
        };
        
        
        
        $scope.nextQuestionId = function(){
            for (var i = 0; i < $scope.questions.length; i++) {
                if($scope.questions[i].questionId === $scope.questionId){
                    $scope.questionId = $scope.questions[i + 1].questionId;
                    break;
                }
            }
            
        };
        
        $scope.prevQuestionId = function(){
            for (var i = 0; i < $scope.questions.length; i++) {
                if($scope.questions[i].questionId === $scope.questionId){
                    $scope.questionId = $scope.questions[i - 1].questionId;
                    break;
                }
            }
        };
        
        
        $scope.clickedQuestion = {};
        $scope.result = [];
        
        $scope.clickedAnswer = function(row, answer, sNo){
            
            $scope.clickedQuestion = row;
            $scope.answer = {'questionId':'', 'status':'', 'sNo':''};
            if($scope.clickedQuestion.canswer === answer){
                $scope.answer.questionId = $scope.clickedQuestion.questionId;
                $scope.answer.status = 1;
                $scope.answer.sNo = sNo;
            }else{
                $scope.answer.questionId = $scope.clickedQuestion.questionId;
                $scope.answer.status = 0;
                $scope.answer.sNo = sNo;
            }
            
            if($scope.result.length === 0){
                $scope.result.push($scope.answer);
            }else if($scope.result.length > 0){
                for (var i = 0; i < $scope.result.length; i++) {
                    if($scope.result[i].questionId === $scope.answer.questionId){
                        $scope.result[i].questionId = $scope.answer.questionId;
                        $scope.result[i].status = $scope.answer.status;
                        //alert("already have it");
                        break;
                    }
                }
                if(i === $scope.result.length){
                    $scope.result.push($scope.answer);
                }
            }
            
            //alert($scope.result.length);
            
        };
        
        $scope.stopExam = function(){
            $scope.questionId = "";
            document.getElementById("viewResult").style = "display: inline";
            
        };
        
        $scope.correct = 0;
        $scope.wrong = 0;
        $scope.viewResult = function(){
            document.getElementById("mcqBox").style = "display:none";
            //alert($scope.result.length);
            for (var i = 0; i < $scope.result.length; i++) {
                if($scope.result[i].status === 1){
                    $scope.correct = $scope.correct + 1;
                }else if($scope.result[i].status === 0){
                    $scope.wrong = $scope.wrong + 1;
                }
            };
            
            document.getElementById("resultTable").style = "display: inline-block";
            document.getElementById("resultTable").style = "width:100%";
            document.getElementById("answerdQuestions").style = "display:none";
            
            $scope.passMark = Math.floor(($scope.questions.length * 70)/100);
            $scope.passStatus = "";
            if($scope.correct >= $scope.passMark){
                $scope.passStatus = "Pass";
            }else{
                $scope.passStatus = "Fail";
            }
        
        };
        
        

    });
</script>

<sec:authorize access="isAuthenticated()">
<div ng-app="lmcqApp" ng-controller="lmcqCtrl" class="col-md-12">
    
    
    <div class="col-md-12" style="background: #fff; margin-bottom: 10px; padding: 10px; border: 1px solid tomato; border-radius:  5px;">
        
        <p id="answerdQuestions" style="display: none;">Questions you already answered: <span ng-repeat="q in result | orderBy : 'q.sNo'">{{q.sNo}}, </span></p>
        <hr/>
        <form action="${pageContext.request.contextPath}/saveLessonExamResult" method="post">
            <table id="resultTable" style="display: none;" class="table table-bordered">
                <tr>
                    <th colspan="2" style="text-align: center; font-size: 25px;">Result</th>
                    <input type="hidden" name="lessonId" value="${lessonId}"/>
                    <input type="hidden" name="totalQuestion" value="{{questions.length}}"/>
                    <input type="hidden" name="passMark" value="{{passMark}}"/>
                    <input type="hidden" name="correctAnswer" value="{{correct}}"/>
                    <input type="hidden" name="wrongAnswer" value="{{wrong}}"/>
                    <input type="hidden" name="passingStatus" value="{{passStatus | lowercase}}"/>
                </tr>
                <tr>
                    <th style="width: 160px;">Total Question :</th>
                    <td>{{questions.length}}</td>
                </tr>
                <tr>
                    <th style="width: 160px;">Correct Answer :</th>
                    <td>{{correct}}</td>
                </tr>
                <tr>
                    <th>Wrong Answer :</th>
                    <td>{{wrong}}</td>
                </tr>
                <tr>
                    <th>Pass Mark :</th>
                    <td>{{passMark}} (70%)</td>
                </tr>
                <tr>
                    <th>Result Status :</th>
                    <td>
                        <font color="green" ng-if="passStatus === 'Pass'">{{passStatus}}</font>
                        <font color="red" ng-if="passStatus === 'Fail'">{{passStatus}}</font>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn btn-success btn-sm">Submit Result</button>
                        <a href="${pageContext.request.contextPath}/lessonMcqTest/${lessonId}" class="btn btn-warning pull-right btn-sm">Retake Exam</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    <div id="mcqBox" class="col-md-12">
        <div class="row">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    MCQ Test  <span class="pull-right">Total Questions: {{questions.length}}</span>
                </div>
                <div class="panel-body">
                    
                    <div class="col-md-12">
                        <button style="width: 50%; height: 200px; margin: 5% 25%; font-size: 50px;" id="start" ng-click="startExam()" class="btn btn-warning btn-lg">Start <i class="fa fa-play"></i></button>
                        <button id="prev" ng-if="questionId != '' && questionId != questions[0].questionId" ng-click="prevQuestionId()" class="btn btn-success btn-sm">Prev <i class="fa fa-backward"></i></button>
                        <button id="next" ng-if="questionId != '' && questionId != questions[questions.length-1].questionId" ng-click="nextQuestionId()" class="btn btn-success btn-sm pull-right">Next <i class="fa fa-forward"></i></button>
                        <button id="stop" ng-if="questionId != '' && questionId == questions[questions.length-1].questionId && result.length === questions.length" ng-click="stopExam()" class="btn btn-danger btn-sm pull-right"><i class="fa fa-stop"></i> Stop </button>
                        <button id="viewResult" style="display: none;" ng-click="viewResult()" class="btn btn-info btn-lg"><i class="fa fa-eye"></i> View Result</button>
                    </div>
                    
                    <div ng-if="row.questionId === questionId" ng-repeat="row in questions" class="col-md-12" style="background: #fff; margin-top: 10px;">

                        <table class="table table-bordered table-striped table-responsive">
                            <tr>
                                <th colspan="3">
                                    {{$index + 1}}. {{row.question}}
                                </th>
                            </tr>
                            <tr>
                                <td style="width: 40px; text-align: center;">
                                    <input ng-click="clickedAnswer(row, 'aone', $index+1)" name="canswer" type="radio"/> 
                                </td>
                                <td style="width: 40px; text-align: center;">A</td>
                                <td>{{row.aone}}</td>
                            </tr>
                            <tr>
                                <td style="width: 40px; text-align: center;">
                                    <input ng-click="clickedAnswer(row, 'atwo', $index+1)" name="canswer" type="radio"/> 
                                </td>
                                <td style="width: 40px; text-align: center;">B</td>
                                <td>{{row.atwo}}</td>
                            </tr>
                            <tr>
                                <td style="width: 40px; text-align: center;">
                                    <input ng-click="clickedAnswer(row, 'athree', $index+1)" name="canswer" type="radio"/> 
                                </td>
                                <td style="width: 40px; text-align: center;">C</td>
                                <td>{{row.athree}}</td>
                            </tr>
                            <tr>
                                <td style="width: 40px; text-align: center;">
                                    <input ng-click="clickedAnswer(row, 'afour', $index+1)" name="canswer" type="radio"/> 
                                </td>
                                <td style="width: 40px; text-align: center;">D</td>
                                <td>{{row.afour}}</td>
                            </tr>
                        </table>

                    </div>

                    
                    
                </div>
            </div>

        </div>

    </div>

</div>
</sec:authorize>
<sec:authorize access="!isAuthenticated()">
    <div class="col-md-12" >
        <div class="col-md-12" style="text-align: center; font-size: 30px; background: #fff; padding: 200px 0px 200px 0px; border: 1px solid tomato">
            You are not logged in yet. Please <a href="${pageContext.request.contextPath}/login" class="btn btn-success"><i class="fa fa-sign-in"></i> Login</a> First
        </div>
    </div>
</sec:authorize>