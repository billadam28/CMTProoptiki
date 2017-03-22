<%@page import="java.util.Set"%>
<%@page import="CMTServlets.ViewProjectSrvlt"%>
<%@page import="CMTPersistence.Projects"%>
<%@page import="CMTJavaClasses.ViewProjectProcessor"%>
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

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">View Projects</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            All available projects present in the below table.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Project ID</th>
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
					<th>1st Payment</th>
					<th>2nd Payment</th>
					<th>3rd Payment</th>
					<th>4th Payment</th>
					<th>Comments</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                
                                <tbody> 
                                <% ViewProjectProcessor viewprojectProcessor = (ViewProjectProcessor) request.getAttribute("viewprojectProcessor");%>
                                <%if (viewprojectProcessor.getProjectsList().isEmpty() == false) { 
                                 for (Projects obj : viewprojectProcessor.getProjectsList()) { %>                            
                                    <tr>
                                        <td><%= obj.getId()%></td>
                                        <td><%= obj.getProjectName()%></td>
					<td><%= obj.getAcronyme()%></td>
					<td><%= obj.getContractNumber()%></td>
					<td><%= obj.getStartDate()%></td>
					<td><%= obj.getEndDate()%></td>
					<td><%= obj.getBudget()%></td>
					<td><%= obj.getTotalProjectGrant()%></td>
					<td><%= obj.getCmtBudget()%></td>
					<td><%= obj.getTotalCmtGrant()%></td>
					<td><%= obj.getPaymentsScheme()%></td>
					<td><%= obj.getFirstPayment()%></td>
					<td><%= obj.getSecondPayment()%></td>
					<td><%= obj.getThirdPayment()%></td>
                                        <td><%= obj.getFourthPayment()%></td>
                                        <td><%= obj.getComments()%></td>
                                        <td>
                                            <form id="editForm" action="EditProject" method="post">
                                                <button type="submit" name="pId" value="<%= obj.getId()%>">
                                                    <i class="fa fa-edit"></i> Edit
                                                </button>
                                            </form>
                                            <form>
                                                <button type="submit" name="pId" value="<%= obj.getId()%>" action="">
                                                    <i class="fa fa-eraser"></i> Delete
                                                </button>
                                            </form>
                                        </td>
                                <%}%>
                            <%} else {%>
                                        <td><p style="color:red; font-weight: bold">We cannot find any project!</p></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
                                        <td></td> 
                                        <td></td>
                            <%}%>
                                    </tr>
                        		</tbody>
                                        
                                        
                            </table>
                            <!-- /.table-responsive -->
                            
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
