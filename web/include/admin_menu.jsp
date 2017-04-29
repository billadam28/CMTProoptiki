<%-- 
    Document   : admin_menu
    Created on : Mar 22, 2017, 1:13:42 PM
    Author     : vadamopo
--%>

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
                <a href="javascript:window.location.reload()"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
            </li>
            <li>
                <a href="#"><i class="fa fa fa-tasks fa-fw"></i> Projects<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="LoadCreateProjectForm"><i class="fa fa-plus fa-fw"></i> Create Projects</a>
                    </li>
                    <li>
                        <a href="ViewProject"><i class="fa fa-eye fa-fw"></i> View Projects</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><i class="fa fa fa-users fa-fw"></i> Employees<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="LoadCreateEmployeeForm"><i class="fa fa-user-plus fa-fw"></i> Create Employees</a>
                    </li>
                    <li>   
                        <a href="ViewEmployee"><i class="fa fa-eye fa-fw"></i> View Employees</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>