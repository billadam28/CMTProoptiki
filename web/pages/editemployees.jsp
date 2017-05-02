<%@page import="CMTPersistence.Users"%>
<%@page import="CMTPersistence.Employees"%>
<%@page import="CMTServlets.LoginSrvlt"%>
<%@page import="CMTServlets.EditEmployeeSrvlt"%>
<%@page import="CMTServlets.UpdateEmployeeSrvlt"%>
<%@page import="CMTJavaClasses.EmployeesProcessor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                    <h1 class="page-header">Edit Employee Details</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <!-- /.row -->
           
            <div class="row">
                
                <% if (request.getAttribute("revealSuccesMsg") == "true") { %>
                <div class="alert alert-success">Employee Updated Successfully!</div>
                <%}%>
                
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>ID</label>
                                             <% EmployeesProcessor employeesProcessor = (EmployeesProcessor) request.getAttribute("employeesProcessor");%>
                                             <% Employees obj = employeesProcessor.getEmployees(); %>
                                             <input class="form-control" id="eId" value="<%= obj.getId()%>" name="eId" form="editForm" readonly="readonly">
                                        </div>
                                        <div class="form-group">
                                            <label>First Name</label>
                                            <input class="form-control" style="height: auto;" id="eFirstname" value="<%if (obj.getFirstname()==null || obj.getFirstname().equals("null")) {%><%} else {%><%= obj.getFirstname()%><%}%>" name="eFirstname" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input class="form-control" style="height: auto;" id="eLastname" value="<%if (obj.getSurname()==null || obj.getSurname().equals("null")) {%><%} else {%><%= obj.getSurname()%><%}%>" name="eLastname" form="editForm">
                                        </div>
                                        <div class="form-group">
                                        <label>Start Date</label>
                                            <div class='input-group date' id='datetimepicker9'>
                                                <input type='text' class="form-control" id="eSDate" value="<%if (obj.getStartDate()==null || obj.getStartDate().equals("null")) {%><%} else {%><%= obj.getStartDate()%><%}%>" name="eSDate" form="editForm"/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>End Date</label>
                                                <div class='input-group date' id='datetimepicker9'>
                                                    <input type='text' class="form-control" id="eEDate" value="<%if (obj.getEndDate()==null || obj.getEndDate().equals("null")) {%><%} else {%><%= obj.getEndDate()%><%}%>" name="eEDate" form="editForm"/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Unit Cost</label>
                                            <input class="form-control" id="eUcost" value="<%= obj.getUnitCost()%>" name="eUcost" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Salary</label>
                                            <input class="form-control" id="eSalary" value="<%= obj.getSalary()%>" name="eSalary" form="editForm">
                                        </div>
                                        <div class="form-group">
                                            <label>Employee Type</label>
                                            <select class="form-control" name="eType" style="height: auto;" form="editForm">
                                                <% if (obj.getEmployeeType().equals("employee")) {%> 
                                                    <option value="employee"><%=obj.getEmployeeType()%></option>
                                                    <option value="freelancer">freelancer</option>
                                                <%} else {%>
                                                    <option value="freelancer"><%=obj.getEmployeeType()%></option>
                                                    <option value="employee">employee</option>
                                                <%}%>
                                            </select>
                                        </div>
                                
                                        <form id="editForm" method="post" action="UpdateEmployee">
                                                    <button type="submit" class="btn btn-primary">Save</button>
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
        

    <!-- jQuery -->
    <script src="vendor/jquery/jquery-1.9.1.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- Datepicker -->
    <script src="vendor/bootstrap/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('#eSDate').datepicker({
                    format: "yyyy-mm-dd"
                }); 
                
                $('#eEDate').datepicker({
                    format: "yyyy-mm-dd"
                });
            
            });
        </script>

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
