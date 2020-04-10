<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
                <!-- /input-group -->
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-users"></i> Users<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/add_user"><i class="fa fa-user-plus"></i> Add User Role</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/list_user"><i class="fa fa-cogs"></i> Manage User</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/list_student"><i class="fa fa-cogs"></i> Manage Student</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/list_teacher"><i class="fa fa-cogs"></i> Manage Teacher</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>

            <li>
                <a href="#"><i class="fa fa-file-zip-o"></i> Course<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/add_course"><i class="fa fa-plus-square"></i> Create Course</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/list_course"><i class="fa fa-cogs"></i> Manage Course</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>


            <li>
                <a href="#"><i class="fa fa-file-text"></i> Lesson<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/add_lesson"><i class="fa fa-plus-square-o"></i> Create lesson</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/list_lesson"><i class="fa fa-cogs"></i> Manage lesson</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><i class="fa fa-file-code-o"></i> Topics<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/add_topics"><i class="fa fa-plus-square-o"></i> Add Topics</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/list_topics"><i class="fa fa-cogs"></i> Manage Topics</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><i class="fa fa-calendar-check-o"></i> Event<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/add_event"><i class="fa fa-calendar"></i> Create Event</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/list_event"><i class="fa fa-cogs"></i> Manage Event</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>

            <li>
                <a href="#"><i class="fa fa-file-text-o"></i> Exam<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/add_question"><i class="fa fa-file-text-o"></i> Create Question</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/list_question"><i class="fa fa-cogs"></i> Manage Question</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>




            <!--            <li>
                            <a href="#"><i class="fa fa-group"></i> Batch<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/add_batch"><i class="fa fa-plus-square-o"></i> Add Batch</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/list_batch"><i class="fa fa-cogs"></i> Manage Batch</a>
                                </li>
                            </ul>
                             /.nav-second-level 
                        </li>-->



            <!--            <li>
                            <a href="#"><i class="fa fa-user"></i> Student<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/add_student"><i class="fa fa-user-plus"></i> Add Student</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/list_student"><i class="fa fa-cogs"></i> Manage Student</a>
                                </li>
                            </ul>
                        </li>-->

            <!--            <li>
                            <a href="#"><i class="fa fa-user"></i> Teacher<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/add_teacher"><i class="fa fa-user-plus"></i> Add Teacher</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/list_teacher"><i class="fa fa-cogs"></i> Manage Teacher</a>
                                </li>
                            </ul>
                        </li>-->

            <!--            <li>
                            <a href="${pageContext.request.contextPath}/admin/student"><i class="fa fa-user"></i> Teacher</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/student"><i class="fa fa-file"></i> Assign Course</a>
                        </li>
            
            
            
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/backup_data"><i class="fa fa-ambulance"></i> Room</a>
                        </li>
            
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/backup_data"><i class="fa fa-calendar"></i> DAG</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/backup_data"><i class="fa fa-server"></i> Back Up</a>
                        </li>-->



            
            <li>
                <a href="#"><i class="fa fa-newspaper-o"></i> Blog<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    
                    
                    <li>
                        <a href="#"><i class="fa fa-tag"></i> Category <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/add_category"><i class="fa fa-plus-square"></i> Create Category</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/list_category"><i class="fa fa-cogs"></i> Manage Category</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-tags"></i> Sub Category <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/add_sub_category"><i class="fa fa-plus-square"></i> Create Sub Category</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/list_sub_category"><i class="fa fa-cogs"></i> Manage Sub Category</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-pencil"></i> Post <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/add_post"><i class="fa fa-plus-square"></i> Create Post</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/list_posts"><i class="fa fa-cogs"></i> Manage Post</a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    
                </ul>
                
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>

<!--


<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
        <li class="active">
            <a href="${pageContext.request.contextPath}/admin/"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
        </li>

        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-users"></i> Users <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="demo" class="collapse">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/add_user"><i class="fa fa-user-plus"></i> Add User</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/list_user"><i class="fa fa-list-ul"></i> Users List</a>
                </li>
            </ul>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/admin/course"><i class="fa fa-file"></i> Course</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/lesson"><i class="fa fa-file"></i> Lesson</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/topics"><i class="fa fa-file"></i> Topic</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/batch"><i class="fa fa-address-book"></i> Batch</a>
        </li>
        
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-users"></i> Students <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="demo1" class="collapse">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/add_student"><i class="fa fa-user-plus"></i> Add Student</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/list_student"><i class="fa fa-list-ul"></i> Students List</a>
                </li>
            </ul>
        </li>
        
        <li>
            <a href="${pageContext.request.contextPath}/admin/backup_data"><i class="fa fa-database"></i> BackUp Data</a>
        </li>
        
    </ul>
</div>

-->