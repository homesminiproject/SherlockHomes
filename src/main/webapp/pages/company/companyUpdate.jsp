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
			<form action="updateAgent.do2" method="post">
				<div class="page-header">
					<h3 class="page-title">
						<span class="page-title-icon bg-gradient-primary text-white mr-2">
							<i class="mdi mdi-contacts"></i>
						</span> 공인중개사 정보수정
					</h3>
				</div>
				
				<div class="row">
				
				<!-- 왼쪽박스 / readonly / 수정불가-->
				<div class="col-4 grid-margin stretch-card" style="height: 900px">
				<div class="card">
				<img src="/SherlockHomes/images/user_6172270.png" id="profile">
				<ul id="leftBox">
					<li>회원번호<br><input type="text" class="form-control form-control-lg"
											id="ea_no" value="${agent.ea_no}" readonly></li>
					<li>아이디<input type="text" class="form-control form-control-lg"
											id="id" name="id" value="${agent.id}" readonly></li>
					<li>비밀번호<input type="password" class="form-control form-control-lg"
											id="pw" value="${agent.pw}" readonly></li>
					<li>사업자번호<input type="text" class="form-control form-control-lg"
											id="regi_number" value="${agent.regi_number}" readonly></li>
					<li>공인중개번호<input type="text" class="form-control form-control-lg"
											id="license_number" value="${agent.license_number}" readonly></li>
					<li>가입일<input type="text" class="form-control form-control-lg"
											id="regdate" name="regdate" value="${agent.regdate}" readonly></li>
				</ul>

				</div>
				</div>
				
				<!-- 오른쪽박스 / 수정 가능한 부분-->
					<div class="col-7 grid-margin stretch-card" style="height: 900px">
						<div class="card">
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<th class="hashtag col-2"><a>공인중개사명</a></th>
											<td class="hashtag col-3"><input type="text" class="form-control form-control-lg"
											id="rep_name" name="rep_name" value="${agent.rep_name}"></td>
										</tr>
			
										<tr>
											<th class="hashtag col-2"><a>상호명</a></th>
											<td class="hashtag col-3"><input type="text" class="form-control form-control-lg"
											id="agency_name" name="agency_name" value="${agent.agency_name}"></td>
										</tr>
										<tr>
										<th class="hashtag col-2"><a>우편번호</a></th>

        							  <td class="hashtag col-3">  <input type="text" class="form-control" id="postcode" name="postcode" value="${agent.postcode}" readonly></td>

       								    <td> <button type="button" class="btn btn-gradient-primary btn-sm" onclick="execDaumPostcode()">우편번호 찾기</button></td>
									</tr>
									<tr>
									<th class="hashtag col-2"><a>주소</a></th>
  								  <td class="hashtag col-6">    <input type="text" class="form-control" id="roadaddress" name="roadaddress" value="${agent.roadaddress}" readonly></td>
    							
   								  <td class="hashtag col-3">   <input type="hidden" id="jibunaddress" name="jibunaddress" value="${agent.jibunaddress}" size="40"></td>
     							<td class="hashtag col-3">   <span id="guide" style="color:#999;display:none"></span></td>
     								</tr>
     								<tr>
     								<th class="hashtag col-2"><a>상세 주소</a></th>
     							 <td class="hashtag col-3">  <input type="text" class="form-control" id="detailaddress" name="detailaddress" value="${agent.detailaddress}"></td>
		
    									</tr>
										<tr>
											<th class="hashtag col-2"><a>핸드폰번호</a></th>
											<td class="hashtag col-3"><input type="text" class="form-control form-control-lg"
											id="phone" name="phone" value="${agent.phone}"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>신고횟수</a></th>
											<td class="hashtag col-3"><input type="text" class="form-control form-control-lg"
											id="report" name="report" value="${agent.report}"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>승인상태</a></th>
											    <td class="hashtag col-3">
										<select class="form-control form-control-lg" id="status" name="status">
										    <option value="${agent.status}" disabled selected hidden>${agent.status}</option>
										    <option value="승인대기" ${agent.status == '승인대기' ? 'hidden' : ''}>승인대기</option>
										    <option value="승인완료" ${agent.status == '승인완료' ? 'hidden' : ''}>승인완료</option>
										</select>
    									</td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>로그인 실패 횟수</a></th>
											<td class="hashtag col-3"><input type="text" class="form-control form-control-lg"
											id="f_count" name="f_count" value="${agent.f_count}"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>계정 잠김</a></th>
											<td class="hashtag col-3"><input type="text" class="form-control form-control-lg"
											id="accountlock" name="accountlock" value="${agent.accountlock}"></td>
										</tr>
									</tbody>
								</table>
							</div>

						<div class="mt-3" style="margin:0.5rem auto">
							<input id="resetPasswordBtn" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" value="패스워드 초기화">
											<input type="submit" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" value="수정">
									</div>
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


document.getElementById('resetPasswordBtn').addEventListener('click', function() {
    // no 값
    var noValue = "your_no_value_here"; // 여기에 실제 no 값을 넣어주세요.

    // 회원번호 값을 JavaScript 변수에 할당
    var ea_No = "${agent.ea_no}";

    // 새 URL 생성
    var newURL = "pwresetAgent.do2?ea_no=" + ea_No;

    // 페이지 이동
    window.location.href = newURL;
    
    alert('패스워드 초기화(qwe123!@#)에 성공했습니다.');
});
</Script>
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