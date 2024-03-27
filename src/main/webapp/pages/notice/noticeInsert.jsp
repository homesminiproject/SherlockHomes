<%@page import="DAO.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>셜록HOMES</title>
<link rel="stylesheet"
	href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/SherlockHomes/vendor/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/SherlockHomes/css/style.css">
<link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
<style>
#content {
	height: 400px;
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
				<div class="row">
					<div class="col-12 grid-margin stretch-card" style="height: 650px">
							<div class="card">
								<div class="row-lg-12" id="boardBox">
						<form action="insertNotice.do5" method="post">
									<table class="table" id="article-table"
										style="margin-top: 2rem;">
										<tbody>
											<tr>
												<td class="form-group col-10"><input type="text"
													class="form-control form-control-lg" id="title"
													name="title" placeholder="제목"></td>
											</tr>
											<tr>
												<td class="form-group col-10"><textarea
													class="form-control form-control-lg" id="content"
													name="content" placeholder="내용"></textarea></td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="mt-3" style="margin: 0.5rem auto">
									<input type="submit" value="등록하기"
										class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
										style="width: 20rem; margin: 0 auto;">
								</div>
						</form>
					</div>

				</div>
			</div>
</div>
			<%@ include file="/pages/layout/footer.jsp"%>
		</div>
		
		<script src="/SherlockHomes/vendors/js/vendor.bundle.base.js"></script>
		<script src="/SherlockHomes/vendors/js/vendor.bundle.addons.js"></script>
		<script src="/SherlockHomes/js/off-canvas.js"></script>
		<script src="/SherlockHomes/js/misc.js"></script>
		<script src="/SherlockHomes/js/dashboard.js"></script>
</body>
<script>
    // textarea 요소에 이벤트 리스너 추가
    document.getElementById('content').addEventListener('keydown', function(event) {
        // 엔터 키의 keyCode는 13입니다.
        if (event.keyCode === 13 && event.shiftKey === false) { 
            // 엔터 키를 누르고 Shift 키를 동시에 누르지 않았을 때만 기본 동작 막기
            event.preventDefault(); // 기본 동작 막기
        }
    });
</script>
</html>