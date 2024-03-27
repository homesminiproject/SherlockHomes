<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>셜록HOMES</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/SherlockHomes/vendor/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/SherlockHomes/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png"/>

	<style>
	.mb-2{
	margin-left:1.5rem;
	}
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
                <a href="/SherlockHomes/index.jsp"><img src="/SherlockHomes/images/HOMES.png" id="logo"> <!-- 로고변경 -->
                <h1 id="logoText">셜록HOMES</h1>
                	<h4 id="logoText">―― 전세사기 없이 청정한 ――</h4></a>
                	<br>
				<h3>공인중개사 로그인</h3>
              </div>
                <form action="loginAgent.do2" method="post" class="pt-3" >
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="agentid" name="agentid" placeholder="이메일을 입력해주세요" required>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" required>
                </div>
                <div class="mt-3">
                  <input type="submit" value="로그인" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" ></input>
                </div>
                
			<div class="my-2 d-flex justify-content-between align-items-center">
				    <div class="form-group form-check" style="padding-left: 40px;">
				        <input type="checkbox" class="form-check-input" id="agree3">
				        <label class="form-check-label text-muted" for="agree3">아이디 기억하기</label>
				    </div>
				</div>
                  <a href="#" class="auth-link text-black">비밀번호 찾기</a>
          
                <div class="text-center mt-4 font-weight-light">
                  계정이 없으신가요? <a href="companyRegister.jsp" class="text-primary">회원가입하기</a>
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
  <script src="/SherlockHomes/vendors/js/vendor.bundle.base.js"></script>
  <script src="/SherlockHomes/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/SherlockHomes/js/off-canvas.js"></script>
  <script src="/SherlockHomes/js/misc.js"></script>
  <!-- endinject -->
    <script>
  document.addEventListener('DOMContentLoaded', function() {
	  var agreeCheckbox3 = document.getElementById('agree3');
	  var idInput3 = document.getElementById('agentid');

	  // 페이지가 로드되었을 때 저장된 아이디가 있으면 아이디 입력칸에 입력
	  if (localStorage.getItem('rememberId3')) {
	    idInput3.value = localStorage.getItem('rememberId3');
	    agreeCheckbox3.checked = true;
	  }

	  // 체크박스 상태에 따라 아이디 기억하기 여부 저장
	  agreeCheckbox3.addEventListener('change', function() {
	    if (agreeCheckbox3.checked) {
	      localStorage.setItem('rememberId3', idInput3.value);
	    } else {
	      localStorage.removeItem('rememberId3');
	    }
	  });
	});
</script>
</body>

</html>
