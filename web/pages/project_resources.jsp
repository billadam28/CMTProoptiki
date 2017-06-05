<%@page import="java.util.Set"%>
<%@page import="CMTServlets.ViewProjectSrvlt"%>
<%@page import="CMTServlets.ProjectPlanningSrvlt"%>
<%@page import="CMTServlets.UpdatePlanningSrvlt"%>
<%@page import="CMTJavaClasses.PlanningProcessor"%>
<%@page import="CMTJavaClasses.AllocateUtility"%>
<%@page import="CMTJavaClasses.AvailableDaysUtility"%>
<%@page import="CMTPersistence.Projects"%>
<%@page import="CMTPersistence.Employees"%>
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

        <% Integer id = (Integer) request.getAttribute("projectId");%>
        <% String projName = (String) request.getAttribute("projectName");%>
        <%PlanningProcessor projectPlan = (PlanningProcessor) request.getAttribute("projectPlan");%>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12" style="width:auto;">
                    <h1 class="page-header"><%=projName%></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                
                <div class="col-lg-12" style="width:auto;">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Assign employees to positions.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class=""><a href="LoadProjectDetails?id=<%=id%>"><i class="glyphicon glyphicon-info-sign"></i> Details</a>
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
                                <li class="active"><a href="ProjectResources?id=<%=id%>"><i class="fa fa-child"></i> Resources</a>
                                </li>
                                <li class=""><a href="ProjectMonitoring?id=<%=id%>"><i class="fa fa-line-chart"></i> Monitoring</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home">
                                    <h4>Resources</h4>
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Employees</th>
                                                <th>Positions</th>
                                            </tr>
                                        </thead>

                                        <tbody> 
                                            <tr>
                                                <td>
                                                    <select class="form-control" name="empl" style="height: auto;" form="assignPosition">
                                                        <option value="employee">employee1</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control" name="pos" style="height: auto;" form="assignPosition">
                                                        <option value="position">position1</option>
                                                    </select>
                                                </td>
                                            </tr>
                                                                                 
                                        </tbody>


                                    </table>
                                    <form id="updateForm" method="post" action="assignPosition">
                                        
                                            <button class="btn btn-primary" type="submit" name="pId" value="<%=id%>">Assign</button>
                                        
                                      
                                            <button class="btn btn-default" type="reset" >Clear changes</button>
                                    </form> 
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
