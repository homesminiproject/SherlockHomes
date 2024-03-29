<%@page import="java.util.List"%>
<%@page import="DTO.AgentDTO"%>
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
<link rel="stylesheet" href="/SherlockHomes/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="/SherlockHomes/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
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
										<form action="SearchAgent.do2" method="post">
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
<%
//현재 페이지 번호
int currentPage = request.getAttribute("currentPage") != null ? (int) request.getAttribute("currentPage") : 1;

// UsersDAO를 이용하여 공지사항 리스트 가져오기
List<AgentDTO> agentList = (List<AgentDTO>) request.getAttribute("agentList");

// 총 페이지 수 계산
int totalPages = request.getAttribute("totalPages") != null ? (int) request.getAttribute("totalPages") : 1;

// 이전 페이지 번호
int prevPage = request.getAttribute("prevPage") != null ? (int) request.getAttribute("prevPage") : 1;

// 다음 페이지 번호
int nextPage = request.getAttribute("nextPage") != null ? (int) request.getAttribute("nextPage") : 1;
%>
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

									<!-- 내용 -->
									<tbody>
									<% for (AgentDTO agent :agentList) { %>
										<tr>
											<td><%= agent.getEa_no()%></td>
											<td><a href="getAgent.do2?ea_no=<%= agent.getEa_no()%>"><%= agent.getRep_name()%></a></td>
											<td><%= agent.getJibunaddress()%></td>
											<td><%= agent.getRegdate()%></td>
											<td><%= agent.getReport()%></td>
											<td><%= agent.getStatus()%></td>
											<td><a href="getAgent.do2?ea_no=<%= agent.getEa_no()%>"><i class="mdi mdi-pencil menu-icon"></i></a> | 
											<a href="deleteAgent.do2?ea_no=<%= agent.getEa_no()%>"><i class="mdi mdi-delete-empty menu-icon"></i></a>
											</td>
										</tr>
										<%} %>
									</tbody>
								</table>
							</div>

							<div class="row" style="margin:0 auto;">
        <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="listAgent.do2?page=<%= prevPage %>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= i == currentPage ? "active" : "" %>">
                        <a class="page-link" href="listAgent.do2?page=<%= i %>"><%= i %></a>
                    </li>
                <% } %>
                <li class="page-item">
                    <a class="page-link" href="listAgent.do2?page=<%= nextPage %>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

						</div>
					</div>
				</div>

				<%@ include file="/pages/layout/footer.jsp"%>
			</div>
		</div>
	</div>

	<script src="/SherlockHomes/vendors/js/vendor.bundle.base.js"></script>
	<script src="/SherlockHomes/vendors/js/vendor.bundle.addons.js"></script>
	<script src="/SherlockHomes/js/off-canvas.js"></script>
	<script src="/SherlockHomes/js/misc.js"></script>
	<script src="/SherlockHomes/js/dashboard.js"></script>
</body>

</html>