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
<style type="text/css">
.senpro{text-align:center;}
</style>
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
#downfile:hover{font-size:15px;font-weight:bold;cursor:pointer;}
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
          <li class="nav-item  active">
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
            <a class="navbar-brand" href="#pablo">프로젝트 상세현황</a>
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
      
          <!-- ------------------------------------------------------------------------ -->
            <div class="col-lg-14 col-md-14">
              <div class="card">
                <div class="card-header card-header-warning">
                  <h4 class="card-title">나의 업무</h4>
                  <p class="card-category">New employees on 15th September, 2019</p>
                </div>
                <div class="card-body table-responsive">
                  <table class="table table-hover" colspan="25%">
                   <col width="11%"><col width="11%"><col width="11%"><col width="11%"><col width="11%"><col width="11%"><col width="11%"><col width="11%"><col width="11%">
                    <thead class="text-warning">
                      <tr>
                      <th class="senpro">업무번호</th>
                      <th class="senpro">업무정보</th>
                      <th class="senpro">업무단계</th>
                      <th class="senpro">시작일</th>
                      <th class="senpro">종료일</th>
                      <th class="senpro">완료유무</th>
                      <th class="senpro">제출유무</th>
                      <th class="senpro">파일제출</th>
                      <th class="senpro">파일삭제</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="myprj" items="${myprj}">
              		 <form id="${myprj.wno}" enctype="multipart/form-data" method="post">
                      <tr>
                        <td class="senpro">${myprj.wno}</td>
                        <td class="senpro">${myprj.winfo}</td>
                        <td class="senpro">${myprj.stage}</td>
                        <td class="senpro">${myprj.stdte}</td>
                        <td class="senpro">${myprj.eddte}</td>
                        <td class="senpro">${myprj.comple}</td>
                        <td class="senpro">${myprj.submi}</td>
                        <c:choose>
                        <c:when test="${myprj.fname != null}">
                        <td id="downfile" class="senpro">${myprj.fname }</td>
                        <input type="hidden" name="delfname" value="${myprj.fname }"/>
                        <td class="senpro"><input type="button" class="btn btn-danger" value="삭제" onclick="fileDel(${myprj.wno})"/></td>
                        </c:when>
                        <c:otherwise>
                        <td class="senpro"><input type="file" onchange="fileIns(${myprj.wno});" name="report01"/></td>
                        <td class="senpro">제출된 파일이 없습니다.</td>
                        </c:otherwise>
                        </c:choose>
                        <td><input type="hidden"  name="wno" value="${myprj.wno}"/></td>
                      </tr>
                   	</form>
                    </c:forEach>
                    </tbody>
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
		function fileIns(wno){
			if(confirm("파일을 제출 하시겠습니까?")){
				$("form[id="+wno+"]").attr("action","${path}/main.do?method=uploadFile");
				$("form[id="+wno+"]").submit();
			var report01 = $("[name=report01]").val();
			}else{
				$(this).val("");
			}
		}
		function fileDel(wno){
		if(confirm("파일을 삭제 하시겠습니까?")){
				var delfname = $("[name=delfname]").val();
				$("form[id="+wno+"]").attr("action","${path}/main.do?method=deleteFile&fname"+delfname);
				$("form[id="+wno+"]").submit();
			}
		}
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			md.initDashboardPageCharts();
			$("#downfile").click(function(){
				if(confirm("파일을 다운로드 하시겠습니까?")){
				//alert("다운로드할 파일명:"+$(this).html());
				var fname = $(this).html();
				$(location).attr("href","${path}/main.do?method=fileDown&fname="+fname);
				}
			});
		});
		
	</script>
</body>

</html>
