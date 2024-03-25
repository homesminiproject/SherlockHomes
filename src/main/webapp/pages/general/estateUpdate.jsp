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

<form action="updateEstate.do" method="post">
						<input type="hidden" name="e_no" value="${estate.getE_no()}" >				
				<div class="row">
				<!-- 왼쪽위박스 / photo -->
				<div class="col-4 grid-margin stretch-card" style="height: 250px">
				<div class="card">
				<img src="/SherlockHomes/images/HOMES.png" id="profile">
				</div>
				</div>
				
				<!-- 오른쪽위박스 / content -->
					<div class="col-7 grid-margin stretch-card" style="height: 250px">
						<div class="card">
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="content" name="content" value="${estate.getContent()}" readonly style="height:10rem"></td>
										</tr>
									</tbody>
								</table>
							</div>
							</div>
							</div>
							</div>
							
				<div class="row">
				<!-- 왼쪽아래박스 / 수정 가능한 부분 -->			
				<div class="col-4 grid-margin stretch-card" style="height:380px;">
				<div class="card" >
				<div class="row-lg-12" id="boardBox">
				<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<th class="hashtag col-1">매물종류</th>
											<td class="hashtag col-4"><input type="text" class="form-control form-control-lg"
											id="p_type" name="p_type"	value="${estate.getP_type() }"></td>
										</tr>
										<tr>
											<th class="hashtag col-1">가격</th>
											<td class="hashtag col-4"><input type="text" class="form-control form-control-lg"
											id="price"	 name="price" value="${estate.getPrice() }"></td>
										</tr>
										<tr>
											<th class="hashtag col-1">면적</th>
											<td class="hashtag col-4"><input type="text" class="form-control form-control-lg"
											id="area" name="area" value="${estate.getArea() }"></td>
										</tr>
										<tr>
											<th class="hashtag col-1">위험도</th>
											<td class="hashtag col-4"><input type="text" class="form-control form-control-lg"
											id="risk"	name="risk" value="${estate.getRisk() }"></td>
										</tr>
										<tr>
										<td colspan=3><input type="submit" value="수정하기" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" style="width:20rem; margin:0 auto;"></input></td>
										</tr>
										</tbody>
										</table>
										</div>
				</div>
				</div>
				
				<!-- 오른쪽아래박스 / 수정 불가능 부분-->
					<div class="col-7 grid-margin stretch-card" style="height: 380px">
						<div class="card">
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<th class="hashtag col-1">우편번호</th>
											<td class="hashtag col-2"><input type="text" class="form-control form-control-lg"
											id="postcode" readonly 	value="${estate.getPostcode() }"></td>
											<th class="hashtag col-2">주소</th>
											<td class="hashtag col-4"><input type="text" class="form-control form-control-lg"
											id="address" readonly 	value="${estate.getRoadaddress() } 	${estate.getDetailaddress() }"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>매물 분류</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="e_type"  readonly 	value="${estate.getE_type() }"></td>
											<th class="hashtag col-2"><a>공인중개사</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="ea_name"  readonly 	value="${estate.getEa_name() }"></td>

										</tr>
										<tr>
											<th class="hashtag col-2"><a>방 개수</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="room"  readonly 	value="${estate.getRoom() }개"></td>
											<th class="hashtag col-2"><a>작성일</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="regDate"  readonly 	value="${estate.getRegDate() }"></td>

										</tr>
										<tr>
											<th class="hashtag col-2"><a>건물 층수 / 매물 층수</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="floor" readonly 	value="${estate.getMax_floor() } / ${estate.getE_floor() }"></td>
											<th class="hashtag col-2"><a>준공일</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="e_date" readonly 	value="${estate.getE_date() }"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					</div>
					</form>
					

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