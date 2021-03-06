<%@page import="java.util.Set"%>
<%@page import="CMTServlets.ViewProjectSrvlt"%>
<%@page import="CMTServlets.EditProjectSrvlt"%>
<%@page import="CMTServlets.ProjectPlanningSrvlt"%>
<%@page import="CMTPersistence.Projects"%>
<%@page import="CMTJavaClasses.ProjectProcessor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    
<%@ include file="/include/admin_head.jsp" %>

<body>
    
    

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <%@ include file="/include/global_menubar.jsp" %>

            <%@ include file="/include/admin_menu.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>

        <% ProjectProcessor proj = (ProjectProcessor) request.getAttribute("projectProcessor");%>  
        <% Integer id = proj.getProject().getId();%>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%= proj.getProject().getProjectName()%></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Project Details.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="LoadProjectDetails?id=<%=id%>"><i class="glyphicon glyphicon-info-sign"></i> Details</a>
                                </li>
                                <li class=""><a href="EditProject?pId=<%=id%>"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                                </li>
                                <li class=""><a href="LoadProjectBudget?id=<%=id%>"><i class="fa fa-money"></i> Budget</a>
                                </li>
                                <li class=""><a href="ProjectPlanning?id=<%=id%>"><i class="glyphicon glyphicon-stats"></i> Planning</a>
                                </li>
                                <li class=""><a href="ProjectPlanningHours?id=<%=id%>"><i class="glyphicon glyphicon-time"></i> View hours</a>
                                </li>
                                <li class=""><a href="ProjectPlanningCost?id=<%=id%>"><i class="fa fa-euro"></i> View cost</a>
                                </li>
                                <li class=""><a href="ProjectResources?id=<%=id%>"><i class="fa fa-child"></i> Resources</a>
                                </li>
                                <li class=""><a href="ProjectMonitoring?id=<%=id%>"><i class="fa fa-line-chart"></i> Monitoring</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home">
                                <h4><p>&nbsp;</p></h4>
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Project Name</th>
                                        <th>Acronyme</th>
                                        <th>Contract Number</th>
                                        <th>Starting Date</th>
                                        <th>End Date</th>
					<th>Project Budget</th>
					<th>Total Project Grant</th>
					<th>CMT Budget</th>
					<th>Total CMT Grant</th>
					<th>Payments Scheme</th>
                                        <% if (proj.getProject().getPaymentsScheme().equals("1")) { %> 
                                            <th>1st Payment</th>
                                        <%} else if (proj.getProject().getPaymentsScheme().equals("2")) { %>
                                            <th>1st Payment</th>
                                            <th>2nd Payment</th>
                                        <%} else if (proj.getProject().getPaymentsScheme().equals("3")) { %>
                                            <th>1st Payment</th>
                                            <th>2nd Payment</th>
                                            <th>3rd Payment</th>
                                        <%} else { %>
                                            <th>1st Payment</th>
                                            <th>2nd Payment</th>
                                            <th>3rd Payment</th>
                                            <th>4th Payment</th>
                                        <%}%>
					<th>Comments</th>
                                    </tr>
                                </thead>
                                
                                <tbody>                        
                                    <tr>
                                        <td><%= proj.getProject().getProjectName()%></td>
                                        <td><%= proj.getProject().getAcronyme()%></td>
                                        <td><%= proj.getProject().getContractNumber()%></td>
                                        <td><%if (proj.getProject().getStartDate()==null || proj.getProject().getStartDate().equals("null")) {%><%} else {%><%= proj.getProject().getStartDate()%><%}%></td>
                                        <td><%if (proj.getProject().getEndDate()==null || proj.getProject().getEndDate().equals("null")) {%><%} else {%><%= proj.getProject().getEndDate()%><%}%></td>
					<td><%= proj.getProject().getBudget()%></td>
					<td><%= proj.getProject().getTotalProjectGrant()%></td>
					<td><%= proj.getProject().getCmtBudget()%></td>
					<td><%= proj.getProject().getTotalCmtGrant()%></td>
					<td><%= proj.getProject().getPaymentsScheme()%></td>
                                        <% if (proj.getProject().getPaymentsScheme().equals("1")) { %>
                                            <td><%= proj.getProject().getFirstPayment()%></td>
                                        <%} else if (proj.getProject().getPaymentsScheme().equals("2")) { %>
                                            <td><%= proj.getProject().getFirstPayment()%></td>
                                            <td><%= proj.getProject().getSecondPayment()%></td>
                                        <%} else if (proj.getProject().getPaymentsScheme().equals("3")) { %>
                                            <td><%= proj.getProject().getFirstPayment()%></td>
                                            <td><%= proj.getProject().getSecondPayment()%></td>
                                            <td><%= proj.getProject().getThirdPayment()%></td>
                                        <%} else { %>
                                            <td><%= proj.getProject().getFirstPayment()%></td>
                                            <td><%= proj.getProject().getSecondPayment()%></td>
                                            <td><%= proj.getProject().getThirdPayment()%></td>
                                            <td><%= proj.getProject().getFourthPayment()%></td>
                                        <%}%>   
                                        <td><%= proj.getProject().getComments()%></td>
                                    </tr>
                                </tbody>            
                            </table>
                                   
                                </div>
                              
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
         
                <!-- /.col-lg-6 -->
        </div>
            <!-- /.row -->
    </div>

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
