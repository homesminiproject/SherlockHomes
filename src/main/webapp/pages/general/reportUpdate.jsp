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
#content{
white-space:normal;
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
						</span> 신고 관리
					</h3>
				</div>
				
				<div class="row">
				<!-- 신고-->
				<div class="col-12 grid-margin stretch-card" style="height: 400px">
				<div class="card">
				<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<td class="title col-3"><input type="email" class="form-control form-control-lg"
											id="exampleInputEmail1" readonly
											placeholder="사유"></td>
											<td class="writer col-2"><input type="email" class="form-control form-control-lg"
											id="exampleInputEmail1" readonly
											placeholder="신고자"></td>
											<td class="date col-2"><input type="email" class="form-control form-control-lg"
											id="exampleInputEmail1" readonly
											placeholder="신고일"></td>
										</tr>
										<tr>
											<td class="title col-3"><input type="email" class="form-control form-control-lg"
											id="exampleInputEmail1" readonly
											placeholder="분류"></td>
											<td class="writer col-2"><input type="email" class="form-control form-control-lg"
											id="exampleInputEmail1" readonly
											placeholder="신고된 유저 / 매물"></td>
											<td class="date col-2"><input type="email" class="form-control form-control-lg"
											id="exampleInputEmail1" readonly
											placeholder="누적신고수"></td>
										</tr>
										<tr>
											<td colspan=3 class="title col-12"><input type="text" class="form-control form-control-lg"
											id="content" style="height:100px" readonly
											placeholder="내용"></td>
										</tr>
									</tbody>
								</table>
								<div class="mt-3 text-center" style="margin:0.5rem auto">
								<ul style="list-style:none; display:flex; justify-content:center;">
										<li><input type="submit" value="신고 처리하기" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" style="width:15rem; margin:0 0.5rem;"></input></li>
										<li><input type="submit" value="신고 삭제하기" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" style="width:15rem; margin:0 0.5rem;"></input></li>
									</ul>
									</div>
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