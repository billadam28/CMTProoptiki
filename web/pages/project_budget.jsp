<%@page import="java.util.Set"%>
<%@page import="CMTServlets.LoadProjectBudget"%>
<%@page import="CMTPersistence.Projects"%>
<%@page import="CMTPersistence.Budget"%>
<%@page import="CMTJavaClasses.ProjectBudgetProcessor"%>
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

            <% ProjectBudgetProcessor budget = (ProjectBudgetProcessor) request.getAttribute("projectBudgetProcessor");%>
            <% Integer id = Integer.parseInt(request.getAttribute("projectId").toString());%>
            <% String projName = (String) request.getAttribute("projectName");%>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><%=projName%></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
						<% if (request.getAttribute("revealSuccesMsg") == "true") { %>
				                <div class="alert alert-success" role="alert"><%=request.getAttribute("SuccesMsg")%>
				                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                </div>
				                <%} else if (request.getAttribute("revealSuccesMsg") == "false") { %>
				                <div class="alert alert-danger" role="alert"><%=request.getAttribute("FailedMsg")%>
				                 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                </div>
				        <%}%>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Project Budget.
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs">
                                    <li class=""><a href="LoadProjectDetails?id=<%=id%>"><i class="glyphicon glyphicon-info-sign"></i> Details</a>
                                    </li>
                                    <li class=""><a href="EditProject?pId=<%=id%>"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                                    </li>
                                    <li class="active"><a href="LoadProjectBudget?id=<%=id%>"><i class="fa fa-money"></i> Budget</a>
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
                                        <h4></h4>
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr id='addr0'>
                                                    <th></th>
                                                    <th>Position</th>
                                                    <th>Daily Cost</th>
                                                    <th>Monthly Cost</th>
                                                    <th>Estimated Person-Days</th>
                                                    <th>Estimated Person-Months</th>
                                                    <th>Sum Cost</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>

                                            <tbody> 
                                                <%int rowid = 1;%>
                                                <%if (budget.getBudgetList().isEmpty() == false) {

                                                        for (Budget bgt : budget.getBudgetList()) {%>
                                                <tr> 
                                                    <td><%=rowid%></td>
                                                    <td><input class="form-control" name="category" id="category_<%=rowid%>" form="saveBudget_<%=rowid%>" value="<%=bgt.getCategory()%>" onchange="calculateCost('<%=rowid%>')"></td>
                                                    <td><input class="form-control" name="dialyCost" id="dialyCost_<%=rowid%>" form="saveBudget_<%=rowid%>" value="<%=bgt.getDialyCost()%>" onchange="calculateCost('<%=rowid%>')"></td>
                                                    <td><input class="form-control" name="monthlyCost" id="monthlyCost_<%=rowid%>" readonly="true" form="saveBudget_<%=rowid%>" value="<%=bgt.getMonthlyCost()%>"></td>
                                                    <td><input class="form-control" name="estimatedPersonDays" id="estimatedPersonDays_<%=rowid%>" form="saveBudget_<%=rowid%>" value="<%=bgt.getEstimatedPersonDays()%>" onchange="calculateCost('<%=rowid%>')"></td>
                                                    <td><input class="form-control" name="estimatedPersonMonths" id="estimatedPersonMonths_<%=rowid%>" readonly="true" form="saveBudget_<%=rowid%>" value="<%=bgt.getEstimatedPersonMonths()%>"></td>
                                                    <td><input class="form-control" name="sumCost" id="sumCost_<%=rowid%>" readonly="true" disabled="true" form="saveBudget_<%=rowid%>" value="<%=(bgt.getMonthlyCost() * bgt.getEstimatedPersonMonths())%>"></td>
                                                    <td>
                                                        <form id="saveBudget_<%=rowid%>" action="UpdateBudgetSrvlt?bId=<%=bgt.getId()%>&pId=<%=id%>" method="post" >
                                                            <button class="btn btn-primary" type="submit" value="">
                                                                Save
                                                            </button>
                                                        </form> 
                                                        <form action="DeleteBudget?bId=<%=bgt.getId()%>&pId=<%=id%>" method="post" >
                                                            <button class="btn btn-danger" value="<%=bgt.getId()%>">
                                                                Delete
                                                            </button>
                                                        </form> 
                                                    </td>
                                                </tr>
                                                <%rowid++;
                                                    }%>
                                                <%} else {
                                                    rowid++;
                                                %>
                                                <tr>
                                                    <td>1</td>
                                                    <td><input class="form-control" name="category" id="category_1" form="saveBudget_1" onchange="calculateCost('1')"></td>
                                                    <td><input class="form-control" name="dialyCost" id="dialyCost_1" form="saveBudget_1" onchange="calculateCost('1')"></td>
                                                    <td><input class="form-control" name="monthlyCost" id="monthlyCost_1" readonly="true" form="saveBudget_1"></td>
                                                    <td><input class="form-control" name="estimatedPersonDays" id="estimatedPersonDays_1" form="saveBudget_1" onchange="calculateCost('1')"></td>
                                                    <td><input class="form-control" name="estimatedPersonMonths" id="estimatedPersonMonths_1" readonly="true" form="saveBudget_1"></td>
                                                    <td><input class="form-control" name="sumCost" id="sumCost_1" disabled="true" readonly="true" form="saveBudget_1"></td>
                                                    <td>
                                                        <form id="saveBudget_1" action="UpdateBudgetSrvlt?bId=0&pId=<%=id%>" method="post" >
                                                            <button class="btn btn-primary" type="submit" value="">
                                                                Save
                                                            </button>
                                                        </form> 
                                                        <form id="deleteBudget_1" action="DeleteBudget?bId=0&pId=<%=id%>" method="post" >
                                                            <button class="btn btn-danger" value="0">
                                                                Delete
                                                            </button>
                                                        </form> 
                                                    </td>
                                                </tr>
                                                <%}%>
                                                <tr id='addr<%=rowid%>'></tr>
                                            </tbody> 
                                            <tfoot>
                                                <tr><td><a id="add_row" class="btn btn-default pull-left">Add Row</a></td></tr>
                                            </tfoot>
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
                                                        $(document).ready(function () {
                                                            $('#dataTables-example').DataTable({
                                                                responsive: true
                                                            });
                                                        });
        </script>

        <script>
            function calculateCost(rowid) {
                var dialyCost = $("#dialyCost_" + rowid).val();
                if (dialyCost == "") {
                    dialyCost = 0;
                }
                
                var estimatedPersonDays = $("#estimatedPersonDays_" + rowid).val();
                if (estimatedPersonDays == "") {
                    estimatedPersonDays = 0;
                }
                var monthlyCost = (dialyCost * 18.3) == NaN ? 0 : (dialyCost * 18.3);
                var estimatedPersonMonths = (estimatedPersonDays / 18.3) == NaN ? 0 : (estimatedPersonDays / 18.3);
                var sumCost = (dialyCost * estimatedPersonDays) == NaN ? 0 : (dialyCost * estimatedPersonDays);

                $("#estimatedPersonMonths_" + rowid).val(estimatedPersonMonths);
                $("#monthlyCost_" + rowid).val(monthlyCost);
          
                $("#sumCost_" + rowid).val(sumCost);
            }
            var row_count = <%=rowid%>;
            $(document).ready(function () {
                $("#add_row").click(function () {
                    $('#addr' + row_count).html("<td>" + row_count
                            + "</td>" +
                            "<td><input class='form-control' name='category' id='category_" + row_count + "' form='saveBudget_" + row_count + "' onchange='calculateCost(" + row_count + ")'></td>" +
                            "<td><input class='form-control' name='dialyCost' id='dialyCost_" + row_count + "' form='saveBudget_" + row_count + "' onchange='calculateCost(" + row_count + ")'></td>" +
                            "<td><input class='form-control' name='monthlyCost' id='monthlyCost_" + row_count + "' readonly='true' form='saveBudget_" + row_count + "'></td>" +
                            "<td><input class='form-control' name='estimatedPersonDays' id='estimatedPersonDays_" + row_count + "' form='saveBudget_" + row_count + "' onchange='calculateCost(" + row_count + ")'></td>" +
                            "<td><input class='form-control' name='estimatedPersonMonths' id='estimatedPersonMonths_" + row_count + "' readonly='true' form='saveBudget_" + row_count + "'></td>" +
                            "<td><input class='form-control' name='sumcost' id='sumCost_" + row_count + "' disabled='true' readonly='true' form='saveBudget_" + row_count + "'></td>" +
                            "<td>   <form id='saveBudget_" + row_count + "' action='UpdateBudgetSrvlt?bId=0&pId=<%=id%>' method='post' >" +
                            "<button class='btn btn-primary' type='submit' value=''>Save</button>" +
                            "</form>" +
                            "<form id='deleteBudget_" + row_count + "' action='DeleteBudget?bId=0&pId=<%=id%>' method='post' >" +
                            "<button class='btn btn-danger' type='submit' value='0'>Delete</button>" +
                            "</form>" +
                            "</td>");
                    $('#dataTables-example tbody').append("<tr id='addr" + (row_count + 1) + "'></tr>");
                    ++row_count;
                });
            });

        </script>

    </body>

</html>