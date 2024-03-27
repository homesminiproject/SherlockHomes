<%@page import="DAO.AgentDAO"%>
<%@page import="DTO.AgentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
<style>
#profile{
	margin: 2rem auto;
	width:10rem;
	height:10rem;
	}
#leftBox{
	list-style:none;
	margin: 0 auto;
	width:20rem;
}
#leftBox>li{
padding: 0.5rem;
}

  #imagePreview {
    width: 100%;
    height: 200px;
    border: 1px solid #ccc;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
  }
  
  #imagePreview img {
    max-width: 100%;
    max-height: 200px;
  }
</style>
</head>
<body>
	<div class="container-scroller">
		<!-- 상단바 -->
		<%@ include file="/pages/layout/header.jsp"%>

		<!-- 사이드바 -->
		<%@ include file="/pages/layout/sidebar.jsp"%>

		<!-- 본문 -->
		<div class="main-panel">
			<div class="content-wrapper">
			<form id="estateForm" action="InsertEstate.do4" method="post" enctype="multipart/form-data">
				<div class="page-header">
					<h3 class="page-title">
						<span class="page-title-icon bg-gradient-primary text-white mr-2">
							<i class="mdi mdi-contacts"></i>
						</span> 매물 등록
					</h3>
				</div>
				
				<div class="row">
				
				<!-- 왼쪽박스 / readonly / 수정불가-->
				<div class="col-4 grid-margin stretch-card" style="height: 1000px">
				<br>
				<div class="card">
				 <div class="row-lg-12" id="boardBox">
            <!-- 이미지 표시 부분 -->
            <div id="imagePreview"></div>
            <input type="file" id="imageInput" name="file" accept="image/*" onchange="uploadImage(event)">
        </div>

				<ul id="leftBox">
					<li>건물종류
			<select class="form-control" id="e_type" name="e_type">
		    <option selected disabled>건물종류</option>
		    <option>아파트</option>
		    <option>오피스텔</option>
		    <option>빌라</option>
		</select>
											</li>
					<li>매매종류
			<select class="form-control" id="p_type" name="p_type">
		    <option selected disabled>매매종류</option>
		    <option>매매</option>
		    <option>전세</option>
		    <option>월세</option>
		</select>
		</li>
					<li>가격<input type="text" class="form-control form-control-lg"
											id="price" name="price" placeholder="가격" ></li>
					<li>면적<input type="text" class="form-control form-control-lg"
											id="area" name="area" placeholder="면적"></li>
					<li>방개수<input type="text" class="form-control form-control-lg"
											id="room" name="room" placeholder="방개수"></li>
					<li>전체층수/현재층수
					<div>
					<input type="text" class="form-control" style="width: 130px; display: inline-block;"   id="max_floor" name="max_floor" placeholder="전체층수">
     				 <input type="text" class="form-control" style="width: 130px; display: inline-block;"  id="e_floor" name="e_floor" placeholder="현재층수">
				</div>
				</li>
				
			<li>부동산명<input type="text" class="form-control form-control-lg"
			id="ea_name" name="ea_name"  placeholder="부동산명"></li>
			<li>준공날짜<input type="text" class="form-control form-control-lg"
			id="e_date" name="e_date" placeholder="준공일ex)2023-07-14"></li>
				</ul>

				</div>
				</div>
				
				<!-- 오른쪽박스 / 수정 가능한 부분-->
					<div class="col-7 grid-margin stretch-card" style="height: 1000px">
						<div class="card">
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
									<tr>
													<div class="container">
											    <div class="row">
											        <div class="col-lg-12">
											            <div id="map" style="width: 100%; height: 400px;"></div>
											            <p id="location"></p>
											        </div>
											    </div>
											</div>
													</tr>
											<tr>
											<th class="hashtag col-2"><a>경도/위도</a></th>
											<td class="hashtag col-3">
											<input type="text" style="width: 250px; display: inline-block;" class="form-control" id="lat" name="lat" placeholder="경도" value="" readonly>
											<input type="text" style="width: 250px; display: inline-block;" class="form-control" id="lng" name="lng" placeholder="위도" value="" readonly></td>
										</tr>							
			

																			<tr>
										<th class="hashtag col-2"><a>우편번호</a></th>

        							  <td class="hashtag col-3"> 
        							   <input type="text"  class="form-control"  style="width: 130px; display: inline-block;" id="postcode" name="postcode" value="${agent.postcode}" readonly>
										<button type="button"  class="btn btn-gradient-primary btn-sm" onclick="execDaumPostcode()">우편번호 찾기</button>
       								    </td>
									</tr>
									<tr>
									<th class="hashtag col-2"><a>주소</a></th>
  								  <td class="hashtag col-6">    <input type="text" class="form-control" id="roadaddress" name="roadaddress" value="${agent.roadaddress}" readonly></td>
    							</tr>
    							<tr>
   								  <td class="hashtag col-3">   <input type="hidden" id="jibunaddress" name="jibunaddress" value="${agent.jibunaddress}" size="40"></td>
     							<td class="hashtag col-3">   <span id="guide" style="color:#999;display:none"></span></td>
     								</tr>
     								<tr>
     								<th class="hashtag col-2"><a>상세 주소</a></th>
     							 <td class="hashtag col-3">  <input type="text" class="form-control" id="detailaddress" name="detailaddress" value="${agent.detailaddress}"></td>
		
    									</tr>


										<tr>
											<th class="hashtag col-2"><a>내용</a></th>
											    <td class="hashtag col-3">
													<textarea style="width: 400px; height: 150px;"
													class="form-control form-control-lg" id="content"
													name="content" placeholder="내용"></textarea></td>
										</tr>
					
									</tbody>
								</table>

						</div>
						  <div class="mt-3" style="margin:0.5rem auto">
                <button type="submit" id="uploadButton" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">등록하기</button>
            </div>
					</div>
				</div>
				</form>
				
				



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
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad7a1a20a25441c5ff0deec83413a834"></script>
<script>
    // 카카오맵 API 초기화
    kakao.maps.load(function() {
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 서울의 좌표
            level: 3 // 지도 확대 레벨
        };

        // 지도 생성
        var map = new kakao.maps.Map(container, options);

        // 지도 클릭 이벤트 리스너 등록
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            var latlng = mouseEvent.latLng; // 클릭한 위치의 위도와 경도를 가져옵니다.
            var latitude = latlng.getLat(); // 위도
            var longitude = latlng.getLng(); // 경도

            // 가져온 위도와 경도를 입력 요소의 값으로 설정합니다.
            document.getElementById('lat').value = latitude;
            document.getElementById('lng').value = longitude;
        });
    });
</script>
				
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<Script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadaddress").value = roadAddr;
            document.getElementById("jibunaddress").value = data.jibunAddress;
     
                   
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("detailaddress").value = extraRoadAddr;
            } else {
                document.getElementById("detailaddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById("jibunaddress").value = data.autoJibunAddress;
                guideTextBox.innerHTML = '(지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}


</Script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // 이미지를 업로드하는 함수
    function uploadImage(event) {
        var file = event.target.files[0];
        var reader = new FileReader();

        // 이미지를 읽어들일 때 실행되는 이벤트 핸들러
        reader.onload = function (event) {
            var imageUrl = event.target.result;
            var imageElement = document.createElement('img');
            imageElement.src = imageUrl;

            // 이미지를 표시할 요소에 추가
            var imagePreview = document.getElementById('imagePreview');
            imagePreview.innerHTML = '';
            imagePreview.appendChild(imageElement);
        };

        // 이미지 파일을 읽음
        reader.readAsDataURL(file);
    }

    // input 요소에 change 이벤트 리스너 추가
/*     var imageInput = document.getElementById('imageInput');
    imageInput.addEventListener('change', uploadImage);

        $(document).ready(function() {
            // 등록하기 버튼 클릭 시
            $('#uploadButton').click(function(event) {
                // 폼 데이터 가져오기
                var formData = $('#estateForm').serialize();

                // AJAX 요청
                $.ajax({
                    type: 'POST', // HTTP 요청 방식
                    url: 'InsertEstate.do4', // 요청을 보낼 URL
                    data: formData, // 전송할 데이터
                    success: function(response) { // 요청 성공 시
                        // 성공 처리
                        console.log('요청 성공');
                        console.log(response); // 서버로부터 받은 응답 확인
                    },
                    error: function(xhr, status, error) { // 요청 실패 시
                        // 실패 처리
                        console.log('요청 실패');
                        console.log(error); // 오류 메시지 출력
                    }
                });
            });
        }); */
    </script>

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