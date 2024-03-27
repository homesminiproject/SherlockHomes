<%@page import="DTO.EstateDTO"%>
<%@page import="DAO.EstateDAO"%>
 <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>셜록HOMES</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/SherlockHomes/vendor/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="/SherlockHomes/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
#estateChart {
	width: 20rem !important;
	height: 20rem !important;
	margin: 0.5rem auto !important;
}
</style>

</head>
<body>
	<div class="container-scroller">

		<!-- 상단바 -->
		<%@ include file="/pages/layout/header.jsp"%>

		<!-- 사이드바 -->
		<%@ include file="/pages/layout/sidebar.jsp"%>

      <!--메인 -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <div class="page-header">
            <h3 class="page-title">
              <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-home"></i>                 
              </span>
              대쉬보드
            </h3>
            <nav aria-label="breadcrumb">
              <ul class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">
                  <span></span>메인페이지
                  <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                </li>
              </ul>
            </nav>
          </div>
          <div class="row">
            <div class="col-md-4 stretch-card grid-margin">
              <div class="card bg-gradient-danger card-img-holder text-white">
                <div class="card-body">
                  <img src="/SherlockHomes/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image"/>
                  <h4 class="font-weight-normal mb-3">일반회원 수
                    <i class="mdi mdi-account mdi-24px float-right"></i>
                  </h4>
                  <h2 class="mb-5">${userData[0]}명</h2>
                  <h6 class="card-text">오늘 가입자 수 : ${userData[1]} 명</h6>
                </div>
              </div>
            </div>
            <div class="col-md-4 stretch-card grid-margin">
              <div class="card bg-gradient-info card-img-holder text-white">
                <div class="card-body">
                  <img src="/SherlockHomes/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image"/>                  
                  <h4 class="font-weight-normal mb-3">공인중개사 수
                    <i class="mdi mdi-domain mdi-24px float-right"></i>
                  </h4>
                  <h2 class="mb-5">${userData[2]}명</h2>
                  <h6 class="card-text">오늘 가입자 수 : ${userData[3]}명</h6>
                </div>
              </div>
            </div>
            <div class="col-md-4 stretch-card grid-margin">
              <div class="card bg-gradient-success card-img-holder text-white">
                <div class="card-body">
                  <img src="/SherlockHomes/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image"/>                                    
                  <h4 class="font-weight-normal mb-3">총 매물 개수
                    <i class="mdi mdi-diamond mdi-24px float-right"></i>
                  </h4>
                  <h2 class="mb-5">${userData[4]}개</h2>
                  <h6 class="card-text">오늘 등록된 매물 수 : ${userData[5]}개</h6>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-7 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <div class="clearfix">
                    <h4 class="card-title float-left">매물정보</h4>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad7a1a20a25441c5ff0deec83413a834"></script>
                    <p style="margin-top:-12px">
              
                  </p>
                  <div id="map" style="width:100%;height:350px;"></div>		
									
									
  <script>
 
  
  
  
    var mapContainer = document.getElementById('map'); // 지도를 표시할 div
    var mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도 중심 좌표 (서울)
        level: 9 // 지도 확대 레벨
    };

    // 지도 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 매물 데이터 (예시)
    var properties = [
        <%
            EstateDAO estateDAO = new EstateDAO();
            List<EstateDTO> estateList = estateDAO.getEstateAll(null);
            for (int i = 0; i < estateList.size(); i++) {
                EstateDTO estate = estateList.get(i);
        %>
        {
            name: '매물 <%= estate.getE_no() %>',
            latlng: new kakao.maps.LatLng(<%= estate.getLat() %>, <%= estate.getLng() %>),
            address: '<%= estate.getRoadaddress() %>',
            description: '<%= estate.getContent() %>'
        }
        <%-- 마지막 항목일 때는 쉼표(,) 없이 출력 --%>
        <% if (i != estateList.size() - 1) { %>,<% } %>
        <% } %>
    ];

    // 매물 위치를 지도에 표시
    properties.forEach(function(property) {
        var marker = new kakao.maps.Marker({
            position: property.latlng,
            map: map
        });

        // 정보창에 들어갈 내용
        var content = '<div style="padding:5px;">' +
            '<strong>' + property.name + '</strong><br>' +
            '주소: ' + property.address + '<br>' +
            '설명: ' + property.description +
            '</div>';

        // 마커 클릭 시 정보창 표시
        kakao.maps.event.addListener(marker, 'click', function() {
            var infowindow = new kakao.maps.InfoWindow({
                content: content,
                maxHeight: 300
            });
            infowindow.open(map, marker);
        });
    });
    
</script>
									<div id="visit-sale-chart-legend"
										class="rounded-legend legend-horizontal legend-top-right float-right"
										style="display: none;"></div>
								</div>
								<canvas id="visit-sale-chart" class="mt-4"
									style="display: none;"></canvas>
							</div>
						</div>
					</div>
					<div class="col-md-5 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">매물순위</h4>
								<hr>
								<%EstateDAO dao = new EstateDAO(); %>
									<canvas id="estateChart"></canvas>
									<script>
const ctx = document.getElementById('estateChart').getContext('2d');
const estateChart = new Chart(ctx, {
	type: 'doughnut',
    data: {
    	labels: [
    	    '강남구',
    	    '강북구',
    	    '강서구'
    	  ],
    	  datasets: [{
    	    label: '매물 수',
    	    data: [<%=dao.getGangNamCount() %>, <%=dao.getGangBukCount() %>, <%=dao.getGangSeoCount() %>],
    	    backgroundColor: [
    	      'rgb(255, 99, 132)',
    	      'rgb(54, 162, 235)',
    	      'rgb(255, 205, 86)'
    	    ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            hoverOffset: 4
        }]
    }
});
</script>
							</div>
						</div>
					</div>
				</div>


				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<%@ include file="/pages/layout/footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<!-- plugins:js -->
	<script src="/SherlockHomes/vendors/js/vendor.bundle.base.js"></script>
	<script src="/SherlockHomes/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="/SherlockHomes/js/off-canvas.js"></script>
	<script src="/SherlockHomes/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="/SherlockHomes/js/dashboard.js"></script>
	<!-- End custom js for this page-->
</body>

</html>