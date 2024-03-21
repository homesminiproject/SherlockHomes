<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>셜록HOMES</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="/SherlockHomes/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
<style>
#profile{
	margin: 3rem auto;
	width:10rem;
	height:10rem;
	}
#leftBox{
	list-style:none;
	margin: 0 auto;
	width:20rem;
}
#leftBox>li{
padding: 0.5rem;
}
</style>
</head>
<body>
	<div class="container-scroller">
		<!-- 상단바 -->
		<%@ include file="/pages/layout/header.jsp"%>

		<!-- 사이드바 -->
		<%@ include file="/pages/layout/sidebar.jsp"%>

		<!-- 본문 -->
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="page-header">
					<h3 class="page-title">
						<span class="page-title-icon bg-gradient-primary text-white mr-2">
							<i class="mdi mdi-contacts"></i>
						</span> 매물 정보수정
					</h3>
				</div>
				
				<div class="row">
				
				<!-- 왼쪽박스 / readonly / 수정불가-->
				<div class="col-4 grid-margin stretch-card" style="height: 650px">
				<div class="card">
				<img src="/SherlockHomes/images/HOMES.png" id="profile">
				<ul id="leftBox">
					<li>등록번호<br><input type="text" class="form-control form-control-lg"
											id="ea_no" placeholder="회원번호 들어올곳" readonly></li>
					<li>주소<input type="text" class="form-control form-control-lg"
											id="ea_no" placeholder="공인중개사 이름?" readonly></li>
					<li>작성자<input type="text" class="form-control form-control-lg"
											id="ea_no" placeholder="사업자번호" readonly></li>
					<li>작성일<input type="text" class="form-control form-control-lg"
											id="ea_no" placeholder="사업자번호" readonly></li>
				</ul>
				</div>
				</div>
				
				<!-- 오른쪽박스 / 수정 가능한 부분-->
					<div class="col-7 grid-margin stretch-card" style="height: 650px">
						<div class="card">
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<th class="hashtag col-2"><a>종류</a></th>
											<td class="hashtag col-3"><input type="email" class="form-control form-control-lg"
											id="exampleInputEmail1" onkeyup="idCheckFunction()"
											placeholder="오피스텔/아파트/다세대"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>가격</a></th>
											<td class="hashtag"><input type="pwd" class="form-control form-control-lg"
											id="exampleInputpw1" placeholder="전세금/월세 등"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>건물 층수 / 해당층수</a></th>
											<td class="hashtag"><input type="pwd" class="form-control form-control-lg"
											id="exampleInputpw1" placeholder="10층 / 2층"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>준공일</a></th>
											<td class="hashtag"><input type="pwd" class="form-control form-control-lg"
											id="exampleInputpw1" placeholder="date"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>면적</a></th>
											<td class="hashtag"><input type="pwd" class="form-control form-control-lg"
											id="exampleInputpw1" placeholder="20㎡"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>방 개수</a></th>
											<td class="hashtag"><input type="pwd" class="form-control form-control-lg"
											id="exampleInputpw1" placeholder="투룸"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>신고 수 / 위험도</a></th>
											<td class="hashtag"><input type="pwd" class="form-control form-control-lg"
											id="exampleInputpw1" placeholder="2 / 주의"></td>
										</tr>
										
									</tbody>
								</table>
							</div>

						<div class="mt-3" style="margin:0.5rem auto">
										<a class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
											href="estateList.jsp" style="width:20rem;">수정하기</a>
									</div>
						</div>
						
					</div>
				</div>

				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<%@ include file="/pages/layout/footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<!-- plugins:js -->
	<script src="../../vendors/js/vendor.bundle.base.js"></script>
	<script src="../../vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="../../js/off-canvas.js"></script>
	<script src="../../js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="../../js/dashboard.js"></script>
	<!-- End custom js for this page-->
</body>

</html>