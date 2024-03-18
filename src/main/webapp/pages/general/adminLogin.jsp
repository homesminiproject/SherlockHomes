<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
  <link rel="stylesheet" href="../../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/HOMES.png"/>

	<style>
	.brand-logo>h1{
font-family: "BlackHanSans-Regular";
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
                 <a href="../../index.jsp"><img src="../../images/HOMES.png"></a> <!-- 로고변경 -->
                <h1>셜록HOMES</h1>
              </div>
              <h3 class="text-center">관리자 로그인</h3>
              <form action="login.do" method="post" class="pt-3" >
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="id" name="id" placeholder="아이디를 입력해주세요" required>
                </div>
                <div class="form-group">
                  <input type="pw" class="form-control form-control-lg" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" required>
                </div>
                <div class="mt-3">
                  <input type="submit" value="로그인" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" ></input>
                </div>
                
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      아이디 기억하기
                    </label>
                  </div>
                </div>
                
                <div class="text-center mt-4 font-weight-light">
                  사용자로 이용하시겠습니까? <a href="../../index.jsp" class="text-primary">사용자 로그인하기</a>
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
</body>

</html>
