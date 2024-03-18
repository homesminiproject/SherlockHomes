<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>셜록HOMES</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/HOMES.png" />
<style>
.content-wrapper{
	width:100%;
	height:100vh;
}
.card {
	height: 8rem;
	width: 2rem;
}

.mb-5 {
	line-height: 3rem;
}

.card-img {
	width: 50%;
	height: 60%;
}

a:hover {
	text-decoration: none;
	color: white;
}
#bigLogo{
	width:20rem;
	height:20rem;
}
#logo{
	display:block;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="content-wrapper">
	<div class="text-center justify-content-center" style="margin-bottom:2rem">
        <a class="brand-logo" href="index.jsp"><img src="images/HOMES.png" id="bigLogo"/></a>
       <a class="brand-logo" href="index.jsp"  style="color: rgba(0, 0, 0, 0.9)">
       <h1 id="logo">셜록HOMES</h1>
       <h4 id="logo">―― 전세사기 없이 청정한 ――</h4>
       </a>
      </div>
      
		<div class="row">
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-danger card-img-holder text-white">
					<div class="card-body">
						<a href="pages/user/userLogin.jsp"> <img
							src="images/user.png" class="card-img-absolute" />
							<h2 class="mb-5">일반회원 로그인</h2>
					</div>
					</a>
				</div>
			</div>
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-info card-img-holder text-white">
					<div class="card-body">
						<a href="pages/company/companyLogin.jsp"> <img
							src="images/company.png" class="card-img-absolute" />
							<h2 class="mb-5">공인중개사 로그인</h2>
					</div>
					</a>
				</div>
			</div>
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-success card-img-holder text-white">
					<div class="card-body">
						<a href="pages/general/adminLogin.jsp"> <img src="images/admin.png"
							class="card-img-absolute" />
							<h2 class="mb-5">관리자 로그인</h2>
					</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>