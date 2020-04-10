 var registerApp = angular.module("registerApp", []);
    registerApp.controller("registerCtrl", function ($http, $scope) {
       //$scope.myUrl="${pageContext.request.contextPath}";
    	
    	
    	
    	
        $scope.users = [];
        $scope.getAllUsers = function () {
            $http({
                method: 'GET',
                url: 'users/allUsers'
            }).then(function (response) {
                $scope.users = response.data;
            });
        };
        $scope.getAllUsers();
        
        //check username
        $scope.username = "";
        $scope.errorUserName = "";
        $scope.checkUserNameExists = function(){
            
            for (var i = 0; i < $scope.users.length; i++) {
                if($scope.users[i].username == $scope.username){
                    $scope.errorUserName = "Username already exist. Try another one";
                    document.getElementById('submit').style = "display:none";
                    break;
                }else{
                    $scope.errorUserName = "";
                    document.getElementById('submit').style = "display:inline-block";
                }
            }
    
        };
        
        //check email
        $scope.email = "";
        $scope.errorEmail = "";
        $scope.checkEmailExists = function(){
            
            for (var i = 0; i < $scope.users.length; i++) {
                if($scope.users[i].email == $scope.email){
                    $scope.errorEmail = "Email already exist. Try another one";
                    document.getElementById('submit').style = "display:none";
                    break;
                }else{
                    $scope.errorEmail = "";
                    document.getElementById('submit').style = "display:inline-block";
                }
            }
    
        };
        
        
    });