<%@page import="java.util.Set"%>
<%@page import="CMTServlets.ViewProjectSrvlt"%>
<%@page import="CMTServlets.ProjectPlanningSrvlt"%>
<%@page import="CMTServlets.UpdatePlanningSrvlt"%>
<%@page import="CMTJavaClasses.PlanningProcessor"%>
<%@page import="CMTPersistence.Projects"%>
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
                            Allocate resources to project.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class=""><a href="LoadProjectDetails?id=<%=id%>">Details</a>
                                </li>
                                <li class=""><a href="EditProject?pId=<%=id%>">Edit</a>
                                </li>
                                <li class=""><a href="LoadProjectBudget?id=<%=id%>">Budget</a>
                                </li>
                                <li class="active"><a href="ProjectPlanning?id=<%=id%>">Planning</a>
                                </li>
                                <li class=""><a href="#settings" data-toggle="tab" aria-expanded="false">Settings</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home">
                                    <h4>Resources</h4>
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Duration</th>
                                                <%int startYear = projectPlan.getStartYear();
                                                  int dur = projectPlan.getDur();
                                                  int startMonth = projectPlan.getStartMonth();
                                                  int endMonth = projectPlan.getEndMonth();
                                                  int diffMonth = projectPlan.getDiffMonth();
                                                %>
                                                <%if (dur == 0) {%>
                                                <th colspan="<%=endMonth-startMonth+1%>" style="text-align:center;"><%=startYear%></th>
                                                <%}%>
                                               
                                                <%if (dur == 1) {
                                                    for (int i=0; i<=dur-1; i++) { %>
                                                        <th colspan="<%=11-startMonth+1%>" style="text-align:center;"><%=startYear%></th>
                                                    <%}
                                                    for (int i=1; i<=dur; i++) { %>
                                                        <th colspan="<%=endMonth+1%>" style="text-align:center;"><%=startYear+dur%></th>
                                                    <%}%>
                                                <%}%>
                                                        
                                                <%if (dur > 1) {%>
                                                    <th colspan="<%=11-startMonth+1%>" style="text-align:center;"><%=startYear%></th>
                                                    <%for (int i=1; i<=dur-1; i++) { %>
                                                        <th colspan="12" style="text-align:center;"><%=startYear+i%></th>
                                                    <%}%>
                                                    <th colspan="<%=endMonth+1%>" style="text-align:center;"><%=startYear+dur%></th>
                                                <%}%>
                                               
                                            </tr>
                                        </thead>

                                        <tbody> 
                                            <tr>
                                                <td>Months</td>
                                                <%if (dur == 0) {
                                                    for (int i=startMonth; i<=endMonth; i++) { %> 
                                                        <td style="text-align:center;"><%=projectPlan.getMonths()[i]%></td>
                                                    <%}%>
                                                <%} else if (dur == 1) {%>
                                                    <%for (int i=startMonth; i<=11; i++) { %> 
                                                        <td style="text-align:center;"><%=projectPlan.getMonths()[i]%></td>
                                                    <%}%>
                                                    <%for (int i=0; i<=endMonth; i++) { %>
                                                        <td style="text-align:center;"><%=projectPlan.getMonths()[i]%></td>
                                                    <%}%>
                                                <%} else {%>
                                                    <%for (int i=startMonth; i<=11; i++) { %>
                                                        <td style="text-align:center;"><%=projectPlan.getMonths()[i]%></td>
                                                    <%}%>
                                                    
                                                    <%for (int i=1; i<=dur-1; i++) { %>
                                                        <%for (int y=0; y<=11; y++) { %>
                                                            <td style="text-align:center;"><%=projectPlan.getMonths()[y]%></td>
                                                        <%}%>
                                                    <%}%>
                                                    <%for (int i=0; i<=endMonth; i++) { %>
                                                        <td style="text-align:center;"><%=projectPlan.getMonths()[i]%></td>
                                                    <%}%>
                                                    
                                                <%}%>
                                            </tr>
                                            <% for (int i=0; i<10; i++) {%>
                                                <tr>
                                                    <td></td>
                                                    <% for (int j=0; j<=diffMonth; j++) { %>
                                                    <td style="width:auto;">
                                                        <input class="form-control" name="<%=i%>" style="width:42px;" value="<%%>" form="updateForm">
                                                        <input class="form-control" style="width:42px; float: right" value="<%%>" form="updateForm" disabled>
                                                    </td>
                                                    <%}%>
                                                </tr>
                                            <%}%>
                                        </tbody>


                                    </table>
                                    <form id="updateForm" method="post" action="UpdatePlanning">
                                        <button class="btn btn-primary" type="submit" name="pId" value="<%=id%>">Allocate</button>
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
