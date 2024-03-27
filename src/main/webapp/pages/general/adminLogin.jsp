<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>셜록HOMES</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/SherlockHomes/vendors/css/vendor.bundle.base.css">
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
                 <a href="/SherlockHomes/index.jsp"><img src="/SherlockHomes/images/HOMES.png"> <!-- 로고변경 -->
                <h1 id="logoText">셜록HOMES</h1>
                <h4 id="logoText">―― 전세사기 없이 청정한 ――</h4>
                </a>
              </div>
              <h3 class="text-center">관리자 로그인</h3>
              <form action="loginAdmin.do1" method="post" class="pt-3" >
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="adminid" name="adminid" placeholder="아이디를 입력해주세요" required>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" required>
                </div>
                <div class="mt-3">
                  <input type="submit" value="로그인" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" ></input>
                </div>
                
                <div class="my-2 d-flex justify-content-between align-items-center">
        <div class="form-group form-check" style="padding-left: 40px;">
            <input type="checkbox" class="form-check-input" id="agree" >
            <label class="form-check-label text-muted" for="agree" >아이디 기억하기</label>
    </div>
                </div>
                
                <div class="text-center mt-4 font-weight-light">
                  사용자로 이용하시겠습니까? <a href="/SherlockHomes/index.jsp" class="text-primary">사용자 로그인하기</a>
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
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <script src="vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/misc.js"></script>
  <!-- endinject -->

<script>
document.addEventListener('DOMContentLoaded', function() {
  var agreeCheckbox = document.getElementById('agree');
  var idInput = document.getElementById('adminid');
  
  // 페이지가 로드되었을 때 저장된 아이디가 있으면 아이디 입력칸에 입력
  if (localStorage.getItem('rememberId')) {
    idInput.value = localStorage.getItem('rememberId');
    agreeCheckbox.checked = true;
  }
  
  // 체크박스 상태에 따라 아이디 기억하기 여부 저장
  agreeCheckbox.addEventListener('change', function() {
    if (agreeCheckbox.checked) {
      localStorage.setItem('rememberId', idInput.value);
    } else {
      localStorage.removeItem('rememberId');
    }
  });
});
</script>

</body>

</html>
