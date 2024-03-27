<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>셜록HOMES</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/SherlockHomes/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png"/>

	<style>
	a:hover {
	text-decoration: none;
	}
	</style>
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left p-5">
              <div class="brand-logo text-center">
                <a href="../../index.jsp"><img src="/SherlockHomes/images/HOMES.png" id="logo"> <!-- 로고변경 -->
                <h1 id="logoText">셜록HOMES</h1>
                	<h4 id="logoText">―― 전세사기 없이 청정한 ――</h4></a>
<br>
				<h3>일반회원 로그인</h3>
              </div>
              <form action="loginUser.do8" method="post" class="pt-3" >
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="id" name="id" placeholder="이메일을 입력해주세요" required>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" required>
                </div>
                <div class="mt-3">
                  <input type="submit" value="로그인" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" ></input>
                </div>
             
				<div class="my-2 d-flex justify-content-between align-items-center">
				    <div class="form-group form-check" style="padding-left: 40px;">
				        <input type="checkbox" class="form-check-input" id="agree2">
				        <label class="form-check-label text-muted" for="agree2">아이디 기억하기</label>
				    </div>
				</div>
                  <a href="#" class="auth-link text-black">비밀번호 찾기</a>
              
                <div class="mt-3 text-center">
                    <button id="kakao-login-btn"><img class="auth-form-btn" src="/SherlockHomes/images/kakao_login_medium_wide.png"></button> <!-- 카카오로그인 -->
                </div>
                <div class="text-center mt-4 font-weight-light">
                  계정이 없으신가요? <a href="/SherlockHomes/pages/user/userRegister.jsp" class="text-primary">회원가입하기</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <script src="../../vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/misc.js"></script>
  <!-- endinject -->
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
  document.addEventListener('DOMContentLoaded', function() {
	  var agreeCheckbox2 = document.getElementById('agree2');
	  var idInput2 = document.getElementById('adminid');

	  // 페이지가 로드되었을 때 저장된 아이디가 있으면 아이디 입력칸에 입력
	  if (localStorage.getItem('rememberId2')) {
	    idInput2.value = localStorage.getItem('rememberId2');
	    agreeCheckbox2.checked = true;
	  }

	  // 체크박스 상태에 따라 아이디 기억하기 여부 저장
	  agreeCheckbox2.addEventListener('change', function() {
	    if (agreeCheckbox2.checked) {
	      localStorage.setItem('rememberId2', idInput2.value);
	    } else {
	      localStorage.removeItem('rememberId2');
	    }
	  });
	});
  
  // Kakao SDK 초기화
  Kakao.init('2228b7cba3b84ac52f2df67d278a3bec');

  // 카카오 로그인 버튼 클릭 시 실행될 함수
  document.getElementById('kakao-login-btn').addEventListener('click', function() {
      // 카카오 로그인 창 띄우기
      Kakao.Auth.login({
          success: function(authObj) {
              // 로그인 성공 시 사용자 정보 가져오기
              Kakao.API.request({
                  url: '/v2/user/me',
                  success: function(response) {
                      // 사용자 정보 출력
                      console.log(response);
                      alert('카카오 로그인 성공! 사용자 ID: ' + response.id);
                      window.location.href = 'kakaomainView.do3?userId=' + response.id;
                  },
                  fail: function(error) {
                      alert('사용자 정보를 가져오는 데 실패했습니다.');
                  }
              });
          },
          fail: function(error) {
              alert('카카오 로그인에 실패했습니다.');
          }
      });
  });
</script>
   
</body>

</html>
