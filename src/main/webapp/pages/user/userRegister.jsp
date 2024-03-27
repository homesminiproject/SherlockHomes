
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
        .phone-input-group {
        display: flex;
        align-items: center;
    }

    .phone-input {
        flex: 1;
        margin-right: 5px;
    }

    .dash {
        margin: -10px 5px 0;
        position: relative;
        top: -5px; /* Adjust this value as needed */
    }
    
</style>
<script>
    // Function to limit input to numeric characters only
    function restrictToNumeric(input) {
        input.value = input.value.replace(/[^\d]/g, '');
    }

    // Function to automatically move focus to the next input field when maxlength is reached
    function moveFocus(input, nextInput) {
        if (input.value.length >= input.maxLength) {
            nextInput.focus();
        }
    }

    // Add event listeners to the phone number input fields
    document.getElementById('phone1').addEventListener('input', function () {
        restrictToNumeric(this);
        moveFocus(this, document.getElementById('phone2'));
    });

    document.getElementById('phone2').addEventListener('input', function () {
        restrictToNumeric(this);
        moveFocus(this, document.getElementById('phone3'));
    });

    document.getElementById('phone3').addEventListener('input', function () {
        restrictToNumeric(this);
    });
</script>
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
		
function passwordCheckFunction() {
    let pw1 = $('#pw1').val();
    let pw2 = $('#pw2').val();

    // Regular expression to validate password format
    let passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/;

    if (pw1 !== pw2) {
        $("#pwText").text("비밀번호가 일치하지 않습니다.");
    } else if (!passwordRegex.test(pw1)) {
        $("#pwText").text("비밀번호는 8자 이상이며, 영문, 숫자, 특수문자를 모두 포함해야 합니다.");
    } else {
        $('#pwText').text('');
    }
}
	
	//아이디 중복 체크 
	//외부 자바스크립트로 뺄것
function registerFunction() {
    let id = $('#id').val();

    // Email format validation using regular expression
    let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(id)) {
        $('#idText').text('올바른 이메일 형식이 아닙니다.');
        return; // Exit function if email format is incorrect
    }

    $.ajax({
        type: 'POST',
        url: 'RegisterCheckUser.do8',
        data: { id: id },
        success: function(result) {
            if (result == 1) {
                $('#idText').text('사용할 수 있는 아이디 입니다.');
            } else {
                $('#idText').text('사용할 수 없는 아이디 입니다.');
            }
        }
    });
}
	
document.addEventListener("DOMContentLoaded", function() {
    var agreeCheckbox = document.getElementById("agree");
    var submitButton = document.querySelector(".btn-signup");

    // 체크박스 상태 변화 시 이벤트 처리
    agreeCheckbox.addEventListener("change", function() {
        submitButton.disabled = !this.checked; // 체크박스가 체크되어 있지 않으면 버튼을 비활성화
    });

    // 페이지 로드 시 초기 설정
    submitButton.disabled = !agreeCheckbox.checked; // 체크박스의 초기 상태에 따라 버튼을 초기화
});
	
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
                <a href="/SherlockHomes/index.jsp"><img src="/SherlockHomes/images/HOMES.png">
						<h1 id="logoText">셜록HOMES</h1>
                	<h4 id="logoText">―― 전세사기 없이 청정한 ――</h4></a>
<br>
              </div>

    <h2 class="form-title">일반 회원가입</h2>
    <form action="membershipUser.do8" method="post" name="usersMember">
<div class="form-group">
    <div class="input-group">
        <input type="email" class="form-control" id="id" name="id" onkeyup="idCheckFunction()" placeholder="아이디(이메일형식)" required>
        <div class="input-group-append">
            <button type="button" class="btn btn-gradient-primary btn-sm" id="overlapCheck" onclick="registerFunction()">중복체크</button>
        </div>
    </div>
    <span id="idText"></span>
</div>
        <div class="form-group">
            <input type="password" class="form-control" id="pw1" name="pw1" placeholder="비밀번호（８자 이상 영문,숫자,특수문자 포함）" required>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pw2" name="pw2" onkeyup="passwordCheckFunction()" placeholder="비밀번호 확인（８자 이상 특수문자 포함）" required>
        	<span id="pwText"></span>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="name" name="name" placeholder="이름" required>
        </div>

<div class="phone-input-group">
    <input type="tel" class="form-control phone-input" id="phone1" name="phone1" placeholder="010" pattern="[0-9]{3}" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
    <span class="dash">－</span>
    <input type="tel" class="form-control phone-input" id="phone2" name="phone2" pattern="[0-9]{4}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
    <span class="dash">-</span>
    <input type="tel" class="form-control phone-input" id="phone3" name="phone3" pattern="[0-9]{4}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
</div>
<div class="form-group">
    <input type="text" class="form-control" id="birth" name="birth" placeholder="생일 (주민등록번호 앞번호 6자리)" 
           pattern="[0-9]{1,6}" maxlength="6" oninput="this.value = this.value.replace(/[^0-9]/g, '');"
           required>
</div>
        <div class="form-group">
		<select class="form-control" id="region" name="region">
		    <option selected disabled>선호지역</option>
		    <option>강남구</option>
		    <option>강동구</option>
		    <option>강북구</option>
		    <option>강서구</option>
		    <option>관악구</option>
		    <option>광진구</option>
		    <option>구로구</option>
		    <option>금천구</option>
		    <option>노원구</option>
		    <option>도봉구</option>
		    <option>동대문구</option>
		    <option>동작구</option>
		    <option>마포구</option>
		    <option>서대문구</option>
		    <option>서초구</option>
		    <option>성동구</option>
		    <option>성북구</option>
		    <option>송파구</option>
		    <option>양천구</option>
		    <option>영등포구</option>
		    <option>용산구</option>
		    <option>은평구</option>
		    <option>종로구</option>
		    <option>중구</option>
		    <option>중랑구</option>
		</select>
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="agree" >
            <label class="form-check-label text-muted" for="agree" >이용약관 및 개인정보 수집/이용동의</label>
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