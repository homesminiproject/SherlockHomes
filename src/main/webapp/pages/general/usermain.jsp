<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>셜록HOMES</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/SherlockHomes/vendor/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/SherlockHomes/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png">
  <style>
  </style>
</head>
<body>
  <div class="container-scroller">
  
    <!-- 상단바 -->
<%@ include file="/pages/layout/header.jsp" %>
    
    <!-- 사이드바 -->
<%@ include file="/pages/layout/sidebar.jsp" %>
      
      
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
                  <h4 class="font-weight-normal mb-3">사용자 페이지 테스트
                    <i class="mdi mdi-account mdi-24px float-right"></i>
                  </h4>
                  <h2 class="mb-5">5121명</h2>
                  <h6 class="card-text">오늘 가입자 수 : 10 명</h6>
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
                  <h2 class="mb-5">126명</h2>
                  <h6 class="card-text">오늘 가입자 수 : 3명</h6>
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
                  <h2 class="mb-5">95,5741</h2>
                  <h6 class="card-text">오늘 체결된 매물 수 : 34개</h6>
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
                      var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
                          center : new kakao.maps.LatLng(37.5518911, 126.9917937), // 지도의 중심좌표 
                          level : 9 // 지도의 확대 레벨 
                      });
                      
                      // 마커 클러스터러를 생성합니다 
                      var clusterer = new kakao.maps.MarkerClusterer({
                          map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
                          averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
                          minLevel: 2 // 클러스터 할 최소 지도 레벨 
                      });
                   
                      // 데이터를 가져오기 위해 jQuery를 사용합니다
                      // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
                      $.get("/download/web/data/chicken.json", function(data) {
                          // 데이터에서 좌표 값을 가지고 마커를 표시합니다
                          // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
                          var markers = $(data.positions).map(function(i, position) {
                              return new kakao.maps.Marker({
                                  position : new kakao.maps.LatLng(position.lat, position.lng)
                              });
                          });
                  
                          // 클러스터러에 마커들을 추가합니다
                          clusterer.addMarkers(markers);
                      });
                  </script>
                    <div id="visit-sale-chart-legend" class="rounded-legend legend-horizontal legend-top-right float-right" style="display: none;" ></div>                                     
                  </div>
                  <canvas id="visit-sale-chart" class="mt-4" style="display: none;"></canvas>
                </div>
              </div>
            </div>
            <div class="col-md-5 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">매물순위 :</h4>
                  <br><hr><br><br>
                  <canvas id="traffic-chart"></canvas>

			<div id="traffic-chart-legend2" class="rounded-legend legend-vertical2 legend-bottom-left pt-4">

			</div>

              </div>
            </div>
          </div>
         </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
<%@ include file="/pages/layout/footer.jsp" %>
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