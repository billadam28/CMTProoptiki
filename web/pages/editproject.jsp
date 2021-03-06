<%@page import="CMTPersistence.Users"%>
<%@page import="CMTPersistence.Projects"%>
<%@page import="CMTServlets.LoginSrvlt"%>
<%@page import="CMTServlets.EditProjectSrvlt"%>
<%@page import="CMTServlets.UpdateProjectSrvlt"%>
<%@page import="CMTJavaClasses.ProjectProcessor"%>
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
        <% ProjectProcessor projectProcessor = (ProjectProcessor) request.getAttribute("projectProcessor");%>
        <% Projects obj = projectProcessor.getProject(); %>
        <% Integer id = obj.getId();%>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%= obj.getProjectName()%></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                
            <% if (request.getAttribute("revealSuccesMsg") == "true") { %>
            <div class="alert alert-success">Project Updated Successfully!</div>
            <%}%>
                
                        
                            
                            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edit Project Details.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class=""><a href="LoadProjectDetails?id=<%=id%>"><i class="glyphicon glyphicon-info-sign"></i> Details</a>
                                </li>
                                <li class="active"><a href="EditProject?pId=<%=id%>"><i class="glyphicon glyphicon-edit"></i> Edit</a>
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
                    <div class="col-lg-6">
                        </br>
                        <div class="form-group">
                            <label>Id</label>

                             <input class="form-control" id="pId" value="<%= obj.getId()%>" name="pId" form="editForm" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input class="form-control" id="pName" style="height: auto;" value="<%if (obj.getProjectName()==null || obj.getProjectName().equals("null")) {%><%} else {%><%= obj.getProjectName()%><%}%>" name="pName" form="editForm">
                        </div>
                        <div class="form-group">
                            <label>Acronym</label>
                            <input class="form-control" id="pAcr" style="height: auto;" value="<%if (obj.getAcronyme()==null || obj.getAcronyme().equals("null")) {%><%} else {%><%= obj.getAcronyme()%><%}%>" name="pAcr" form="editForm">
                        </div>
                        <div class="form-group">
                            <label>Contract Number</label>
                            <input class="form-control" id="pConNum" style="height: auto;" value="<%= obj.getContractNumber()%>" name="pConNum" form="editForm">
                        </div>
                        <div class="form-group">
                        <label>Start Date</label>
                            <div class='input-group date' id='datetimepicker9'>
                                <input type='text' class="form-control" id="pSDate" value="<%if (obj.getStartDate()==null || obj.getStartDate().equals("null")) {%><%} else {%><%= obj.getStartDate()%><%}%>" name="pSDate" form="editForm"/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar">
                                    </span>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>End Date</label>
                                <div class='input-group date' id='datetimepicker9'>
                                    <input type='text' class="form-control" id="pEDate" value="<%if (obj.getEndDate()==null || obj.getEndDate().equals("null")) {%><%} else {%><%= obj.getEndDate()%><%}%>" name="pEDate" form="editForm"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar">
                                        </span>
                                    </span>
                                </div>
                        </div>
                        <div class="form-group">
                            <label>Budget</label>
                            <input class="form-control" id="pBud" style="height: auto;" value="<%if (obj.getBudget()==null || obj.getBudget().equals("null")) {%><%} else {%><%= obj.getBudget()%><%}%>" name="pBud" form="editForm">
                        </div>
                        <div class="form-group">
                            <label>Total Project Grant</label>
                            <input class="form-control" id="pTGrant" style="height: auto;" value="<%if (obj.getTotalProjectGrant()==null || obj.getTotalProjectGrant().equals("null")) {%><%} else {%><%= obj.getTotalProjectGrant()%><%}%>" name="pTGrant" form="editForm">
                        </div>
                </div>
                
                </br>
                <!-- /.col-lg-6 (nested) -->
                <div class="col-lg-6">
                        <div class="form-group">
                            <label>Cmt Budget</label>
                            <input class="form-control" id="pCMTBud" style="height: auto;" value="<%if (obj.getCmtBudget()==null || obj.getCmtBudget().equals("null")) {%><%} else {%><%= obj.getCmtBudget()%><%}%>" name="pCMTBud" form="editForm">
                        </div>
                        <div class="form-group">
                            <label>Total Cmt Grant</label>
                            <input class="form-control" id="pTCMTGrant" style="height: auto;" value="<%if (obj.getTotalCmtGrant()==null || obj.getTotalCmtGrant().equals("null")) {%><%} else {%><%= obj.getTotalCmtGrant()%><%}%>" name="pTCMTGrant" form="editForm">
                        </div>
                        <div class="form-group">
                                    <label>Payment Scheme</label>
                                    <% String ps = obj.getPaymentsScheme();%>
                                    <select class="form-control" id="pPaySch" name="pPaySch" style="height: auto;" onchange="showHidePay(this);" form="editForm">     
                                        <% if (ps.equals("1")) {%><option value="1" selected="">1 installment</option><%} else {%><option value="1">1 installment</option><%}%>
                                        <% if (ps.equals("2")) {%><option value="2" selected="">2 installments</option><%} else {%><option value="2">2 installments</option><%}%>
                                        <% if (ps.equals("3")) {%><option value="3" selected="">3 installments</option><%} else {%><option value="3">3 installments</option><%}%>
                                        <% if (ps.equals("4")) {%><option value="4" selected="">4 installments</option><%} else {%><option value="4">4 installments</option><%}%>
                                    </select>
                        </div>
                        <% if (ps.equals("1")) {%>
                        
                            <div class="form-group" id="pay1">
                                <label>First Payment</label>
                                <input class="form-control" id="pFirstPay" value="<%if (obj.getFirstPayment()==null || obj.getFirstPayment().equals("null")) {%><%} else {%><%= obj.getFirstPayment()%><%}%>" name="pFirstPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay2" style="display: none;">
                                <label>Second Payment</label>
                                <input class="form-control" id="pSecPay" value="<%if (obj.getSecondPayment()==null || obj.getSecondPayment().equals("null")) {%><%} else {%><%= obj.getSecondPayment()%><%}%>" name="pSecPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay3" style="display: none;">
                                <label>Third Payment</label>
                                <input class="form-control" id="pThirdPay" value="<%if (obj.getThirdPayment()==null || obj.getThirdPayment().equals("null")) {%><%} else {%><%= obj.getThirdPayment()%><%}%>" name="pThirdPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay4" style="display: none;">
                                <label>Fourth Payment</label>
                                <input class="form-control" id="pFourthPay" value="<%if (obj.getFourthPayment()==null || obj.getFourthPayment().equals("null")) {%><%} else {%><%= obj.getFourthPayment()%><%}%>" name="pFourthPay" form="editForm">
                            </div>
                        <%}%>
                        
                        <% if (ps.equals("2")) {%>
                        
                            <div class="form-group" id="pay1">
                                <label>First Payment</label>
                                <input class="form-control" id="pFirstPay" value="<%if (obj.getFirstPayment()==null || obj.getFirstPayment().equals("null")) {%><%} else {%><%= obj.getFirstPayment()%><%}%>" name="pFirstPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay2">
                                <label>Second Payment</label>
                                <input class="form-control" id="pSecPay" value="<%if (obj.getSecondPayment()==null || obj.getSecondPayment().equals("null")) {%><%} else {%><%= obj.getSecondPayment()%><%}%>" name="pSecPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay3" style="display: none;">
                                <label>Third Payment</label>
                                <input class="form-control" id="pThirdPay" value="<%if (obj.getThirdPayment()==null || obj.getThirdPayment().equals("null")) {%><%} else {%><%= obj.getThirdPayment()%><%}%>" name="pThirdPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay4" style="display: none;">
                                <label>Fourth Payment</label>
                                <input class="form-control" id="pFourthPay" value="<%if (obj.getFourthPayment()==null || obj.getFourthPayment().equals("null")) {%><%} else {%><%= obj.getFourthPayment()%><%}%>" name="pFourthPay" form="editForm">
                            </div>
                        <%}%>
                        
                        <% if (ps.equals("3")) {%>
                        
                            <div class="form-group" id="pay1">
                                <label>First Payment</label>
                                <input class="form-control" id="pFirstPay" value="<%if (obj.getFirstPayment()==null || obj.getFirstPayment().equals("null")) {%><%} else {%><%= obj.getFirstPayment()%><%}%>" name="pFirstPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay2">
                                <label>Second Payment</label>
                                <input class="form-control" id="pSecPay" value="<%if (obj.getSecondPayment()==null || obj.getSecondPayment().equals("null")) {%><%} else {%><%= obj.getSecondPayment()%><%}%>" name="pSecPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay3">
                                <label>Third Payment</label>
                                <input class="form-control" id="pThirdPay" value="<%if (obj.getThirdPayment()==null || obj.getThirdPayment().equals("null")) {%><%} else {%><%= obj.getThirdPayment()%><%}%>" name="pThirdPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay4" style="display: none;">
                                <label>Fourth Payment</label>
                                <input class="form-control" id="pFourthPay" value="<%if (obj.getFourthPayment()==null || obj.getFourthPayment().equals("null")) {%><%} else {%><%= obj.getFourthPayment()%><%}%>" name="pFourthPay" form="editForm">
                            </div>
                        <%}%>
                        
                        <% if (ps.equals("4")) {%>
                        
                            <div class="form-group" id="pay1">
                                <label>First Payment</label>
                                <input class="form-control" id="pFirstPay" value="<%if (obj.getFirstPayment()==null || obj.getFirstPayment().equals("null")) {%><%} else {%><%= obj.getFirstPayment()%><%}%>" name="pFirstPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay2">
                                <label>Second Payment</label>
                                <input class="form-control" id="pSecPay" value="<%if (obj.getSecondPayment()==null || obj.getSecondPayment().equals("null")) {%><%} else {%><%= obj.getSecondPayment()%><%}%>" name="pSecPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay3">
                                <label>Third Payment</label>
                                <input class="form-control" id="pThirdPay" value="<%if (obj.getThirdPayment()==null || obj.getThirdPayment().equals("null")) {%><%} else {%><%= obj.getThirdPayment()%><%}%>" name="pThirdPay" form="editForm">
                            </div>
                            <div class="form-group" id="pay4">
                                <label>Fourth Payment</label>
                                <input class="form-control" id="pFourthPay" value="<%if (obj.getFourthPayment()==null || obj.getFourthPayment().equals("null")) {%><%} else {%><%= obj.getFourthPayment()%><%}%>" name="pFourthPay" form="editForm">
                            </div>
                        <%}%>
                        
                        <div class="form-group">
                            <label>Comments</label>
                            <textarea class="form-control" rows="3" id="pComments" name="pComments" form="editForm" maxlength="250"><%if (obj.getComments()==null || obj.getComments().equals("null")) {%><%} else {%><%= obj.getComments()%><%}%></textarea>
                        </div>
                </div>

                <form id="editForm" method="post" action="UpdateProject">
                            <button type="submit" class="btn btn-primary" onclick="return validateProjectForm_Edit()">Save</button>
                            <button type="reset" class="btn btn-default">Clear changes</button>
                </form>

            </div>
            </div>

       </div> 
    </div>
                    
           
                
        </div>
            <!-- /.row -->
        

    <!-- jQuery -->
    <script src="js/showhidepay.js"></script>
    <script src="vendor/jquery/jquery-1.9.1.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- Datepicker -->
    <script src="vendor/bootstrap/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('#pSDate').datepicker({
                    format: "yyyy-mm-dd"
                }); 
                
                $('#pEDate').datepicker({
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
    <script type="text/javascript" src="js/validateforms.js"></script>

</body>

</html>
