<%-- 
    Document   : create_project_form
    Created on : Mar 19, 2017, 2:44:10 PM
    Author     : adamopoulo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/include/admin_head.jsp" %>

<body>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <%@ include file="/include/global_menubar.jsp" %>
            <!-- /.navbar-top-links -->

            <%@ include file="/include/admin_menu.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Create Project</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <!-- /.row -->
            <div class="row">
                
                <% if (request.getAttribute("revealSuccesMsg") == "true") { %>
                <div class="alert alert-success">Project Inserted Successfully!</div>
                <%} else if (request.getAttribute("revealSuccesMsg") == "false") { %>
                <div class="alert alert-danger">Project already exists. Pick another name and/or acronym. </div>
                <%}%>
                         
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input class="form-control" id="pName" value="" name="pName" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Acronym</label>
                                    <input class="form-control" id="pAcr" value="" name="pAcr" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Contract Number</label>
                                    <input class="form-control" id="pConNum" value="" name="pConNum" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Start Date</label>
                                        <div class='input-group date' id='datetimepicker9'>
                                            <input type='text' class="form-control" id="pSDate" placeholder="Click to show calendar" value="" name="pSDate" form="createForm"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar">
                                                </span>
                                            </span>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label>End Date</label>
                                        <div class='input-group date' id='datetimepicker9'>
                                            <input type='text' class="form-control" id="pEDate" placeholder="Click to show calendar" value="" name="pEDate" form="createForm"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar">
                                                </span>
                                            </span>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label>Budget</label>
                                    <input class="form-control" id="pBud" value="" name="pBud" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Total Project Grant</label>
                                    <input class="form-control" id="pTGrant" value="" name="pTGrant" form="createForm">
                                </div>
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                        <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Cmt Budget</label>
                                    <input class="form-control" id="pCMTBud" value="" name="pCMTBud" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Total Cmt Grant</label>
                                    <input class="form-control" id="pTCMTGrant" value="" name="pTCMTGrant" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Payment Scheme</label>
                                    <input class="form-control" id="pPaySch" value="" name="pPaySch" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>First Payment</label>
                                    <input class="form-control" id="pFirstPay" value="" name="pFirstPay" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Second Payment</label>
                                    <input class="form-control" id="pSecPay" value="" name="pSecPay" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Third Payment</label>
                                    <input class="form-control" id="pThirdPay" value="" name="pThirdPay" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Fourth Payment</label>
                                    <input class="form-control" id="pFourthPay" value="" name="pFourthPay" form="createForm">
                                </div>
                                <div class="form-group">
                                <label>Comments</label>
                                <textarea class="form-control" rows="3" name="pComments" form="createForm" placeholder="Give a short description for the project (up to 250 characters)" maxlength="250"></textarea>    
       
                        </div>
                    </div>

                        <form id="createForm" method="post" action="InsertNewProject">
                                    <button type="submit" class="btn btn-default">Save</button>
                                    <button type="reset" class="btn btn-default">Clear changes</button>
                        </form>
       
                    </div>
                            <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
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
    </body>
</html>
