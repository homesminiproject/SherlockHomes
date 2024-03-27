<%@page import="DAO.UsersDAO"%>
<%@page import="DTO.UsersDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    // 삭제 링크를 클릭했을 때 실행되는 함수
    $('.delete-user').click(function(event) {
        // 기본 동작 방지
        event.preventDefault();

        // 삭제할 사용자의 번호 가져오기
        var userNo = $(this).data('no');

        // AJAX 요청
        $.ajax({
            type: 'GET', // 요청 방식
            url: 'deleteUsers.do8', // 요청 URL
            data: { no: userNo }, // 전송할 데이터
            success: function(response) { // 요청 성공 시 실행되는 함수
                // 성공 메시지를 사용자에게 표시하거나, 성공 후의 동작 수행
                console.log('사용자 삭제 완료');
                alert('사용자 삭제 완료.');
                // 페이지 새로고침
                location.reload();
            },
            error: function(xhr, status, error) { // 요청 실패 시 실행되는 함수
                console.error(xhr.responseText); // 콘솔에 오류 로그 출력
                // 사용자에게 오류 메시지를 보여줄 수도 있음
                alert('사용자 삭제에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });
});
</script>
</head>
<body>
	<div class="container-scroller" style=" background-color: #C8B4D3">
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
						</span> 사용자 조회
					</h3>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">사용자</a></li>
							<li class="breadcrumb-item active" aria-current="page">조회</li>
						</ol>
					</nav>
				</div>
				<div class="row">
					<div class="col-12 grid-margin stretch-card" style="height: 700px;">
					
			<div class="card">
							<div class="row" style="padding-left: 20px">
								<div class="card card-margin search-form">
									<div class="card-body p-0">
										<form action="SearchAgent.do2" method="post"  >
											<div class="row">
												<div class="col-12">
													<div class="row no-gutters">
														<div class="col-lg-3 col-md-3 col-sm-12 p-0">
															<label for="search-type" hidden>검색 유형</label> <select
																class="form-control" id="searchCondition" name="searchCondition">
																<option>아이디</option>
																<option>이름</option>
															</select>
														</div>
														<div class="col-lg-8 col-md-6 col-sm-12 p-0">
															<label for="search-value" hidden>검색어</label> <input
																type="text" placeholder="검색어..." class="form-control"
																id="searchKeyword" name="searchKeyword">
														</div>
														<div class="col-lg-1 col-md-3 col-sm-12 p-0">
															<button type="submit" class="btn btn-base">
																<svg xmlns="http://www.w3.org/2000/svg" width="24"
																	height="24" viewBox="0 0 24 24" fill="none"
																	stroke="currentColor" stroke-width="2"
																	stroke-linecap="round" stroke-linejoin="round"
																	class="feather feather-search">
                                            <circle cx="11" cy="11"
																		r="8"></circle>
                                            <line x1="21" y1="21"
																		x2="16.65" y2="16.65"></line>
                                        </svg>
															</button>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
<div class="row-lg-12" id="boardBox">
    <table class="table" id="article-table">
        <thead>
            <tr>
                <th class="hashtag col-1"><a>회원번호</a></th>
                <th class="title col-1"><a>아이디</a></th>
                <th class="title col-1"><a>이름</a></th>
                <th class="title col-2"><a>선호지역</a></th>
                <th class="created-at col-1"><a>가입일</a></th>
                <th class="created-at col-1"><a>생년월일</a></th>
                <th class="created-at col-1"><a>권한</a></th>
                <th class="created-at col-1"><a>수정|삭제</a></th>
            </tr>
        </thead>

        <!-- 내용 -->
        <tbody>

         <c:forEach begin="${startUserIndex}" end="${endUserIndex}" items="${usersList}" var="users" varStatus="status">
                <tr>
                    <td class="hashtag">${users.getNo()}</td>
                    <td class="title">${users.getId()}</td>
                    <td class="user-id">${users.getName()}</td>
                    <td class="title">${users.getRegion()}</td>
                    <td class="td1">${users.getRegdate()}</td>
                    <td class="created-at">${users.getBirth()}</td>
                    <td class="created-at">${users.getRole()}</td>
                    <td class="created-at">
                        <a href="getUser.do8?no=${users.getNo()}"><i class="mdi mdi-pencil menu-icon"></i></a>
                         | 
                       <a href="#" class="delete-user" data-no="${users.getNo()}"><i class="mdi mdi-delete-empty menu-icon"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%-- 다음 페이지 버튼 --%>
<div style="text-align: center; margin-top: 10px;">
    <c:if test="${hasPreviousPage}">
        <a  href="listUser.do8?page=${currentPage - 1}" style="font-size: 14px;">이전</a>
    </c:if>
<c:forEach begin="0" end="${total/10}" var="i"> 
    <a href="listUser.do8?page=${i+1}" style="font-size: 14px; margin-left: 10px;">${i+1}</a>
</c:forEach>
    <c:if test="${hasNextPage}">
        <a href="listUser.do8?page=${currentPage + 1}" style="font-size: 14px; margin-left: 10px;">다음</a>
    </c:if>
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