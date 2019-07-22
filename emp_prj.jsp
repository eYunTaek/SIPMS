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
<title>사원 PMS</title>
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
    th,td{text-align:center;}
</style>
<style type="text/css">
  	tr:hover{font-size:15px;font-weight:bold;cursor:pointer;}
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
				<a href="${path }/main.do?method=main" class="simple-text logo-normal">
          사원
        </a>
			</div>
  <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="${path }/main.do?method=main">
              <i class="material-icons">dashboard</i>
              <p>사원 페이지</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/main.do?method=empInfo">
              <i class="material-icons">person</i>
              <p>내 정보</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/main.do?method=empteaminfo">
              <i class="material-icons">group</i>
              <p>팀원 정보</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="${path }/team.do?method=empPrj">
              <i class="material-icons">content_paste</i>
              <p>프로젝트 현황</p>
            </a>
          </li>
        </ul>
      </div>
		</div>
		<div class="main-panel">
			      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="#pablo">프로젝트 현황</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
              <li class="nav-item dropdown">
                <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">notifications</i>
                  <c:choose>
		                  <c:when test="${mem.msgCnt == 0 }">
		                  </c:when>
		                  <c:otherwise>
		                  	<span class="notification">${mem.msgCnt }</span>
		                  </c:otherwise>
	                  </c:choose>
                  <p class="d-lg-none d-md-block">
                    Some Actions
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="${path }/main.do?method=messageList"><i class="material-icons">mail</i>&nbsp;&nbsp;메세지 함</a>
                </div>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <a class="dropdown-item" href="${path }/main.do?method=empInfo">Profile</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="${path}/main.do?method=logOut">로그아웃</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<div class="card">
								<div class="card-header card-header-warning">
									<h4 class="card-title">프로젝트 현황</h4>
									<p class="card-category">자세히 보려면 더블클릭 하세요</p>
								</div>
								<div class="card-body table-responsive">
									<table class="table table-hover">
										<thead class="text-warning">
											<tr><th>번호</th>
											<th>프로젝트명</th>
											<th>회사명</th>
											<th>파견지역</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>단가</th>
											<th>진행률(%)</th></tr>
										</thead>
										<c:choose>
										<c:when test="${myprj !=null }">
										<tbody>
											<tr id="prj01">
												<td id="sendpjno">${myprj.pjno}</td>
												<td>${myprj.pjtitle}</td>
												<td>${myprj.comname}</td>
												<td>${myprj.area}</td>
												<td>${myprj.stdte}</td>
                    						    <td>${myprj.eddte}</td>
												<td>${myprj.cost}</td>
								                <td>  <div class="progress">
													  <div class="progress-bar progress-bar-striped progress-bar-animated" id="caldte" onclick="calDate('${myprj.eddte}');" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: ${showPercent.showPercent}%;">
													  <span>${showPercent.showPercent}</span>
													  </div>
													 </div></td>
											</tr>
										</tbody>
										</c:when>
										<c:otherwise>
										<tr><td colspan="8">참여한 프로젝트가 없습니다</td></tr>
										</c:otherwise>
										</c:choose>
									</table>
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
	  function calDate(input){
		  	var sysdte = new Date();
		  	var eddte = new Date(input);
			var tmime = (eddte.getTime() - sysdte.getTime());
			var itime = 24 * 60 * 60 * 1000;
			var fdday = tmime / itime;
			var dday = Math.floor(fdday)+1;
		  	if(dday >= 15){
			   		$("#caldte").addClass('bg-info');
		  	}else if(0 < dday < 15){
			   		$("#caldte").addClass('bg-danger');
		  	}else if(dday < 0){
			   		$("#caldte").addClass('bg-dark');
		  	}
		  }
		$(document)
				.ready(
						function() {
							$()
									.ready(
											function() {
												$sidebar = $('.sidebar');

												$sidebar_img_container = $sidebar
														.find('.sidebar-background');

												$full_page = $('.full-page');

												$sidebar_responsive = $('body > .navbar-collapse');

												window_width = $(window)
														.width();

												fixed_plugin_open = $(
														'.sidebar .sidebar-wrapper .nav li.active a p')
														.html();

												if (window_width > 767
														&& fixed_plugin_open == 'Dashboard') {
													if ($(
															'.fixed-plugin .dropdown')
															.hasClass(
																	'show-dropdown')) {
														$(
																'.fixed-plugin .dropdown')
																.addClass(
																		'open');
													}

												}

												$('.fixed-plugin a')
														.click(
																function(event) {
																	// Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
																	if ($(this)
																			.hasClass(
																					'switch-trigger')) {
																		if (event.stopPropagation) {
																			event
																					.stopPropagation();
																		} else if (window.event) {
																			window.event.cancelBubble = true;
																		}
																	}
																});

												$(
														'.fixed-plugin .active-color span')
														.click(
																function() {
																	$full_page_background = $('.full-page-background');

																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data-color',
																						new_color);
																	}

																	if ($full_page.length != 0) {
																		$full_page
																				.attr(
																						'filter-color',
																						new_color);
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.attr(
																						'data-color',
																						new_color);
																	}
																});

												$(
														'.fixed-plugin .background-color .badge')
														.click(
																function() {
																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'background-color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data-background-color',
																						new_color);
																	}
																});

												$('.fixed-plugin .img-holder')
														.click(
																function() {
																	$full_page_background = $('.full-page-background');

																	$(this)
																			.parent(
																					'li')
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.parent(
																					'li')
																			.addClass(
																					'active');

																	var new_image = $(
																			this)
																			.find(
																					"img")
																			.attr(
																					'src');

																	if ($sidebar_img_container.length != 0
																			&& $('.switch-sidebar-image input:checked').length != 0) {
																		$sidebar_img_container
																				.fadeOut(
																						'fast',
																						function() {
																							$sidebar_img_container
																									.css(
																											'background-image',
																											'url("'
																													+ new_image
																													+ '")');
																							$sidebar_img_container
																									.fadeIn('fast');
																						});
																	}

																	if ($full_page_background.length != 0
																			&& $('.switch-sidebar-image input:checked').length != 0) {
																		var new_image_full_page = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						'img')
																				.data(
																						'src');

																		$full_page_background
																				.fadeOut(
																						'fast',
																						function() {
																							$full_page_background
																									.css(
																											'background-image',
																											'url("'
																													+ new_image_full_page
																													+ '")');
																							$full_page_background
																									.fadeIn('fast');
																						});
																	}

																	if ($('.switch-sidebar-image input:checked').length == 0) {
																		var new_image = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						"img")
																				.attr(
																						'src');
																		var new_image_full_page = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						'img')
																				.data(
																						'src');

																		$sidebar_img_container
																				.css(
																						'background-image',
																						'url("'
																								+ new_image
																								+ '")');
																		$full_page_background
																				.css(
																						'background-image',
																						'url("'
																								+ new_image_full_page
																								+ '")');
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.css(
																						'background-image',
																						'url("'
																								+ new_image
																								+ '")');
																	}
																});

												$('.switch-sidebar-image input')
														.change(
																function() {
																	$full_page_background = $('.full-page-background');

																	$input = $(this);

																	if ($input
																			.is(':checked')) {
																		if ($sidebar_img_container.length != 0) {
																			$sidebar_img_container
																					.fadeIn('fast');
																			$sidebar
																					.attr(
																							'data-image',
																							'#');
																		}

																		if ($full_page_background.length != 0) {
																			$full_page_background
																					.fadeIn('fast');
																			$full_page
																					.attr(
																							'data-image',
																							'#');
																		}

																		background_image = true;
																	} else {
																		if ($sidebar_img_container.length != 0) {
																			$sidebar
																					.removeAttr('data-image');
																			$sidebar_img_container
																					.fadeOut('fast');
																		}

																		if ($full_page_background.length != 0) {
																			$full_page
																					.removeAttr(
																							'data-image',
																							'#');
																			$full_page_background
																					.fadeOut('fast');
																		}

																		background_image = false;
																	}
																});

												$('.switch-sidebar-mini input')
														.change(
																function() {
																	$body = $('body');

																	$input = $(this);

																	if (md.misc.sidebar_mini_active == true) {
																		$(
																				'body')
																				.removeClass(
																						'sidebar-mini');
																		md.misc.sidebar_mini_active = false;

																		$(
																				'.sidebar .sidebar-wrapper, .main-panel')
																				.perfectScrollbar();

																	} else {

																		$(
																				'.sidebar .sidebar-wrapper, .main-panel')
																				.perfectScrollbar(
																						'destroy');

																		setTimeout(
																				function() {
																					$(
																							'body')
																							.addClass(
																									'sidebar-mini');

																					md.misc.sidebar_mini_active = true;
																				},
																				300);
																	}

																	// we simulate the window Resize so the charts will get updated in realtime.
																	var simulateWindowResize = setInterval(
																			function() {
																				window
																						.dispatchEvent(new Event(
																								'resize'));
																			},
																			180);

																	// we stop the simulation of Window Resize after the animations are completed
																	setTimeout(
																			function() {
																				clearInterval(simulateWindowResize);
																			},
																			1000);

																});
											});
						});
	</script>
	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			md.initDashboardPageCharts();
		$("#prj01").dblclick(function(){
			$(location).attr("href","${path}/main.do?method=prjDetail");
			
		});
		$(".progress-bar").trigger('click') = true;
		
	});
	</script>
</body>

</html>
