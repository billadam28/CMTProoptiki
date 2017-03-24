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

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Edit Project Details</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <!-- /.row -->
            <% ProjectProcessor projectProcessor = (ProjectProcessor) request.getAttribute("projectProcessor");%>
            <% Projects obj = projectProcessor.getProject(); %>
            <div class="row">
                
                <% if (request.getAttribute("revealSuccesMsg") == "true") { %>
                <div class="alert alert-success">Project Updated Successfully!</div>
                <%}%>
                
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Project Form
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>ID</label>
                                            <input class="form-control" id="pId" value="<%= obj.getId()%>" name="pId" form="editForm">
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
                                        <textarea class="form-control" rows="3" id="pComments" form="editForm"
                                            <%if (obj.getComments()== null || obj.getComments().equals("")) {%> value="No comments" <%} else {%>
                                            value="<%= obj.getComments()%>"<%}%>>
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
