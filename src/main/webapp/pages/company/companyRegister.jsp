
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
    function restrictToNumeric(input) {
        input.value = input.value.replace(/[^\d]/g, '');
    }

    function moveFocus(input, nextInput) {
        if (input.value.length >= input.maxLength) {
            nextInput.focus();
        }
    }


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
        url: 'RegisterCheckAgent.do2',
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

    <h2 class="form-title">공인중개사 회원가입</h2>
<form action="agentmembershipUser.do8" method="post" name="usersMember">
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
        <input type="text" class="form-control" id="rep_name" name="rep_name" placeholder="대표자명" required>
    </div>
    <div class="form-group row">
        <div class="col-sm-5">
            <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" readonly>
        </div>
        <div class="col-sm-7">
            <button type="button" class="btn btn-gradient-primary btn-sm" onclick="execDaumPostcode()">우편번호 찾기</button>
        </div>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="roadaddress" name="roadaddress" placeholder="도로명주소" readonly>
        <input type="hidden" id="jibunaddress" name="jibunaddress" placeholder="지번주소" size="40">
        <span id="guide" style="color:#999;display:none"></span>
        <input type="text" class="form-control" id="detailaddress" name="detailaddress" placeholder="상세주소">
    </div>
    <div class="phone-input-group">
        <input type="tel" class="form-control phone-input" id="phone1" name="phone1" pattern="[0-9]{3}" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
        <span class="dash">－</span>
        <input type="tel" class="form-control phone-input" id="phone2" name="phone2" pattern="[0-9]{4}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
        <span class="dash">-</span>
        <input type="tel" class="form-control phone-input" id="phone3" name="phone3" pattern="[0-9]{4}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="agency_name" name="agency_name" placeholder="상호명" required>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="license_number" name="license_number" placeholder="공인중개사등록번호(-제외)" pattern="[0-9]{14}" maxlength="14" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="regi_number" name="regi_number" placeholder="사업자등록번호(-제외)"  pattern="[0-9]{14}" maxlength="14" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
    </div>
    <div class="form-group form-check">
        <input type="checkbox" class="form-check-input" id="agree2" onchange="toggleSubmitButton()">
        <label class="form-check-label text-muted" for="agree2">이용약관 및 개인정보 수집/이용동의</label>
    </div>
    <button type="submit" class="btn btn-primary btn-block btn-signup" id="submitBtn" disabled>가입하기</button>
</form>


    <div class="text-center mt-3">
        계정이 이미 있으신가요? <a href="companyLogin.jsp" class="text-primary">로그인</a>
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
  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.


                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var jibunAddress = data.jibunAddress;
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
    

    function toggleSubmitButton() {
        var agreeCheckbox = document.getElementById("agree2");
        var submitButton = document.getElementById("submitBtn");
        submitButton.disabled = !agreeCheckbox.checked;
    }
</script>
  <!-- endinject -->
</body>

</html>