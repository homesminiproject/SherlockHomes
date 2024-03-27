<%@page import="DTO.ReportDTO"%>
<%@page import="DAO.ReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="java.util.List"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>셜록HOMES</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/SherlockHomes/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/SherlockHomes/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                url: 'getListReport.do7', // 요청 URL
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
<%@ include file="/pages/layout/header.jsp" %>
    
    <!-- 사이드바 -->
<%@ include file="/pages/layout/sidebar.jsp" %>      
      <!-- 메인 -->
          <div class="main-panel">          
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
            <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-alert-box"></i>                 
              </span>
             신고관리
            </h3>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">신고관리</a></li>
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
                        	<form action="getListReport.do7" method="post">
                    <div class="row">
                        <div class="col-12">
                            <div class="row no-gutters">
                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                    <label for="search-type" hidden>검색 유형</label>
                                    <select class="form-control" id="search-type" name="searchCondition">
                                        <option value="TITLE">제목</option>
                                        <option value="STATUS">상태</option>
                                        <option value="R_TYPE">종류</option>
                                    </select>
                                </div>
                                <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                    <label for="search-value" hidden>검색어</label>
                                    <input type="text" placeholder="검색어..." class="form-control" name="searchKeyword">
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
<%
    // 페이지당 공지사항 개수
    int pageSize = 10;

    // 현재 페이지 번호
    int currentPage = 1;

    // 현재 요청된 페이지 번호가 있는지 확인하고, 없으면 1로 설정
    String currentPageStr = request.getParameter("page");
    if (currentPageStr != null && !currentPageStr.isEmpty()) {
        currentPage = Integer.parseInt(currentPageStr);
    }

    // NoticeDAO를 이용하여 공지사항 리스트 가져오기
    ReportDAO reportDAO = new ReportDAO();
    List<ReportDTO> reportList = reportDAO.getReportPage((currentPage - 1) * pageSize, pageSize);

    // 총 공지사항 개수 가져오기
    int totalReports = reportDAO.getTotalRecords();

    // 총 페이지 수 계산
    int totalPages = (int) Math.ceil((double) totalReports / pageSize);

    // 이전 페이지 번호
    int prevPage = currentPage > 1 ? currentPage - 1 : 1;

    // 다음 페이지 번호
    int nextPage = currentPage < totalPages ? currentPage + 1 : totalPages;
%>
    <div class="row-lg-12" id="boardBox">
        <table class="table" id="article-table">
            <thead>
            <tr>
                <th class="hashtag col-1"><a>번호</a></th>
                <th class="title col-3"><a>사유</a></th>
                <th class="user-id"><a>분류</a></th>
                <th class="user-id"><a>신고된 매물</a></th>
                <th class="user-id"><a>신고자</a></th>
                <th class="created-at"><a>신고날짜</a></th>
                <th class="created-at"><a>진행상태</a></th>
                <th class="created-at"><a>누적 신고 수</a></th>
                <th class="created-at col-1"><a>답변 | 삭제</a></th>
            </tr>
            </thead>
            <tbody>
           <% for (ReportDTO report :reportList) { %>
            <tr>
            	<td class="td1"><%=report.getR_no()%></td>
                <td class="td1"><a href="getReport.do7?r_no=<%=report.getR_no() %>"><%=report.getTitle() %></a></td>
                <td class="td1"><%=report.getR_type() %></td>
                <td class="td1"><%=report.getR_name() %></td>
                <td class="td1"><%=report.getWriter() %></td>
                <td class="td1"><%=report.getRegDate() %></td>
                <td class="td1"><%= report.getStatus() %></td>
                <td class="td1"><%=report.getR_count() %></td>
                <td><a href="getReport.do7?r_no=<%= report.getR_no() %>"><i
													class="mdi mdi-pencil menu-icon"></i></a> | <a
												href="deleteReport.do7?r_no=<%= report.getR_no()%>"><i
													class="mdi mdi-delete-empty menu-icon"></i></a></td>
            </tr>
<%} %>
            </tbody>
        </table>
    </div>

    <div class="row" style="margin:1rem auto">
        <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="report.jsp?page=<%= prevPage %>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= i == currentPage ? "active" : "" %>">
                        <a class="page-link" href="report.jsp?page=<%= i %>"><%= i %></a>
                    </li>
                <% } %>
                <li class="page-item">
                    <a class="page-link" href="report.jsp?page=<%= nextPage %>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

              </div>
            </div>
            </div>
         
<%@ include file="/pages/layout/footer.jsp" %>
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