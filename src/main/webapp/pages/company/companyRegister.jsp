<%@ page language="java" contentType="text/html; charset=utf-8r"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>셜록HOMES</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../../css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../../images/HOMES.png" />
<style>
a:hover {
	text-decoration: none;
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
<script>

//비밀번호 확인

function passwordCheckFunction(){
	//jQuery
	let pw1 =$('#pw1').val();  //value 값 
	let pw2 =$('#pw2').val();  //value 값 
	if(pw1 !== pw2){
			$("#pwText").text("비밀번호가 일치하지 않습니다.")
	}else{
		$('#pwText').text('');
		//$('#pw2').attr('disabled', true); //비활성화(true), 활성화(false)
	}
	
}	


//아이디 중복 체크 
//외부 자바스크립트로 뺄것
function registerFunction(){
let id = $('#id').val();
//$.ajax({경로, 동기화 여부, 성공하면 할 일})
//$.ajax({url:'경로',async:true/false, sussess: function(result){ })



$.ajax({
	type : 'POST',    //전달방식, 경로, 데이터를 넣어 줘야 함
	url : 'UserRegisterCheck.do',
	      //파라미터 : 값
	data : {id:id},
	success:function(result){
		  if(result==1){
			  $('#idText').text('사용할 수 있는 아이디 입니다.');					  
		  }else{
			  $('#idText').text('사용할 수 없는 아이디 입니다.');		
		  }
	}
				
});

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
								<a href="../../index.jsp"><img src="../../images/HOMES.png">
									<h1 id="logoText">셜록HOMES</h1>
									<h4 id="logoText">―― 전세사기 없이 청정한 ――</h4></a> <br>
								<h3>공인중개사 회원가입</h3>
							</div>
							<form class="pt-3">
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="exampleInputUsername1" placeholder="사업자등록번호">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="Username1" placeholder="사업자대표명">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="Username1" placeholder="중개등록번호">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="Username1" placeholder="주소지">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="Username1" placeholder="전화번호">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-lg"
										id="exampleInputEmail1" onkeyup="idCheckFunction()" placeholder="Email">
								</div>
								<div class="form-group">
									<input type="pwd" class="form-control form-control-lg"
										id="exampleInputpw1" placeholder="비밀번호">
								</div>
								<div class="form-group">
            <input type="password" class="form-control" id="pw2" name="pw2" onkeyup="passwordCheckFunction()" placeholder="비밀번호 확인" required>
        	<span id="pwText"></span>
        </div>

								<div class="mb-4">
									<div class="form-check">
										<label class="form-check-label text-muted"> <input
											type="checkbox" class="form-check-input"> 이용약관 및 개인정보
											수집/이용동의
										</label>
									</div>
								</div>
								<div class="mt-3">
									<a
										class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
										href="../../index.jsp">가입하기</a>
								</div>
								<div class="text-center mt-4 font-weight-light">
									계정이 이미 있으신가요? <a href="userLogin.jsp" class="text-primary">로그인</a>
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
</body>

</html>