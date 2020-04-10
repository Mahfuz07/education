<%-- 
    Document   : login
    Created on : Oct 10, 2017, 9:37:33 AM
    Author     : cyclingbd007
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/resources/admin_resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <!-- MetisMenu CSS -->
        <link href="${pageContext.request.contextPath}/resources/admin_resources/css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/resources/admin_resources/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${pageContext.request.contextPath}/resources/admin_resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="container">
            <div class="row">
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger alert-dismissable col-md-4 col-md-offset-4">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> invalid username or password
                    </div>
                </c:if>
                <c:if test="${sm != null}">
                    <div class="alert alert-success alert-dismissable col-md-4 col-md-offset-4">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> ${sm}
                    </div>
                </c:if>


                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default" style="box-shadow: 0px 0px 10px #DDD;">
                        <div class="panel-heading" style="text-align: center;">
                            
                            <h2 class="panel-title"><i class="fa fa-key"></i> Please Sign In</h2>
                        </div>
                        <div class="panel-body">
                            <form role="form" action="${pageContext.request.contextPath}/login" method="post">
                                <fieldset>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="username" type="text" class="form-control" name="username" placeholder="UserName"/>
                                    </div>
                                    <!--                                    <div class="input-group">
                                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                                            <input id="email" type="text" class="form-control" name="email" placeholder="Email">
                                                                        </div>-->

                                    <div class="input-group" style="margin-top: 15px;">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="password" type="password" class="form-control" name="password" placeholder="Password">
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                        </label>
                                    </div>
                                    <button type="submit" class="btn btn-success btn-block"><i class="fa fa-sign-in"></i> Login</button>
                                    <!--<input name="_csrf" type="hidden" value="3a95161a-b582-40ee-b983-c1a43e7dce47" />-->
                                </fieldset>
                            </form>
                        </div>
                        <div class="panel-footer">
                            <a href="" class="btn btn-primary" style="width: 45%;"><i class="fa fa-facebook-square"></i>&nbsp; Facebook Login</a>
                            <a href="" class="btn btn-danger pull-right" style="width: 45%;"><i class="fa fa-google-plus"></i>&nbsp; Google Login</a>

                        </div>
                        <div class="panel-footer" style="text-align: center;">
                            <a href="${pageContext.request.contextPath}" style="float: left; margin-top: -5px;" class="btn btn-warning btn-sm"><i class="fa fa-backward"></i></a>
                            <a href="">Fogot Password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/sb-admin-2.js"></script>

    </body>

</html>

