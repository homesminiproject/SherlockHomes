<%@page import="DAO.AgentDAO"%>
<%@page import="DTO.AgentDTO"%>
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
						</span> 공인중개사 조회
					</h3>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">공인중개사</a></li>
							<li class="breadcrumb-item active" aria-current="page">조회</li>
						</ol>
					</nav>
				</div>
				<div class="row">
					<div class="col-12 grid-margin stretch-card" style="height: 700px">
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
																<option>공인중개사명</option>
																<option>상태</option>
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
											<th class="title col-2"><a>공인중개사명</a></th>
											<th class="title col-2"><a>주소</a></th>
											<th class="created-at col-1"><a>가입일</a></th>
											<th class="created-at col-1"><a>신고수</a></th>
											<th class="created-at col-1"><a>상태</a></th>
											<th class="created-at col-1"><a>수정|삭제</a></th>
										</tr>
									</thead>


  							<c:forEach begin="${startAgentIndex}" end="${endAgentIndex}" items="${agentList}" var="agent" varStatus="status">
									<!-- 내용 -->
									<tbody>
										<tr>
											<td class="hashtag">${agent.getEa_no()}</td>
											<td class="title"><a>${agent.getRep_name()}</a></td>
											<td class="user-id">${agent.getJibunaddress()}</td>
											<td class="created-at">${agent.getRegdate()}</td>
											<td class="user-id">${agent.getReport()}</td>
											<td class="created-at">${agent.getStatus()}</td>
											<td class="created-at">
               								<a href="getAgent.do2?ea_no=${agent.getEa_no()}"><i class="mdi mdi-pencil menu-icon"></i></a>
                 | 
  											<a href="deleteAgent.do2?ea_no=${agent.getEa_no()}"><i class="mdi mdi-delete-empty menu-icon"></i></a>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
<%-- 다음 페이지 버튼 --%>
<div style="text-align: center; margin-top: 10px;">
    <c:if test="${hasPreviousPage}">
        <a  href="listAgent.do2?page=${currentPage - 1}" style="font-size: 14px;">이전</a>
    </c:if>
<c:forEach begin="0" end="${total/10}" var="i"> 
    <a href="listAgent.do2?page=${i+1}" style="font-size: 14px; margin-left: 10px;">${i+1}</a>
</c:forEach>
    <c:if test="${hasNextPage}">
        <a href="listAgent.do2?page=${currentPage + 1}" style="font-size: 14px; margin-left: 10px;">다음</a>
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