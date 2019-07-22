<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${path }/material-dashboard-master/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${path }/material-dashboard-master/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>팀장 정보</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="${path }/material-dashboard-master/assets/css/css1.css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link
	href="${path }/material-dashboard-master/assets/css/material-dashboard.css?v=2.1.1"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${path }/material-dashboard-master/assets/demo/demo.css"
	rel="stylesheet" />
<style type="text/css">
    label{text-align:left;}
    .form-group{width:100%;}
    td{width:50%;}
</style>
</head>

<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white"
			data-image="${path }/material-dashboard-master/assets/img/sidebar-1.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
			<div class="logo">
				<a href="${path }/main.do?method=main"
					class="simple-text logo-normal"> 팀장 </a>
			</div>
			<div class="sidebar-wrapper">
        <ul class="nav">
         <li class="nav-item  ">
            <a class="nav-link" href="${path }/main.do?method=main">
              <i class="material-icons">dashboard</i>
              <p>팀장 페이지</p>
            </a>
          </li>
           <li class="nav-item active">
            <a class="nav-link" href="${path }/main.do?method=empInfo">
              <i class="material-icons">person</i>
              <p>내 정보</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/team.do?method=teamMember">
              <i class="material-icons">group</i>
              <p>팀원 관리</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/team.do?method=leaderPrj">
              <i class="material-icons">content_paste</i>
              <p>내 업무</p>
            </a>
           </li>
          <%-- <li class="nav-item ">
            <a class="nav-link" href="${path }/typography.do">
              <i class="material-icons">library_books</i>
              <p>Typography</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/icons.do">
              <i class="material-icons">bubble_chart</i>
              <p>Icons</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/map.do">
              <i class="material-icons">location_ons</i>
              <p>Maps</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/notifications.do">
              <i class="material-icons">notifications</i>
              <p>Notifications</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/rtl.do">
              <i class="material-icons">language</i>
              <p>RTL Support</p>
            </a>
          </li>
          <li class="nav-item active-pro ">
            <a class="nav-link" href="${path }/upgrade.do">
              <i class="material-icons">unarchive</i>
              <p>Upgrade to PRO</p>
            </a>
          </li> --%>
        </ul>
      </div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="#pablo">내 정보</a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a class="nav-link"
								href="http://example.com" id="navbarDropdownMenuLink"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="material-icons">notifications</i>
									<c:choose>
										<c:when test="${mem.msgCnt == 0 }">
										</c:when>
										<c:otherwise>
											<span class="notification">${mem.msgCnt }</span>
										</c:otherwise>
									</c:choose>
									<p class="d-lg-none d-md-block">Some Actions</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="${path }/main.do?method=messageList"><i class="material-icons">mail</i>&nbsp;&nbsp;메세지 함</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="material-icons">person</i>
									<p class="d-lg-none d-md-block">Account</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownProfile">
									<a class="dropdown-item" href="${path }/main.do?method=empInfo">Profile</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="${path}/main.do?method=logOut">로그아웃</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title">${empinfo.ename }</h4>
									<p class="card-category">${empinfo.posi }</p>
								</div>
								<div class="card-body">
									<form>
									<table>
									<tr><td>
										<div class="col-md-8">
											<div class="form-group">
													<label class="bmd-label-floating form-control">사원번호 : 
														 ${empinfo.empno }</label>
												</div>
												<div class="form-group">
													<label class="bmd-label-floating form-control">사원이름 : 
														${empinfo.ename }</label>
												</div>
												<div class="form-group">
													<label class="bmd-label-floating form-control">핸드폰번호 : 
														${empinfo.phone }</label>
												</div>
												<div class="form-group">
													<label class="bmd-label-floating form-control">주민등록번호 : 
														${empinfo.civilno }</label>
												</div>
												<div class="form-group">
													<label class="bmd-label-floating form-control">직책 : 
														${empinfo.posi }</label>
												</div>
												<div class="form-group">
													<label class="bmd-label-floating form-control">연봉 : 
														${Math.round(empinfo.sal)}</label>
												</div>
												<div class="form-group">
													<label class="bmd-label-floating form-control">입사일 : 
													<fmt:formatDate value="${empinfo.hiredate}" /></label>
												</div>
												<div class="form-group">
													<label class="bmd-label-floating form-control">프로젝트 유무 : 
														${empinfo.pjdo }</label>
												</div>
											</div>
										</td>
										<td>
											<div class="col-md-4"
												style="margin-left: 100px; margin-top: 50px">
												<div class="card card-profile">
													<div class="card-avatar">
														<a href="#pablo"> <img class="img"
															src="${path }/material-dashboard-master/assets/img/faces/marc.jpg" />
														</a>
													</div>
												</div>
											</div>
										<div class="col-md-8">
										<div class="row">
												<div class="card card-profile">
													<div class="card-body">
														<h6 class="card-category text-gray">CEO / Co-Founder</h6>
														<h4 class="card-title">Alec Thompson</h4>
														<p class="card-description">Don't be scared of the
															truth because we need to restart the human foundation in
															truth</p>
														<a href="#pablo" class="btn btn-primary btn-round">Follow</a>
													</div>
												</div>
											</div>
										</div>
										</td></tr>
										</table>
										<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script
		src="${path }/material-dashboard-master/assets/js/core/jquery.min.js"></script>
	<script
		src="${path }/material-dashboard-master/assets/js/core/popper.min.js"></script>
	<script
		src="${path }/material-dashboard-master/assets/js/core/bootstrap-material-design.min.js"></script>
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!-- Plugin for the momentJs  -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/moment.min.js"></script>
	<!--  Plugin for Sweet Alert -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/sweetalert2.js"></script>
	<!-- Forms Validations Plugin -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/jquery.validate.min.js"></script>
	<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
	<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/bootstrap-selectpicker.js"></script>
	<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
	<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/jquery.dataTables.min.js"></script>
	<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/bootstrap-tagsinput.js"></script>
	<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/jasny-bootstrap.min.js"></script>
	<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/fullcalendar.min.js"></script>
	<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/jquery-jvectormap.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/nouislider.min.js"></script>
	<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
	<script src="${path }/material-dashboard-master/assets/js/core.js"></script>
	<!-- Library for adding dinamically elements -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/arrive.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script
		src="${path }/material-dashboard-master/assets/js/here.js?key=YOUR_KEY_HERE"></script>
	<!-- Chartist JS -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script
		src="${path }/material-dashboard-master/assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="${path }/material-dashboard-master/assets/js/material-dashboard.js"
		type="text/javascript"></script>
	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="${path }/material-dashboard-master/assets/demo/demo.js"></script>
	<script>
	</script>
	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			md.initDashboardPageCharts();

		});
	</script>
</body>

</html>
