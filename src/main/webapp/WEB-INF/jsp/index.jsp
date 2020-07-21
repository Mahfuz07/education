<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css"/>

        <!-- custom css -->
        <link href="${pageContext.request.contextPath}/resources/style.css" rel="stylesheet" type="text/css"/>
        <!-- card design -->
        <link href="${pageContext.request.contextPath}/resources/css/rotating-card.css" rel="stylesheet" type="text/css"/>
        <!-- bootstrap table-->
        <link href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/dataTables.responsive.css" rel="stylesheet" type="text/css"/>
        <!-- star rating css -->
        <link href="${pageContext.request.contextPath}/resources/css/star-rating.css" rel="stylesheet" type="text/css"/>

        <!-- scripts begins from here -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/resources/js/jquery.dataTable.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/js/dataTables.responsive.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/resources/js/star-rating.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/js/angular.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <!-- header -->
                <div class="header col-md-12" style="padding-top: 20px; padding-bottom: 20px;">
                    <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""/></a>
                    <!--<h2 style="display: inline;"><a href="${pageContext.request.contextPath}">EduCare</a></h2>-->
                    <a href="?locale=en" class="btn btn-default pull-right btn-sm" style="margin-left: 10px;">English</a>
                    <a href="?locale=bn" class="btn btn-success pull-right btn-sm"><spring:message code="menu.bangla"/></a>
                </div>


                <!-- menu -->
                <div class="menu col-md-12">
                    <nav class="navbar navbar-inverse">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span> 
                                </button>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar">
                                <ul class="nav navbar-nav">
                                    <li class="<c:if test="${page == 'home_page'}">active</c:if>"><a href="${pageContext.request.contextPath}/home"><i class="fa fa-home"></i> <spring:message code="menu.home"/></a></li>
                                    <li class="<c:if test="${page == 'courses_page' || page == 'course_page'}">active</c:if>"><a href="${pageContext.request.contextPath}/courses"><i class="fa fa-file-archive-o"></i> <spring:message code="menu.courses"/></a></li>
                                    <li class="<c:if test="${page == 'live_class_page' || page == 'live_class_event_page'}">active</c:if>"><a href="${pageContext.request.contextPath}/live_class"><i class="fa fa-dot-circle-o" style='<c:if test="${page != 'live_class_page' && page != 'live_class_event_page'}">color: tomato</c:if>'></i> <spring:message code="menu.liveClass"/></a></li>
                                    <li class="<c:if test="${page == 'contact_page'}">active</c:if>"><a href="${pageContext.request.contextPath}/contact"><i class="fa fa-map-marker"></i> <spring:message code="menu.contact"/></a></li>
                                    <li class="<c:if test="${page == 'blog_page' || page == 'single_blog_page'}">active</c:if>"><a href="${pageContext.request.contextPath}/blog"><i class="fa fa-rss"></i> <spring:message code="menu.blog"/></a></li>
                                    </ul>
                                    <ul class="nav navbar-nav navbar-right">
                                    <sec:authorize access="!isAuthenticated()">
                                        <li class="<c:if test="${page == 'register_page'}">active</c:if>"><a href="${pageContext.request.contextPath}/register"><span class="glyphicon glyphicon-user"></span> <spring:message code="menu.register"/></a></li>
                                        <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> <spring:message code="menu.signIn"/></a></li>
                                        </sec:authorize>
                                        <sec:authorize access="isAuthenticated() && !hasRole('ROLE_ADMIN')">
                                        <li class="<c:if test="${page == 'lesson_result_page'}">active</c:if>"><a href="${pageContext.request.contextPath}/lessonExamResultChart/"><span class="glyphicon glyphicon-file"></span> <spring:message code="menu.result"/></a></li>
                                        </sec:authorize>
                                        <sec:authorize access="hasRole('ROLE_ADMIN') || hasRole('ROLE_TEACHER')">
                                        <li><a href="${pageContext.request.contextPath}/admin/"><span class="glyphicon glyphicon-dashboard"></span> <spring:message code="menu.adminPanel"/></a></li>
                                        </sec:authorize>
                                        <sec:authorize access="isAuthenticated()">
                                            <sec:authorize access="!(hasRole('ROLE_ADMIN') || hasRole('ROLE_TEACHER'))">
                                            <li class="<c:if test="${page == 'profile_page'}">active</c:if>"><a href="${pageContext.request.contextPath}/profile"><i class="fa fa-user-circle-o"></i> <spring:message code="menu.profile"/></a></li>
                                            </sec:authorize>
                                        <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="menu.logOut"/></a></li>
                                        </sec:authorize>

                                </ul>
                            </div>
                        </div>
                    </nav>

                </div>



                <!-- load pages using conditions -->
                <c:if test="${page == 'home_page'}">
                    <%@include file="home.jsp" %>
                </c:if>
                <c:if test="${page == 'courses_page'}">
                    <%@include file="courses.jsp" %>
                </c:if>
                <c:if test="${page == 'course_page'}">
                    <%@include file="course.jsp" %>
                </c:if>
                <c:if test="${page == 'lessonMcqTest_page'}">
                    <%@include file="lesson_mcq_test.jsp" %>
                </c:if>
                <c:if test="${page == 'submitResultSuccess_page'}">
                    <%@include file="lesson_mcq_reslut_success.jsp" %>
                </c:if>
                <c:if test="${page == 'lesson_result_page'}">
                    <%@include file="lesson_result.jsp" %>
                </c:if>
                <c:if test="${page == 'live_class_page'}">
                    <%@include file="live_class.jsp" %>
                </c:if>
                <c:if test="${page == 'live_class_event_page'}">
                    <%@include file="live_class_event.jsp" %>
                </c:if>
                <c:if test="${page == 'contact_page'}">
                    <%@include file="contact.jsp" %>
                </c:if>
                <c:if test="${page == 'profile_page'}">
                    <%@include file="profile.jsp" %>
                </c:if>
                <c:if test="${page == 'register_page'}">
                    <%@include file="register.jsp" %>
                </c:if>
                <c:if test="${page == 'blog_page'}">
                    <%@include file="blog.jsp" %>
                </c:if>
                <c:if test="${page == 'single_blog_page'}">
                    <%@include file="blog_single.jsp" %>
                </c:if>
                <!-- /load pages using conditions -->


            </div>
            <div class="col-md-12" style="background: #122b40; color: #fff; text-align: center; padding: 25px;">
                Copyright &copy; 2020 <a href="https://www.youtube.com/channel/UC4vVj7lKO7H4FohB3lv9dzA" target="_blank" style="color: yellow; text-decoration: none;"></a> | All Right Reserved.<br/>
                Programmed by: Mahfuz Alam, Md. Uzzal, Nayem Biswas
            </div>


            <!--            <nav class="navbar navbar-inverse">
                            <p style="text-align: center; color: white; margin-top: 15px;">&copy; Zubayer Ahamed</p>
                               
                        </nav>-->
        </div>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });

        </script>
        

        <!--        <script type="text/javascript">
                    $().ready(function () {
                        $('[rel="tooltip"]').tooltip();
        
                    });
        
                    function rotateCard(btn) {
                        var $card = $(btn).closest('.card-container');
                        console.log($card);
                        if ($card.hasClass('hover')) {
                            $card.removeClass('hover');
                        } else {
                            $card.addClass('hover');
                        }
                    }
                </script>-->
    </body>
</html>
