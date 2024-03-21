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
  <link rel="stylesheet" href="/SherlockHomes/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/SherlockHomes/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />

	<style>
	a:hover {
	text-decoration: none;
	}
    body {
        background-color: #f8f9fa;
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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

		document.addEventListener('DOMContentLoaded', function() {
			
			//#. 우편번호 검색
			const zipbtn = document.querySelector("#zipbtn");
			
			//버튼이 눌려 졌을 때만 동작
			zipbtn.addEventListener('click', function() {    //() =>{} 
					
					new daum.Postcode({
						oncomplete : function(data) {
//					      // 폼명.우편번호코드입력할_input_태그의_이름.값 = 넘어온 데이터의 zonecode 값 넘겨 주기
							document.userMember.zipcode.value = data.zonecode;
							//주소 전체를 받기 위한 변수
							let fullAddress ='';
							//추가 주소, 건물명/동명을 받을 변수
							let extendAddress='';
							
							//기본주소 (R-도로명, J-지번)
							if(data.userSelectedType === 'R'){
								fullAddress = data.roadAddress;
							}else{
								fullAddress = data.jibunAddress;
							}
							// 확인용 - 제대로 지번과 도로명이 찍히는지 확인
							//document.userMember.address1.value = fullAddress;
							
							
							//추가 주소 - 법정동/법정리 이름,  건물명   
							//빌딩명과 법정동/법정리가 있을 수도 있고 없을 수도 있음
							if(data.userSelectedType === 'R'){
								if(data.bname !== ''){ //법정동/법정리가 있으면
									extendAddress += data.bname;
								}
								
								if(data.buildingName !== ''){ //건물명이 있으면
									extendAddress += (extendAddress !=='' ? ', ' + data.buildingName : data.buildingName);
									
								}
							
								//기본주소 (추가 주소) 
								fullAddress +=(extendAddress !=='' ? '(' + extendAddress + ')' : '');
							}
						  
							//폼에 찍기-확인
							document.userMember.address1.value = fullAddress;
							document.userMember.address2.focus();			
							
						}
					}).open();
			});//zipbtn이 클릭되었을 때 동작의 끝

		});
		
		
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
                	<h4 id="logoText">―― 전세사기 없이 청정한 ――</h4></a>
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
    </div>
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
  <script src="/SherlockHomes/vendors/js/vendor.bundle.base.js"></script>
  <script src="/SherlockHomes/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/SherlockHomes/js/off-canvas.js"></script>
  <script src="/SherlockHomes/js/misc.js"></script>
  <!-- endinject -->
</body>

</html>