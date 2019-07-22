<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${path }/material-dashboard-master/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path }/material-dashboard-master/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   관리자 PMS
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="${path }/material-dashboard-master/assets/css/css1.css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="${path }/material-dashboard-master/assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${path }/material-dashboard-master/assets/demo/demo.css" rel="stylesheet" />
  <link href='${path }/material-dashboard-master/assets/css/cal_core_main.css' rel='stylesheet' />
  <link href='${path }/material-dashboard-master/assets/css/cal_daygrid_main.css' rel='stylesheet' />
  <link href='${path }/material-dashboard-master/assets/css/cal_timegrid_main.css' rel='stylesheet' />
  <link href='${path }/material-dashboard-master/assets/css/fontawesome_all.css' rel='stylesheet' />
  <link href='${path }/material-dashboard-master/assets/css/list_main.min.css' rel='stylesheet' />
  <style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    /* max-width: 900px;
    margin: 0 auto; */
    max-width: 950px;
    margin: 0 auto;
    padding: 0 auto;
    font-weight:bold;
  }
  #myPieChart {
  	width:575px;
  }
  #prjInfo:hover {
  	cursor: pointer;
  }
  .fc-toolbar h2 {
  	font-size: 1.75em;
  	font-weight:bold;
  	margin: 0;
  }
  .main-panel>.content{
		margin-top: 40px;
    	padding: 30px 15px;
    	min-height: calc(100vh - 123px);
  }
  </style>
  <script type="text/javascript">
  	function  cksession(){
  		var ck = "${mem.permi}"
  		alert(ck);
  	}
  </script>
</head>

<body >
  <div>
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="${path }/material-dashboard-master/assets/img/sidebar-1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo">
        <a class="simple-text logo-normal">
          관리자
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item active  ">
            <a class="nav-link" href="${path }/main.do?method=permision">
              <i class="material-icons">dashboard</i>
              <p>관리자 페이지</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/main.do?method=empList">
              <i class="material-icons">person</i>
              <p>사원 관리</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/team.do?method=tlist">
              <i class="material-icons">group</i>
              <p>팀 관리</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/team.do?method=teamList">
              <i class="material-icons">content_paste</i>
              <p>프로젝트 진행팀 관리</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${path }/prj.do?method=list">
              <i class="material-icons">library_books</i>
              <p>프로젝트 관리</p>
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
            <a class="navbar-brand">관리자 페이지</a>
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
          <!-- Bar Chart -->
          <div class="row">
            <div class="col-xl-6">
	          <div class="card shadow mb-4">
	            <!-- Card Header - Dropdown -->
                <div class="card-header card-header-success">
                  <h4 class="card-title">팀별 매출</h4>
                  <p class="card-category">팀별 매출을 도넛형 그래프로 보여줍니다.</p>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-15 pb-2">
                  	<canvas id="myPieChart"></canvas>
                  </div>
                  <div class="mt-4 card-footer">
                  	<span class="stats">
                  		<i class="material-icons">attach_money</i>단위 : 만원
                  	</span>
                  </div>
                </div>
	          </div>
            </div>
            <div class="col-xl-6">
	            <div class="card shadow mb-4">
	              <div class="card-header card-header-primary">
	                <h4 class="card-title ">년도별 매출</h4>
                  	<p class="card-category">년도별 매출 총합을 막대 그래프로 보여줍니다.</p>
	              </div>
	              <div class="card-body">
	                <div class="chart-bar">
	                  <canvas id="myBarChart"></canvas>
	                </div>
	              </div>
	            </div>
            </div>
          </div>
          <!-- Progress Bar -->
          <div class="row">
            <div class="col-xl-6">
	            <div class="card shadow mb-4">
	                <div class="card-header py-3 card-header-warning">
		               <h4 class="card-title">팀별 진행도</h4>
		               <br>
	                  <div align="center">
	                  	<div class="bg-info" style="float:left;width:15px;height:15px;"></div><p style="float:left;">&nbsp;기간 15일 이상 남음&nbsp;&nbsp;&nbsp;</p>
		              	<div class="bg-danger" style="float:left;width:15px;height:15px;"></div><p style="float:left;">&nbsp;기간 15일 미만 남음&nbsp;&nbsp;&nbsp;</p>
		                <div class="bg-dark" style="float:left;width:15px;height:15px;"></div><p style="float:left;">&nbsp;기간 지남</p>
		              </div>
	                </div>
	                <div class="card-body">
	                <c:forEach var="prj" items="${prjList }">
	                  <h4 class="small font-weight-bold" onclick="prjInfo(${prj.tno});" id="prjInfo">${prj.pjtitle } - ${prj.tno }번 팀 <span class="float-right">${prj.showPercent }% - ${prj.stage }단계</span></h4>
	                  <div class="progress mb-4">
	                    <div class="progress-bar caldte progress-bar-striped progress-bar-animated" id="${prj.pjno }" onclick="calDate('${prj.eddte}',${prj.pjno });" role="progressbar" style="width: ${prj.showPercent}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
	                    <span>${prj.showPercent }%</span>
	                    </div>
	                  </div>
	                </c:forEach>
	                </div>
	              </div>
              </div>
              <div class="col-xl-6">
            	<div class="card shadow mb-4">
            	<div class="card-header card-header-info">
                  <h4 class="card-title">달력</h4>
                  <p class="card-category">팀별로 프로젝트 기간을 보여줍니다.</p>
                </div>
           		<div class="card-body" id='calendar'></div>
            	</div>
           	</div>
          </div>
        </div>
      </div>
    </div>
  </div>
   -->
  <!--   Core JS Files   -->
	<script src='${path }/material-dashboard-master/assets/js/cal_core_main.js'></script>
	<script src='${path }/material-dashboard-master/assets/js/cal_daygrid_main.js'></script>
	<script src='${path }/material-dashboard-master/assets/js/cal_interaction_main.js'></script>
	<script src='${path }/material-dashboard-master/assets/js/cal_timegrid_main.js'></script>
	<script src='${path }/material-dashboard-master/assets/js/bootstrap_main.min.js'></script>
	<script src='${path }/material-dashboard-master/assets/js/list_main.min.js'></script>
	<script src='${path }/material-dashboard-master/assets/js/Chart.min.js'></script>
  <script src="${path }/material-dashboard-master/assets/js/core/jquery.min.js"></script>
  <script src="${path }/material-dashboard-master/assets/js/core/popper.min.js"></script>
  <script src="${path }/material-dashboard-master/assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="${path }/material-dashboard-master/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="${path }/material-dashboard-master/assets/js/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/arrive.min.js"></script>
  <!--  Google Maps Plugin    -->
  <!-- Chartist JS -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${path }/material-dashboard-master/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path }/material-dashboard-master/assets/js/material-dashboard.js" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="${path }/material-dashboard-master/assets/demo/demo.js"></script>
  
  <!-- chart & progress bar -->
  <script src="${path}/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path}/startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="${path}/startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>
  <script src="${path}/startbootstrap-sb-admin-2-gh-pages/vendor/chart.js/Chart.min.js"></script>
  
  <script>
  
    /* 해당 팀이 맡은 프로젝트 정보 */
    function prjInfo(tno){
    	$(location).attr("href", "${path}/team.do?method=teamDetail&tno="+tno);
    }
    
 	$(document).ready(function() {
	   $(".caldte").trigger('click') = true;

      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }
        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);
        });
      });
      md.initDashboardPageCharts();
    });
 	function calDate(input,pjno){
 		var sysdte = new Date();
 	  	var eddte = new Date(input);
 		var tmime = (eddte.getTime() - sysdte.getTime());
 		var itime = 24 * 60 * 60 * 1000;
 		var fdday = tmime / itime;
 		var dday = Math.floor(fdday)+1;
    	if(dday >= 15){
	   		$("#"+pjno).addClass('bg-info');
    	}else if(0 < dday < 15){
	   		$("#"+pjno).addClass('bg-danger');
    	}else if(dday < 0){
	   		$("#"+pjno).addClass('bg-dark');
    	}
    }
 	// 달력
 	 var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      locale:"ko", // 달력 한국어로 설정
      plugins: [ 'dayGrid', 'timeGrid','list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      views:{
    	  dayGridMonth:{
    		  buttonText:"월"
    	  },
    	  timeGridWeek:{
    		  buttonText:"주"
    	  },
    	  timeGridDay:{
    		  buttonText:"일"
    	  },
    	  listMonth:{
      		buttonText:"리스트"  
      	  }
      },
      defaultDate: new Date(), // 달력 현재날짜 페이지로 포커싱
      navLinks: false, // 클릭 시 그 일정의 자세한 정보를 보여줌
      selectable: false, // 달력 드래그 가능 여부
      selectMirror: true,
     /*  select: function(arg) { // 달력 블락 클릭 시 일정 등록 기능
        var title = prompt('일정 등록:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      }, */
     // editable: true, // 일정 드래그 옮기기 기능
      eventClick:function(info,element){
    	  var smonth;
    	  var sday;
    	  var emonth;
    	  var eday;
    	  if(info.event.start.getMonth() < 11){
    		  smonth = '0'+eval(info.event.start.getMonth()+1);
    	  }if(info.event.start.getDate() < 10){
    		  sday = '0'+info.event.start.getDate();
    	  }if(info.event.end.getMonth() < 11){
    		  emonth = '0'+eval(info.event.end.getMonth()+1);
    	  }if(info.event.end.getDate() < 10){
    		  eday = '0'+info.event.end.getDate();
    	  }else{
    		  smonth = eval(info.event.start.getMonth()+1);
    		  sday = info.event.start.getDate();
    		  emonth = eval(info.event.end.getMonth()+1);
    		  eday = info.event.end.getDate();
    	  }
    	  var stdte = info.event.start.getFullYear()+"-"+smonth+"-"+sday;
    	  var eddte = info.event.end.getFullYear()+"-"+emonth+"-"+eday;
    	  alert(info.event.title+"\n시작 날짜 : "+stdte+"\n마감 날짜 : "+eddte);
      },
      eventLimit: true, // allow "more" link when too many events
      events:function(info,successCallback,failureCallback){
    	  $.ajax({
				type:"post",
				url:"${path}/prj.do?method=manageCalendar",
				dataType:"json",
				success:function(data){
					//alert(data.list.title);
					var list = data.plist;
					var events = [];
					for(var idx in list){
						list[idx].url='#';
						var event = list[idx];
						events.push(event);
					}
					successCallback(events);
				},
				error:function(err){
					console.log(err);
				}
			});
      }
    });
    calendar.render();
 	// 차트 (년도별 매출 총액)
 	var chartLabels = [];
 	var chartData = [];
 	try{
 		$.ajax({
    		type:"post",
       		url:"${path}/prj.do?method=chartData",
       		dataType:"json",
       		success:function(data){
       			$.each(data.cdlist, function(inx, obj) {
                    chartLabels.push(obj.labels);
                    chartData.push(obj.data);
                });
       			//alert(chartLabels);
       			//alert(chartData);
       			createChart();
       		},
       		error:function(err){
       			console.log(err);
       		}
    	});
 	}catch(e){
 		alert(e);
 	}
 	var ctx = document.getElementById("myBarChart");
 	function createChart(){
	 	var myBarChart = new Chart(ctx, {
	 	  type: 'bar',
	 	  data: {
	 	    labels: chartLabels,
	 	    datasets: [{
	 	      label: "총액",
	 	      backgroundColor: "#A927B0",
	 	      hoverBackgroundColor: "#A927B0",
	 	      borderColor: "#4e73df",
	 	      data: chartData
	 	    }],
	 	  },
	 	  options: {
	 	    maintainAspectRatio: true,
	 	    layout: {
	 	      padding: {
	 	        left: 10,
	 	        right: 25,
	 	        top: 25,
	 	        bottom: 0
	 	      }
	 	    },
	 	    scales: {
	 	      xAxes: [{
	 	        time: {
	 	          unit: 'month'
	 	        },
	 	        gridLines: {
	 	          display: false,
	 	          drawBorder: false
	 	        },
	 	        ticks: {
	 	          maxTicksLimit: chartLabels.length
	 	        },
	 	        maxBarThickness: 25,
	 	      }],
	 	      yAxes: [{
	 	        ticks: {
	 	          min: 0,
	 	          max: Math.max.apply(null, chartData),
	 	          maxTicksLimit: 10,
	 	          padding: 10,
	 	          // Include a dollar sign in the ticks
	 	          callback: function(value, index, values) {
	 	            return value;
	 	          }
	 	        },
	 	        gridLines: {
		 	      color: "rgb(234, 236, 244)",
	 	          zeroLineColor: "rgb(234, 236, 244)",
	 	          drawBorder: false,
	 	          borderDash: [2],
	 	          zeroLineBorderDash: [2]
	 	        }
	 	      }],
	 	    },
	 	    legend: {
	 	      display: false
	 	    },
	 	    tooltips: {
	 	      titleMarginBottom: 10,
	 	      titleFontColor: '#6e707e',
	 	      titleFontSize: 14,
	 	      backgroundColor: "rgb(255,255,255)",
	 	      bodyFontColor: "#858796",
	 	      borderColor: '#dddfeb',
	 	      borderWidth: 1,
	 	      xPadding: 15,
	 	      yPadding: 15,
	 	      displayColors: false,
	 	      caretPadding: 10,
	 	      callbacks: {
	 	        label: function(tooltipItem, chart) {
	 	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	 	          return datasetLabel + ' : ' + tooltipItem.yLabel + "(만원)";
	 	        }
	 	      }
	 	    },
	 	  }
	 	});
 	}
 	// 차트 (팀별 매출)
 	var labels = [];
   var datas = [];
   var backColors = [];
   var hoverBackColors = [];
   try{
	   $.ajax({
		  type:"post",
		  url:"${path}/prj.do?method=teamStats",
		  dataType:"json",
		  success:function(data){
			  $.each(data.slist, function(inx, obj) {
				  labels.push(obj.labels+"번 팀");
				  datas.push(obj.data);
				  backColors.push(obj.backColors);
				  hoverBackColors.push(obj.hoverBackColors);
			  });
			  stats();
		  },
		  error:function(err){
			  console.log(err);
		  }
	   });
   }catch(e){
	   alert(e);
   }
	var ctx2 = document.getElementById("myPieChart");
	function stats(){
			
		var myPieChart = new Chart(ctx2, {
		  type: 'doughnut',
		  data: {
		    labels: labels,
		    datasets: [{
		      data: datas,
		      backgroundColor: backColors,
		      hoverBackgroundColor: hoverBackColors,
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: true,
		      caretPadding: 10,
		    },
		    legend: {
		      display: true
		    },
		    cutoutPercentage: 70
		  }
		});
	}
  </script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();

    });
  </script>
  
</body>

</html>
