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
	href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/SherlockHomes/vendor/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="/SherlockHomes/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
<style>
#content{
height:150px;
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
						</span> 문의 답변
					</h3>
				</div>
				
				<div class="row">
				<!-- 문의-->
				<form action="updateQuestion.do6" method="post">
				<input type="hidden" name="q_no" value="${question.getQ_no()}" >
				<div class="col-12 grid-margin stretch-card" style="height: 300px">
				<div class="card">
				<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<td class="title col-4"><input type="text" class="form-control form-control-lg"
											id="title" name="title" value="${question.getTitle()}" readonly></td>
											<td class="writer col-1"><input type="text" class="form-control form-control-lg"
											id="q_sort" name="q_sort" value="${question.getQ_sort()}" readonly></td>
											<td class="writer col-1"><input type="text" class="form-control form-control-lg"
											id="q_writer" name="q_writer" value="${question.getQ_writer()}" readonly></td>
											<td class="date col-2"><input type="text" class="form-control form-control-lg"
											id="regDate" name="regDate" value="${question.getRegDate()}" readonly></td>
										</tr>
										<tr>
											<td colspan="4" class="content col-12"><input type="text" class="form-control form-control-lg"
											id="content" name="content" value="${question.getContent()}" readonly></td>
										</tr>
									</tbody>
								</table>
							</div>
				</div>
				</div>
				
				
				<!-- 답변-->
					<div class="col-12 grid-margin stretch-card" style="height: 300px">
						<div class="card">
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<td class="hashtag col-10"><input type="text" class="form-control form-control-lg"
											id="reply" name="reply" placeholder="내용" style="height:10rem;"></td>
										</tr>
									</tbody>
								</table>
							</div>
						<div class="mt-3" style="margin:0.5rem auto">
										<input type="submit" value="답변 등록하기" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" style="width:20rem; margin:0 auto;"></input>
									</div>
						</div>
						
					</div>
					</form>
					
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
	<script src="/SherlockHomes/vendors/js/vendor.bundle.base.js"></script>
	<script src="/SherlockHomes/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="/SherlockHomes/js/off-canvas.js"></script>
	<script src="/SherlockHomes/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="/SherlockHomes/js/dashboard.js"></script>
	<!-- End custom js for this page-->
</body>

</html>