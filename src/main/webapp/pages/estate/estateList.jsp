<%@page import="DTO.EstateDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.EstateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>셜록HOMES</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/HOMES.png" />
	<style>
	
	</style>
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
                <i class="mdi mdi-diamond"></i>                 
              </span>
             매물관리
            </h3>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">매물관리</a></li>
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
                <form id="search-form">
                    <div class="row">
                        <div class="col-12">
                            <div class="row no-gutters">
                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                    <label for="search-type" hidden>검색 유형</label>
                                    <select class="form-control" id="search-type" name="searchType">
                                        <option>주소</option>
                                        <option>건물종류</option>
                                    </select>
                                </div>
                                <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                    <label for="search-value" hidden>검색어</label>
                                    <input type="text" placeholder="검색어..." class="form-control" id="search-value"
                                           name="searchValue">
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
    EstateDAO estateDAO = new EstateDAO();
    List<EstateDTO> estateList = estateDAO.getEstatePage((currentPage - 1) * pageSize, pageSize);

    // 총 공지사항 개수 가져오기
    int totalEstates = estateDAO.getTotalRecords();

    // 총 페이지 수 계산
    int totalPages = (int) Math.ceil((double) totalEstates / pageSize);

    // 이전 페이지 번호
    int prevPage = currentPage > 1 ? currentPage - 1 : 1;

    // 다음 페이지 번호
    int nextPage = currentPage < totalPages ? currentPage + 1 : totalPages;
%>

    <div class="row-lg-12" id="boardBox">
        <table class="table" id="article-table">
            <thead>
            <tr>
                <th class="hashtag col-1"><a>등록번호</a></th>
                <th class="title col-2"><a>주소</a></th>
                <th class="title col-1"><a>종류</a></th>
                <th class="title col-1"><a>전/월세</a></th>
                <th class="user-id col-1"><a>가격</a></th>
                <th class="user-id col-2"><a>작성자</a></th>
                <th class="created-at col-2"><a>작성일</a></th>
                <th class="created-at col-1"><a>위험도</a></th>
                <th class="created-at col-1"><a>수정|삭제</a></th>
            </tr>
            </thead>

<!-- 내용 -->    
            <tbody>
            <% for (EstateDTO estate :estateList) { %>
            <tr>
            	<td><%= estate.getE_no() %></td>
                <td><a><%= estate.getRoadaddress() %></a></td>
                <td><%= estate.getE_type() %></td>
                <td><%= estate.getP_type() %></td>
                <td><%= estate.getPrice() %></td>
                <td><%= estate.getEa_name() %></td>
                <td><%= estate.getRegDate() %></td>
                <td><%= estate.getRisk() %></td>
                <td><a href="getEstate.do?e_no=<%= estate.getE_no() %>"><i
													class="mdi mdi-pencil menu-icon"></i></a> | <a
												href="deleteEstate.do?e_no=<%= estate.getE_no() %>"><i
													class="mdi mdi-delete-empty menu-icon"></i></a></td>
            </tr>
            <%} %>
            </tbody>
        </table>
    </div>

    <div class="row" style="margin: 1rem auto;">
        <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="estateList.jsp?page=<%= prevPage %>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= i == currentPage ? "active" : "" %>">
                        <a class="page-link" href="estateList.jsp?page=<%= i %>"><%= i %></a>
                    </li>
                <% } %>
                <li class="page-item">
                    <a class="page-link" href="estateList.jsp?page=<%= nextPage %>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

              </div>
            </div>
            </div>
         
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
<%@ include file="/pages/layout/footer.jsp" %>
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