<%@page import="DTO.NoticeDTO"%>
<%@page import="DAO.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
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
<style>
#writeBtn {
	margin: 1rem auto;
	color: white;
}
</style>


<!-- jQuery CDN을 사용하기 위한 스크립트 태그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- AJAX를 이용한 검색 기능 -->
<script>
    $(document).ready(function() {
        // 폼이 제출될 때 실행되는 함수
        $('form').submit(function(event) {
            // 기본 제출 행동 방지
            event.preventDefault();
            
            // 검색 조건과 검색어 가져오기
            var searchCondition = $('#searchCondition').val();
            var searchKeyword = $('#searchKeyword').val();
            
            // AJAX 요청
            $.ajax({
                type: 'POST', // 요청 방식
                url: 'getListNotice.do5', // 요청 URL
                data: { // 전송할 데이터
                    searchCondition: searchCondition,
                    searchKeyword: searchKeyword
                },
                success: function(response) { // 요청 성공 시 실행되는 함수
                    // 응답 내용을 삽입할 위치 선택
                    $('#boardBox').html(response);
                },
                error: function(xhr, status, error) { // 요청 실패 시 실행되는 함수
                    console.error(xhr.responseText); // 콘솔에 오류 로그 출력
                    // 사용자에게 오류 메시지를 보여줄 수도 있음
                    alert('검색에 실패했습니다. 다시 시도해주세요.');
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
		<!-- 메인 -->
		<div class="main-panel">
			<div class="content-wrapper">

				<div class="page-header">
					<h3 class="page-title">
						<span class="page-title-icon bg-gradient-primary text-white mr-2">
							<i class="mdi mdi-bulletin-board"></i>
						</span> 공지사항
					</h3>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">공지사항</a></li>
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
							                <form action="SearchEstate.do4" method="post" >
							                    <div class="row">
							                        <div class="col-12">
							                            <div class="row no-gutters">
							                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
							                                    <label for="search-type" hidden>검색 유형</label>
							                                    <select class="form-control" id="searchCondition" name="searchCondition">
							                                        <option>제목</option>
							                                        <option>내용</option>
							                                    </select>
							                                </div>
							                                <div class="col-lg-8 col-md-6 col-sm-12 p-0">
							                                    <label for="search-value" hidden>검색어</label>
							                                    <input type="text" placeholder="검색어..." class="form-control" id="searchKeyword"
							                                           name="searchKeyword">
							                                </div>
							                                <div class="col-lg-1 col-md-3 col-sm-12 p-0">
							                                    <button type="submit" class="btn btn-base">
							                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
							                                             stroke-linecap="round" stroke-linejoin="round"
							                                             class="feather feather-search">
							                                            <circle cx="11" cy="11" r="8"></circle>
							                                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
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
											<th class="hashtag col-1"><a>번호</a></th>
											<th class="title col-4"><a>제목</a></th>
											<th class="created-at col-1"><a>작성일</a></th>
											<th class="created-at col-1"><a>수정|삭제</a></th>
										</tr>
									</thead>
									<tbody>
  <% 
            NoticeDAO noticeDAO = new NoticeDAO();
            List<NoticeDTO> noticeList = noticeDAO.getNoticeAll(null);
            int count = 0; // 표시된 공지사항 개수를 세기 위한 변수
            for (NoticeDTO notice : noticeList) {
                if (count < 9) { // 10개만 출력되도록 제한
            %>
										<tr>
											<td><%= notice.getN_no() %></td>
											<td><a href="getNotice.do5?n_no=<%= notice.getN_no() %>"><%= notice.getTitle() %></a></td>
											<td><%= notice.getRegDate()%></td>
											<td><a href="getNotice.do5?n_no=<%= notice.getN_no() %>"><i
													class="mdi mdi-pencil menu-icon"></i></a> | <a
												href="deleteNotice.do5?n_no=<%= notice.getN_no() %>"><i
													class="mdi mdi-delete-empty menu-icon"></i></a></td>
										</tr>
            <% 
                    count++; // 출력된 공지사항 개수 증가
                } else {
                    break; // 10개가 출력되면 반복문 종료
                }
            } 
            %>
									</tbody>
								</table>
							</div>

							<div class="row" style="margin: 1rem auto;">
								<nav id="pagination" aria-label="Page navigation">
									<ul class="pagination justify-content-center">
										<li class="page-item"><a class="page-link" href="#">Previous</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">Next</a></li>
									</ul>
									<div class="d-grid gap-2 d-md-flex justify-content-md-end">
										<input type="button" value="글쓰기"
											class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
											style="width: 20rem; margin: 0 auto;"
											onclick="location.href='noticeInsert.jsp'">
									</div>
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