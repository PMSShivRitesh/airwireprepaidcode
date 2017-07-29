<%@ page  session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="assets/A4page.css" rel="stylesheet" />
    <link href="assets/css/metro.css" rel="stylesheet" />
    <link href="assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/style_responsive.css" rel="stylesheet" />
    <link href="assets/css/style_default.css" rel="stylesheet" id="style_color" />
    <link href="assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/chosen-bootstrap/chosen/chosen.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-timepicker/compiled/timepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" href="assets/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="fixed-top">

    <!-- BEGIN HEADER -->
    <div class="header navbar navbar-inverse navbar-fixed-top">
        <!-- BEGIN TOP NAVIGATION BAR -->
        <div class="navbar-inner">
            <div class="container-fluid">
                <!-- BEGIN LOGO -->
                <a class="brand" href="index.html">
                    <img src="assets/img/logo.png" alt="logo" />
                </a>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                    <img src="assets/img/menu-toggler.png" alt="" />
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                 <ul class="nav pull-right">
                 
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown user"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img alt="" src="assets/img/avatar12.jpg" />
                        <span class="username"><%=session.getAttribute("userName") %></span> <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <!-- <li><a href="MyProfile.html"><i class="icon-user"></i>My Profile</a></li> 
                            <li class="divider"></li> -->
                            <li><a href="login.html"><i class="icon-key"></i>Log Out</a></li>
                        </ul>
                    </li>
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
                    <br>
                    <br>
                    </div>
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                </li>
                <!-- <li>
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
                <!-- <li class="start "><a href="dashboard.html"><i class="icon-home"></i><span class="title">
                    Dashboard</span> </a></li> -->
                <li class="start "><a href="genrateprepaidcode.html"><i class="icon-table"></i><span class="title">
                    Genrate Prepaid Code</span> </a></li>
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
                    <h3>
                        portlet Settings</h3>
                </div>
                <div class="modal-body">
                    <p>
                        Here will be a configuration form</p>
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
                                <div >
                                    <div class="portlet box green">
                                        <div class="portlet-title">
                                            <h4>
                                                <i class="icon-reorder"></i>Print Generate Prepaid Code</h4>
                                            <div class="tools">
                                                <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                                                    class="config"></a><a href="javascript:;" class="reload"></a><a href="javascript:;"
                                                        class="remove"></a>
                                            </div>
                                        </div>
                                        <div class="portlet-body form">
                                            <!-- BEGIN FORM-->
                                            
                                            <br>
                                            
                                           <!-- <page size="A4" id="print"> -->
                                             <div id="print">
                                             <!-- <page size="A4"> -->
                                	<table width="100%" border="1px">									
									<tr>
										<td width="48%">
                                				<table   >
                                				<tr>
	                                				<td>
                                						<!-- <img src="assets/img/Keys_Hotel.png" alt="logo"> -->
                                						<b><i>Welcome To ${usedPlanInfo.hotelName}</i></b>
                                					</td>
                                					<td>
                                							<!-- <b><i>High Speed Internet Access</i></b> -->
                                			</td>
                                			</tr>
                                		</table>
                                	<table border="1px" width="100%" >
                                		<tr>
	                                		<td>
	                                			Login Code 	
	                                		</td>
	                                		 <td>
	                                		 	${usedPlanInfo.prepaidCode}
	                                		 </td>
                                		 </tr>
                                	<tr>
	                                		<td>
                                				Validity 
                                			</td>
                                			<td>
                                	  			<c:if test="${usedPlanInfo.plan == 1 || usedPlanInfo.plan == 2 || 
                                	  			usedPlanInfo.plan == 3 || usedPlanInfo.plan == 5 || usedPlanInfo.plan == 15  }">
                                				${usedPlanInfo.plan} Day
                                			</c:if>
                                			<c:if test="${usedPlanInfo.plan == 7}">
                                				1 Week
                                			</c:if>
                                			<c:if test="${usedPlanInfo.plan == 30}">
                                				1 Month
                                			</c:if>
	                                		</td>
	                                </tr>
	                                <tr>
	                                		<td>
                                				Amount     
                                			</td>
                                			<td>  
                                				${usedPlanInfo.amount}
                                			</td>
                                	</tr>
                                	<tr>
		                                	<td>
        			                        	Guest Name 
        			                        </td>
                                			<td>
                                	  			${usedPlanInfo.guestName}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Room No 
											</td>
											<td>
										  		${usedPlanInfo.roomNo}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Photo Id Proof Type 
                                			</td>
                                			<td>  
                                				  ${usedPlanInfo.photoIdProofType} 
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Photo Id Proof 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.photoIdProof}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Mobile No 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.mobileNo}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Address 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.address}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Email Id 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.emailId}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Date 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.date}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td colspan="2">
                                				<b><i>** Office Copy **</i></b> &nbsp;&nbsp; WiFi Internet Access Prepaidcode.
                                			</td>
                                	</tr>
                                	</table>
                                	
                                	</td>
                                	<td width="4%">
                                	</td>
								<td>
                                	<table  width="100%" >
                                		<tr>
	                                		<td>
                                	<!-- <img src="assets/img/logo.png" alt="logo"> -->
                                	<b><i>Welcome To ${usedPlanInfo.hotelName}</i></b>
                                			</td>
                                			<td>
                                					<!-- <b><i>High Speed Internet Access</i></b> -->
                                			</td>
                                			</tr>
                                		</table>
                                	<table border="1px" width="100%" >
                                		<tr>
	                                		<td>
	                                			Login Code 	
	                                		</td>
	                                		 <td>
	                                		 	${usedPlanInfo.prepaidCode}
	                                		 </td>
                                		 </tr>
                                	<tr>
	                                		<td>
                                				Validity 
                                			</td>
                                			<td>
                                			
                                			<c:if test="${usedPlanInfo.plan == 1 || usedPlanInfo.plan == 2 || 
                                	  			usedPlanInfo.plan == 3 || usedPlanInfo.plan == 5 || usedPlanInfo.plan == 15  }">
                                				${usedPlanInfo.plan} Day
                                			</c:if>
                                			<c:if test="${usedPlanInfo.plan == 7}">
                                				1 Week
                                			</c:if>
                                			<c:if test="${usedPlanInfo.plan == 30}">
                                				1 Month
                                			</c:if>
                                	  			
	                                		</td>
	                                </tr>
	                                <tr>
	                                		<td>
                                				Amount     
                                			</td>
                                			<td>  
                                				${usedPlanInfo.amount}
                                			</td>
                                	</tr>
                                	<tr>
		                                	<td>
        			                        	Guest Name 
        			                        </td>
                                			<td>
                                	  			${usedPlanInfo.guestName}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Room No 
											</td>
											<td>
										  		${usedPlanInfo.roomNo}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Photo Id Proof Type 
                                			</td>
                                			<td>  
                                				  ${usedPlanInfo.photoIdProofType} 
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Photo Id Proof 
                                			</td>
                                			<td>  
                                				 ${usedPlanInfo.photoIdProof}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Mobile No 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.mobileNo}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Address 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.address}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Email Id 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.emailId}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td>
                                				Date 
                                			</td>
                                			<td>  
                                				${usedPlanInfo.date}
                                			</td>
                                	</tr>
                                	<tr>
                                			<td colspan="2">
                                				<b><i>** Guest Copy **</i></b> &nbsp;&nbsp; WiFi Internet Access Prepaidcode.
                                			</td>
                                	</tr>
                                	</table>
                                	</td>
                                		</tr>
									</table>
                                	<br>
                                	</div>
                                           
                                         <!--   </page> -->
                                          <!--  <div class="form-actions">
                                                 <button type="submit" class="btn blue" onclick="PrintElem('#print')">
                                                    <i class="icon-ok">Print</i></button> 
                                                     
                                            </div>  -->
                                            
                                            
                                             <div class="form-actions">
                                                <form action="myReport.html" method="GET" target="_blank">
                                                <input type="hidden" name="code" value="${usedPlanInfo.prepaidCode}"/>
                                                <input type="Submit" class="btn blue" value="Print"/>
                                                
                                                
                                                <input type="button" class="btn blue" onclick="sendSms()" value="Send Sms"/>
                                                   </form>  
                                                   <input type="hidden" id="code" name="code" value="${usedPlanInfo.prepaidCode}"/>
                                            </div>
                                             <div id="smsstatus" class="form-actions">
                                                
                                                     
                                            </div> 
                                            
                                            
                                           
                                           
                                            <!-- END FORM-->
                                        </div>
                                    </div>
                                </div>
                                
                                
                              
                                	
                                </div>
                                
                                <br>
                               
                               
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
            <span class="go-top"><i class="icon-angle-up"></i></span>
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
    <script type="text/javascript" src="assets/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="assets/uniform/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script type="text/javascript" src="assets/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>
    <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
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
        	
        	$("#prepaidcode").val("");
            $("#amount").val("");
        	$.ajax({
                url:'getprepaidcode.html',
                type:'GET',
                
                data:{day:day},
                success:function(data){
                   //alert(data);
                  if(data.prepaidCode!=null){
                   $("#prepaidcode").val(data.prepaidCode);
                   $("#amount").val(data.amount);
                  }else{
                	  alert("Selected Plan Prepaid Code Is Not Available, Select Other Plan");
                  }
               
                        
                }
                });
        }
        
        function sendSms(){
        	//alert("Selected");
        	
        	var code =$("#code").val();
        	$.ajax({
                url:'smssend.html',
                type:'GET',
                
                data:{"code":code},
                success:function(data){
                   //alert(data);
                 
                   $("#smsstatus").html("<font color='green'> "+data+"</font>");
                 
               
                        
                }
                });
        	}
        
        
        
    </script>
    
    
    
    <script type="text/javascript">

    function PrintElem(elem)
    {
        Popup($(elem).html());
    }

    function Popup(data) 
    {
        var mywindow = window.open('', 'Prepaid Code','height=400,width=600');
        mywindow.document.write('<html><head><title>Prepaid Code</title>');
        /*optional stylesheet*/ //mywindow.document.write('<link rel="stylesheet" href="main.css" type="text/css" />');
        mywindow.document.write('</head><body ><style>td {font-size: 40px;}	</style>');
        mywindow.document.write(data);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10

        mywindow.print();
        mywindow.close();

        return true;
    }
    /* PrintElem('#print'); */
</script>
    <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
