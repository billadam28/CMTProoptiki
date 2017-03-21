<%@page import="CMTPersistence.Users"%>
<%@page import="CMTPersistence.Projects"%>
<%@page import="CMTServlets.LoginSrvlt"%>
<%@page import="CMTServlets.EditProjectSrvlt"%>
<%@page import="CMTServlets.UpdateProjectSrvlt"%>
<%@page import="CMTJavaClasses.ProjectProcessor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">

<%if (session.getAttribute("username") == null || session.getAttribute("user_type").equals(2)
                            || session.getAttribute("user_type").equals(3)) {%>
        <jsp:forward page="/index.jsp" >
            <jsp:param name="noSession" value="1" />
        </jsp:forward>
    <%}%>    
    
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Panel | CMTProoptiki</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button> -->
                <a class="navbar-brand" href="">Welcome <%= session.getAttribute("firstName") + " " + session.getAttribute("surName")%></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

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
                            <a href="Login"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Projects<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="LoadCreateProjectForm">Create Project</a>
                                </li>
                                <li>
                                    <a href="ViewProject">View Projects</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Admin Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <!-- /.row -->
            <% ProjectProcessor projectProcessor = (ProjectProcessor) request.getAttribute("projectProcessor");%>
            <% Projects obj = projectProcessor.getProject(); %>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edit Project Details
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>ID</label>
                                            <input class="form-control" id="pId" value="<%= obj.getId()%>" name="pId" form="editForm" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input class="form-control" id="pName" value="<%= obj.getProjectName()%>" name="pName" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Acronym</label>
                                            <input class="form-control" id="pAcr" value="<%= obj.getAcronyme()%>" name="pAcr" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Contract Number</label>
                                            <input class="form-control" id="pConNum" value="<%= obj.getContractNumber()%>" name="pConNum" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Start Date</label>
                                            <input class="form-control" id="pSDate" value="<%= obj.getStartDate()%>" name="pSDate" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>End Date</label>
                                            <input class="form-control" id="pEDate" value="<%= obj.getEndDate()%>" name="pEDate" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Budget</label>
                                            <input class="form-control" id="pBud" value="<%= obj.getBudget()%>" name="pBud" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Total Project Grant</label>
                                            <input class="form-control" id="pTGrant" value="<%= obj.getTotalProjectGrant()%>" name="pTGrant" form="editForm">
                                        </div>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Cmt Budget</label>
                                            <input class="form-control" id="pCMTBud" value="<%= obj.getCmtBudget()%>" name="pCMTBud" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Total Cmt Grant</label>
                                            <input class="form-control" id="pTCMTGrant" value="<%= obj.getTotalCmtGrant()%>" name="pTCMTGrant" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Payment Scheme</label>
                                            <input class="form-control" id="pPaySch" value="<%= obj.getPaymentsScheme()%>" name="pPaySch" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>First Payment</label>
                                            <input class="form-control" id="pFirstPay" value="<%= obj.getFirstPayment()%>" name="pFirstPay" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Second Payment</label>
                                            <input class="form-control" id="pSecPay" value="<%= obj.getSecondPayment()%>" name="pSecPay" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Third Payment</label>
                                            <input class="form-control" id="pThirdPay" value="<%= obj.getThirdPayment()%>" name="pThirdPay" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Fourth Payment</label>
                                            <input class="form-control" id="pFourthPay" value="<%= obj.getFourthPayment()%>" name="pFourthPay" form="editForm">
                                        </div>
                                        <div class="form-group">
                                        <label>Comments</label>
                                        <textarea class="form-control" rows="3" id="pComments" form="editForm">
                                            <%if (obj.getComments()==null || obj.getComments().equals("null")) {%> No comments <%} else {%><%= obj.getComments()%><%}%>
                                        </textarea>
                                </div>
                            </div>
                                
                                <form id="editForm" method="post" action="UpdateProject">
                                            <button type="submit" class="btn btn-default">Save</button>
                                            <button type="reset" class="btn btn-default">Clear changes</button>
                                </form>
                                <!-- /.col-lg-6 (nested) -->
                                <!-- /.col-lg-6 (nested) -->
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="vendor/raphael/raphael.min.js"></script>
    <script src="vendor/morrisjs/morris.min.js"></script>
    <script src="data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>
