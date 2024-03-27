<%@page import="DAO.UsersDAO"%>
<%@page import="DTO.UsersDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
<style>
#profile{
	margin: 3rem auto;
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
			<form action="updateUser.do8" method="post" id="">
				<div class="page-header">
					<h3 class="page-title">
						<span class="page-title-icon bg-gradient-primary text-white mr-2">
							<i class="mdi mdi-contacts"></i>
						</span> 회원 정보수정
					</h3>
				</div>
				
				<div class="row">
				
				<!-- 왼쪽박스 / readonly / 수정불가-->
				<div class="col-4 grid-margin stretch-card" style="height: 650px">
				<div class="card">
				<img src="/SherlockHomes/images/user_6172270.png" id="profile">
				<ul id="leftBox">
					<li>회원번호<br><input type="text" class="form-control form-control-lg"
											id="no" name="no" value="${user.no}" readonly></li>
					<li>아이디<input type="text" class="form-control form-control-lg"
											id="id" name="id" value="${user.id}" readonly></li>
					<li>비밀번호<input type="password" class="form-control form-control-lg"
											id="pw" name="pw" value="${user.pw}" readonly></li>
    <li>가입일<br><input type="text" class="form-control form-control-lg"
                        id="regdate" name="regdate" value="${user.regdate}" readonly></li>
</ul>
				</div>
				</div>
				
				<!-- 오른쪽박스 / 수정 가능한 부분-->
					<div class="col-7 grid-margin stretch-card" style="height: 650px">
					
						<div class="card">
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
									    
										<tr>
											<th class="hashtag col-2"><a>이름</a></th>
											<td class="hashtag col-3"><input type="text" class="form-control form-control-lg"
											id="name" name="name" value="${user.name}"
											placeholder="Email"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>생년월일</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="birth" name="birth" value="${user.birth}" pattern="[0-9]{6}" maxlength="6" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>전화번호</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="phone" name="phone" value="${user.phone}" pattern="[0-9]{11}" maxlength="11" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>선호지역</a></th>
											<td class="hashtag col-3">
										<select class="form-control form-control-lg" id="region" name="region">
										    <option value="${user.region}" disabled selected hidden>${user.region}</option>
										    <option value="강남구">강남구</option>
										    <option value="강동구">강동구</option>
										    <option value="강북구">강북구</option>
										    <option value="강서구">강서구</option>
										    <option value="관악구">관악구</option>
										    <option value="광진구">광진구</option>
										    <option value="구로구">구로구</option>
										    <option value="금천구">금천구</option>
										    <option value="노원구">노원구</option>
										    <option value="도봉구">도봉구</option>
										    <option value="동대문구">동대문구</option>
										    <option value="동작구">동작구</option>
										    <option value="마포구">마포구</option>
										    <option value="서대문구">서대문구</option>
										    <option value="서초구">서초구</option>
										    <option value="성동구">성동구</option>
										    <option value="성북구">성북구</option>
										    <option value="송파구">송파구</option>
										    <option value="양천구">양천구</option>
										    <option value="영등포구">영등포구</option>
										    <option value="용산구">용산구</option>
										    <option value="은평구">은평구</option>
										    <option value="종로구">종로구</option>
										    <option value="중구">중구</option>
										    <option value="중랑구">중랑구</option>
										</select>
    									</td>
											
										</tr>
										<tr>
											<th class="hashtag col-2"><a>권한</a></th>
											    <td class="hashtag col-3">
										<select class="form-control form-control-lg" id="role" name="role">
										    <option value=${user.role}"" disabled selected hidden>${user.role}</option>
										    <option value="user" ${agent.status == 'user' ? 'hidden' : ''}>user</option>
										    <option value="admin" ${agent.status == 'admin' ? 'hidden' : ''}>admin</option>
										</select>
    									</td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>로그인 실패횟수</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="f_count" name="f_count" value="${user.f_count}" pattern="[0-9]{1}" maxlength="1" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>계정 잠김</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="accountlock" name="accountlock" value="${user.accountlock}" pattern="[0-1]{1}" maxlength="1" oninput="this.value = this.value.replace(/[^0-1]/g, '');" required></td>
										</tr>
									</tbody>
								</table>
							</div>

						<div class="mt-3" style="margin:0.5rem auto">
						<input id="resetPasswordBtn" class="btn btn-gradient-dark btn-icon-text" value="패스워드 초기화" style="width: 180px;">
											<input type="submit"  class="btn btn-gradient-primary mr-2" value="수정하기" style="width: 250px;">
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
	<script>
    // 버튼 클릭 이벤트 처리
    document.getElementById('resetPasswordBtn').addEventListener('click', function() {
        // no 값
        var noValue = "your_no_value_here"; // 여기에 실제 no 값을 넣어주세요.

        // 회원번호 값을 JavaScript 변수에 할당
        var userNo = "${user.no}";

        // 새 URL 생성
        var newURL = "pwresetUser.do8?no=" + userNo;

        // 페이지 이동
        window.location.href = newURL;
        
        alert('패스워드 초기화(qwe123!@#)에 성공했습니다.');
    });
    
    document.addEventListener('DOMContentLoaded', function() {
        // 폼 엘리먼트를 가져옴
        var form = document.getElementById('yourFormId'); // 폼의 ID를 여기에 넣어주세요

        // 폼 제출 이벤트 핸들러
        form.addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 제출 동작 방지

            // 폼 데이터를 FormData 객체로 가져옴
            var formData = new FormData(form);

            // AJAX 요청 설정
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'your_submit_url_here'); // 서버에 폼을 제출할 URL을 여기에 넣어주세요

            // 요청 완료 핸들러
            xhr.onload = function() {
                if (xhr.status === 200) { // 요청이 성공한 경우
                    // 팝업 창을 띄우는 코드를 여기에 추가하세요
                    alert('수정이 성공적으로 완료되었습니다.'); // 예시로 경고창을 띄움
                } else { // 요청이 실패한 경우
                    alert('수정에 실패했습니다. 다시 시도해주세요.'); // 예시로 경고창을 띄움
                }
            };

            // 요청 실패 핸들러
            xhr.onerror = function() {
                alert('요청을 보내는 중에 오류가 발생했습니다. 다시 시도해주세요.'); // 예시로 경고창을 띄움
            };

            // 폼 데이터를 서버로 전송
            xhr.send(formData);
        });
    });
</script>
</body>

</html>