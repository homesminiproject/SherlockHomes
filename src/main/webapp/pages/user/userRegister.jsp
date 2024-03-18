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
  <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/HOMES.png" />

	<style>
	.logoText{
font-family: "BlackHanSans-Regular";
 	text-align:center;
	}
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }
    .container {
        max-width: 500px;
        margin: 100px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .form-title {
        text-align: center;
        margin-bottom: 30px;
    }
    .form-control {
        border-radius: 20px;
        margin-bottom: 20px;
    }
    .btn-signup {
        border-radius: 20px;
    }
    .text-muted {
        font-size: 0.9rem;
    }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function(){
		
	
	function passwordCheckFunction() {
		//자바스크립트
		let password1 = document.querySelector("#pw1").value;
		let password2 = document.querySelector("#pw2").value;
		if(password1 !== password2) {
			let span = document.querySelector("#pwText");
			span.textContent = "비밀번호가 일치하지 않습니다."
		} else {
			
		}
		
		
		//jQuery
		// let password1 = $('#password1').val(); // value 값
		// let password2 = $('#password2').val(); // value 값
		// if(password1 !== password2) {
			$('pwText').text("비밀번호가 일치하지 않습니다.")
		} else {
			$('pwText').text('');
			$('pw2').attr('disabled', true); //비활설화(true)
		}
	
	
	}

</script>
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left p-5">
              <div class="brand-logo text-center">
                <a href="../../index.jsp"><img src="../../images/HOMES.png"></a>
						<h1 class="logoText">셜록HOMES</h1>
						<h4 class="logoText">―― 전세사기 없이 청정한 ――</h4>
						<br>
              </div>

    <h2 class="form-title">일반 회원가입</h2>
    <form action="membership.do" method="post" name="usersMember">
        <div class="form-group">
            <input type="email" class="form-control" id="id" name="id" onkeyup="idCheckFunction()" placeholder="아이디(이메일형식)" required>
             <button type="button" class="btn" id="overlapCheck" onclick="registerFunction()">중복체크</button><br>
                            <span id="idText"></span>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pw1" name="pw1" placeholder="비밀번호" required>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pw2" name="pw2" onkeyup="passwordCheckFunction()" placeholder="비밀번호 확인" required>
        	<span id="pwText"></span>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="name" name="name" placeholder="이름" required>
        </div>
        <div class="form-group">
            <input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호 (- 제외)" required>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="birth" name="birth" placeholder="생일 (주민등록번호 앞번호 6자리)" required>
        </div>
        <div class="form-group">
            <select class="form-control" id="region" name="region">
                <option selected disabled>선호지역</option>
                <option>강북구</option>
                <option>강남구</option>
                <option>강서구</option>
                <option>강동구</option>
                <option>성동구</option>
            </select>
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="agree">
            <label class="form-check-label text-muted" for="agree">이용약관 및 개인정보 수집/이용동의</label>

        <button type="submit" class="btn btn-primary btn-block btn-signup">가입하기</button>
    </form>
    <div class="text-center mt-3">
        계정이 이미 있으신가요? <a href="userLogin.jsp" class="text-primary">로그인</a>
    </div>
</div>
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
</body>

</html>