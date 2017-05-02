<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">

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
                    <h1 class="page-header">Create Employee</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <!-- /.row -->
            <div class="row">
                
                <% if (request.getAttribute("revealSuccesMsg") == "true") { %>
                <div class="alert alert-success">Employee Inserted Successfully!</div>
                <%} else if (request.getAttribute("revealSuccesMsg") == "false") { %>
                <div class="alert alert-danger">Employee already exists. Pick another name and/or acronym. </div>
                <%}%>
                         
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input class="form-control" id="eFirstname" value="" name="eFirstname" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input class="form-control" id="eLastname" value="" name="eLastname" form="createForm">
                                </div>          
                            <div class="form-group">
                                    <label>Start Date</label>
                                        <div class='input-group date' id='datetimepicker9'>
                                            <input type='text' class="form-control" id="eStartdate" placeholder="Click to show calendar" value="" name="eStartdate" form="createForm"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar">
                                                </span>
                                            </span>
                                        </div>
                                </div>
                                 <div class="form-group">
                                    <label>End Date</label>
                                        <div class='input-group date' id='datetimepicker9'>
                                            <input type='text' class="form-control" id="eEnddate" placeholder="Click to show calendar" value="" name="eEnddate" form="createForm"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar">
                                                </span>
                                            </span>
                                        </div>
                                </div>                             
                                <div class="form-group">
                                    <label>Unit Cost</label>
                                    <input class="form-control" id="eUcost" value="" name="eUcost" form="createForm">
                                </div>
                                <div class="form-group">
                                    <label>Salary</label>
                                    <input class="form-control" id="eSalary" value="" name="eSalary" form="createForm">
                                </div>
                                <div class="form-group">
                                            <label>Employee Type</label>
                                            <select class="form-control" name="eType" style="height: auto;" form="createForm">
                                                <option value="employee">employee</option>
                                                <option value="freelancer">freelancer</option>  
                                            </select>
                                        </div>
                                <form id="createForm" method="post" action="InsertNewEmployee">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                        <button type="reset" class="btn btn-default">Clear changes</button>
                                </form>
                        </div>
                        
       
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
                
                $('#eStartdate').datepicker({
                    format: "yyyy-mm-dd"
                }); 
                
                $('#eEnddate').datepicker({
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
