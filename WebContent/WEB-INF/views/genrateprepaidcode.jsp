<%@ page import="java.util.*,java.text.*" session="true"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>airwire Prepaid Code Management System</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/metro.css" rel="stylesheet" />
<link href="assets/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/style_responsive.css" rel="stylesheet" />
<link href="assets/css/style_default.css" rel="stylesheet"
	id="style_color" />
<link href="assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="assets/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="assets/chosen-bootstrap/chosen/chosen.css" />
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-timepicker/compiled/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="stylesheet"
	href="assets/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" />
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css"
	href="assets/uniform/css/uniform.default.css" />
<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="fixed-top">
	<%
   // System.out.println( "Evaluating date now" );
String pattern = "MM/dd/yyyy";
SimpleDateFormat format = new SimpleDateFormat(pattern);
    Date date = new Date();
    String strDate = format.format(date);
%>
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<div class="container-fluid">
				<!-- BEGIN LOGO -->
				<a class="brand" href="index.html"> <img
					src="assets/img/logo.png" alt="logo" /> </a>
				<!-- END LOGO -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a href="javascript:;" class="btn-navbar collapsed"
					data-toggle="collapse" data-target=".nav-collapse"> <img
					src="assets/img/menu-toggler.png" alt="" /> </a>
				<!-- END RESPONSIVE MENU TOGGLER -->
				<!-- BEGIN TOP NAVIGATION MENU -->
				<ul class="nav pull-right">

					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <img alt=""
							src="assets/img/avatar12.jpg" /> <span class="username"><%=session.getAttribute("userName") %></span>
							<i class="icon-angle-down"></i>
					</a>
						<ul class="dropdown-menu">
							<!--  <li><a href="MyProfile.html"><i class="icon-user"></i>My Profile</a></li> 
                            <li class="divider"></li> -->
							<li><a href="login.html"><i class="icon-key"></i>Log Out</a>
							</li>
						</ul></li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU -->
			</div>
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar nav-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<ul>
				<li>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="start">
						<br> <br>
					</div> <!--  BEGIN SIDEBAR TOGGLER BUTTON --></li>
				<!--  <li>
                    BEGIN RESPONSIVE QUICK SEARCH FORM
                    <form class="sidebar-search">
                    <div class="input-box">
                        <a href="javascript:;" class="remove"></a>
                        <input type="text" placeholder="Search..." />
                        <input type="button" class="submit" value=" " />
                    </div>
                    </form>
                    END RESPONSIVE QUICK SEARCH FORM
                </li> -->
				<!--  <li class="start "><a href="dashboard.html"><i class="icon-home"></i><span class="title">
                    Dashboard</span> </a></li> -->
				<li class="start "><a href="genrateprepaidcode.html"><i
						class="icon-table"></i><span class="title"> Genrate Prepaid
							Code</span> </a>
				</li>
				
				<% 
					String role = (String) session.getAttribute("role");
				if(role.equalsIgnoreCase("admin")){
				%>
				<li class="start "><a href="importcsv.html"><i
						class="icon-table"></i><span class="title"> Import csv </span> </a>
				</li>
				<%
				}
				%>
				<!-- <li class="start "><a href="report.html"><i class="icon-table"></i><span class="title">
                     Reports </span> </a></li> -->
				<!-- <li class="start "><a href="AddEnquiry.html"><i class="icon-table"></i><span class="title">
                    Add Enquiry</span> </a></li>
                <li class="start "><a href="EnquiryFollowUp.html"><i class="icon-table"></i><span
                    class="title">EnquiryFollowUp</span> </a></li>
                <li class="start "><a href="QuotationFollowUp.html"><i class="icon-table"></i><span
                    class="title">QuotationFollowUp</span> </a></li>
                <li class="start "><a href="CommercialInformation.html"><i class="icon-table"></i><span
                    class="title">CommercialInfo</span> </a></li>
                <li class="start "><a href="ChangePassword.html"><i class="icon-table"></i><span
                    class="title">ChangePassword</span> </a></li> 
                <li class=""><a href="login.html"><i class="icon-user"></i><span class="title">Login
                    Page</span> </a></li> -->
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div id="portlet-config" class="modal hide">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button">
					</button>
					<h3>portlet Settings</h3>
				</div>
				<div class="modal-body">
					<p>Here will be a configuration form</p>
				</div>
			</div>
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12">
						<div class="tabbable tabbable-custom boxless">
							<ul class="nav nav-tabs">
								<!--    <li class="active"><a href="#tab_1" data-toggle="tab">2 Columns</a></li>-->
								<!--  <li><a class="advance_form_with_chosen_element" href="#tab_2" data-toggle="tab">2 Columns Horizontal</a></li>-->
								<!--                       <li><a href="#tab_3" data-toggle="tab">2 Columns View Only</a></li>
                        <li><a class="advance_form_with_chosen_element" href="#tab_4" data-toggle="tab">Row Seperated</a></li>
                        <li><a class="advance_form_with_chosen_element" href="#tab_5" data-toggle="tab">Bordered</a></li>
                        <li><a class="advance_form_with_chosen_element" href="#tab_6" data-toggle="tab">Bordered & Row Stripped</a></li>
                        <li><a class="advance_form_with_chosen_element" href="#tab_7" data-toggle="tab">Bordered & Label Stripped</a></li>-->
							</ul>
							<div class="tab-content">
								<div>
									<div class="portlet box green">
										<div class="portlet-title">
											<h4>
												<i class="icon-reorder"></i>Generate Prepaid Code
											</h4>
											<div class="tools">
												<a href="javascript:;" class="collapse"></a><a
													href="#portlet-config" data-toggle="modal" class="config"></a><a
													href="javascript:;" class="reload"></a><a
													href="javascript:;" class="remove"></a>
											</div>
										</div>
										<div class="portlet-body form">
											<!-- BEGIN FORM-->
											<form class="form-horizontal" action="saveusedplaninfo.html"
												method="POST" onsubmit="return validateForm()">
												<h3 class="form-section">Fill User Details</h3>
												<!--/row-->
												<div class="row-fluid">
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Select Plan<font
																color="red">*</font>
															</label>
															<div class="controls">
																<select class="m-wrap span12" onchange="call();"
																	id="plan" name="plan">
																	<option value="0">Select Plan</option>
																	 <option value="1">1 Day</option>
                                                                     <option value="2">2 Day</option>
                                                                     <option value="3">3 Day</option>
                                                                     <option value="5">5 Day</option>
                                                                     <option value="7">1 Week</option>
                                                                     <option value="15">15 Day</option>
                                                                     <option value="30">1 Month</option>
																</select> <span class="help-block" id="planer" style="color: red">Select
																	Plan</span>
															</div>
														</div>
													</div>
													<!--/span-->
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Status <font
																color="red">*</font>
															</label>
															<div class="controls">
																<div class="large m-wrap" id="prepaidcodeStatus">
																	<font color="red">${usedPlanInfo}</font>
																</div>
															</div>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row-fluid">
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Amount </label>
															<div class="controls">
																<input type="text" class="large m-wrap" id="amount"
																	name="amount" /> <span class="help-block">Enter
																	Amount</span>
															</div>
														</div>
													</div>
													<!--/span-->
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Date <font
																color="red">*</font> </label>
															<div class="controls">
																<div class="input-append date date-picker"
																	data-date="12-02-2012" data-date-format="dd-mm-yyyy"
																	data-date-viewmode="years">

																	<input class="m-wrap m-ctrl-medium date-picker"
																		size="16" type="text" value="<%=strDate %>" id="date"
																		name="date" readonly /><span class="add-on"><i
																		class="icon-calendar"></i>
																	</span>
																</div>
															</div>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row-fluid">
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Guest Name </label>
															<div class="controls">
																<input type="text" class="large m-wrap" id="guestName"
																	name="guestName" /> <span class="help-block">Enter
																	Guest Name</span>
															</div>
														</div>
													</div>
													<!--/span-->
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Room No. </label>
															<div class="controls">
																<input type="text" class="large m-wrap" id="roomNo"
																	name="roomNo" /> <span class="help-block">Enter
																	Room No.</span>
																	<span
																	id="roomNoer" class="help-block"
																	style="color: red">Enter Location</span>
															</div>
														</div>
													</div>
													<!--/span-->
												</div>
												<div class="row-fluid">
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Select Proof Type<font
																color="red">*</font>
															</label>
															<div class="controls">
																<select class="m-wrap span12" id="photoIdProofType"
																	name="photoIdProofType">
																	<option value="0">Proof Type</option>
																	<option value="ELECTION CARD">Election Card</option>
																	<option value="AADHAR CARD">Aadhar Card</option>
																	<option value="PAN CARD">Pan Card</option>
																	<option value="DRIVING LICENCES">Driving
																		Licences</option>
																	<option value="PASS PORT">Pass Port</option>

																</select> <span class="help-block" id="photoIdProofTypeer"
																	style="color: red">Select Proof Type</span>
															</div>
														</div>
													</div>


													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Photo ID Proof <font
																color="red">*</font>
															</label>
															<div class="controls">
																<input type="text" class="large m-wrap"
																	id="photoIdProof" name="photoIdProof" /> <span
																	id="photoIdProofer" class="help-block"
																	style="color: red">Enter Photo ID Proof</span>
															</div>
														</div>
													</div>
													<!--/span-->

													<!--/span-->
												</div>
												<div class="row-fluid">
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Mobile No. <!-- <font color="red">*</font> -->
															</label>
															<div class="controls">
																<input type="text" class="large m-wrap" id="mobileNo"
																	name="mobileNo" /> <span id="mobileNoer"
																	class="help-block" style="color: red">Enter
																	Mobile No.</span>
															</div>
														</div>
													</div>
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Email Id </label>
															<div class="controls">
																<input type="text" class="large m-wrap" id="emailId"
																	name="emailId" /> <span class="help-block">Enter
																	Email Id</span>
															</div>
														</div>
													</div>
													<!--/span-->
												</div>
												<div class="row-fluid">
													<div class="span6 ">
														<div class="control-group">
															<label class="control-label"> Address </label>
															<div class="controls">
																<input type="text" class="large m-wrap" id="address"
																	name="address" /> <span class="help-block">Enter
																	Guest Address</span>
															</div>
														</div>
													</div>
													<!--/span-->
												</div>


												<!--/span-->

												<!--/row-->
												<div class="form-actions">
													<button type="submit" class="btn blue">
														<i class="icon-ok"></i>Submit
													</button>
													<button type="button" class="btn">Cancel</button>
												</div>
											</form>
											<!-- END FORM-->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		2016 &copy; airwire solutions
		<div class="span pull-right">
			<span class="go-top"><i class="icon-angle-up"></i>
			</span>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS -->
	<!-- Load javascripts at bottom, this will reduce page load time -->
	<script src="assets/js/jquery-1.8.3.min.js"></script>

	<script src="assets/breakpoints/breakpoints.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.blockui.js"></script>
	<script src="assets/js/jquery.cookie.js"></script>
	<!-- ie8 fixes -->
	<!--[if lt IE 9]>
   <script src="assets/js/excanvas.js"></script>
   <script src="assets/js/respond.js"></script>
   <![endif]-->
	<script type="text/javascript"
		src="assets/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="assets/uniform/jquery.uniform.min.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

	<script src="assets/js/app.js"></script>
	<script>
        jQuery(document).ready(function () {

            // to fix chosen dropdown width in inactive hidden tab content
            $('.advance_form_with_chosen_element').on('shown', function (e) {
                App.initChosenSelect('.chosen_category:visible');
            });

            // initiate layout and plugins
            App.init();
            
        });
        
       
        function call(){
        	//alert("Selected");
        	
        	var day =$("#plan").val();
        	if(day!=0){
        	
        	
            $("#amount").val("");
        	$.ajax({
                url:'getprepaidcode.html',
                type:'GET',
                
                data:{day:day},
                success:function(data){
                   //alert(data);
                  if(data.prepaidCode!=null && data.prepaidCode!="NO"){
                   $("#prepaidcodeStatus").html("<font color='green'> "+data.prepaidCode+" Available</font>");
                   $("#planer").hide();
                   $("#amount").val(data.amount);
                  }else{
                	  $("#prepaidcodeStatus").html("<font color='red'>Not Available</font>");
                  }
               
                        
                }
                });
        	}
        }
        
        
        
        function validateForm() {
            var x = $("#photoIdProof").val();
            var a = $("#photoIdProofType").val();
            var roomNo= $("#roomNo").val();
           /*  var y = $("#mobileNo").val(); */
            var z = $("#plan").val();
            
            if (z == 0) {
             	 $("#planer").show();
                 return false;
             } else{
            	 $("#planer").hide();
             }
            
            if (a == 0) {
           	 $("#photoIdProofTypeer").show();
               return false;
           }else{
        	   $("#photoIdProofTypeer").hide();
           }
            if (x == null || x == "") {
            	 $("#photoIdProofer").show();
                return false;
            }else{
           	 $("#photoIdProofer").hide();
            }
            if(roomNo == null || roomNo==""){
            	$("#roomNoer").show();
            	return false;
            }
           /*  if (y == null || y == "") {
           	 $("#mobileNoer").show();
               return false;
           } else{
        	   $("#mobileNoer").hide();
           }*/
               
            return true;
        }
        
        $("#roomNoer").hide();
        $("#photoIdProofer").hide();
        $("#mobileNoer").hide();
        $("#planer").hide();
        $("#photoIdProofTypeer").hide();
        //call();
    </script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
