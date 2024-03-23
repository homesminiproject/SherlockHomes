<%@page import="DAO.NoticeDAO"%>
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
<link rel="stylesheet"
	href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/SherlockHomes/css/style.css">
<link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
<style>

#content{
height:400px;
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
						</span> 공지사항 등록
					</h3>
				</div>
				<% NoticeDAO noticeDAO = new NoticeDAO(); %>
				<div class="row">
				<!-- 오른쪽박스 / 수정 가능한 부분-->
					<div class="col-12 grid-margin stretch-card" style="height: 650px">
						<div class="card">
						
						<form action="insertNotice.do" method="post" >
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<td class="form-group col-10"><input type="text" class="form-control form-control-lg"
											id="title" placeholder="공지사항제목"></td>
										</tr>
										<tr>
											<td class="form-group col-10"><input type="text" class="form-control form-control-lg"
											id="content" placeholder="내용"></td>
										</tr>
									</tbody>
								</table>
							</div>

						<div class="mt-3" style="margin:0.5rem auto">
						<input type="submit" value="등록하기" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" style="width:20rem; margin:0 auto;"></input>
									</div>
									</form>
						</div>
						
					</div>
				</div>

				<%@ include file="/pages/layout/footer.jsp"%>
			</div>
		</div>
	</div>

	<script src="../../vendors/js/vendor.bundle.base.js"></script>
	<script src="../../vendors/js/vendor.bundle.addons.js"></script>
	<script src="../../js/off-canvas.js"></script>
	<script src="../../js/misc.js"></script>
	<script src="../../js/dashboard.js"></script>
</body>

</html>