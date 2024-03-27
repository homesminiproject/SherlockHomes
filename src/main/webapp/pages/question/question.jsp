<%@page import="DTO.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.QuestionDAO"%>
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
  <link rel="stylesheet" href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
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
<%@ include file="/pages/layout/header.jsp" %>
    
    <!-- 사이드바 -->
<%@ include file="/pages/layout/sidebar.jsp" %>          
      <!-- 메인 -->
     <div class="main-panel">          
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
            <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-comment-question"></i>                 
              </span>
             문의관리
            </h3>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">문의관리</a></li>
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
                                        <option>제목</option>
                                        <option>본문</option>
                                        <option>작성자</option>
                                        <option>작성 여부</option>
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

    <div class="row-lg-12" id="boardBox">
        <table class="table" id="article-table">
            <thead>
            <tr>
                <th class="hashtag col-1"><a>번호</a></th>
                <th class="title col-4"><a>제목</a></th>
                <th class="created-at col-1"><a>분류</a></th>
                <th class="user-id col-1"><a>작성자</a></th>
                <th class="created-at col-2"><a>작성일</a></th>
                <th class="created-at col-1"><a>답변 여부</a></th>
                <th class="created-at"><a>답변 | 삭제</a></th>
            </tr>
            </thead>
            <tbody>
            <%
									QuestionDAO questionDAO = new QuestionDAO();
					                List<QuestionDTO> questionList = questionDAO.getQuestionAll(null);
					                int count = 0; // 질문수 개수를 세기 위한 변수
					                for (QuestionDTO question : questionList) {
					                    if (count < 8) { // 10개만 출력되도록 제한
    	    			%>
            <tr>
            	<td class="hashtag"><%= question.getQ_no() %></td>
                <td class="title"><%= question.getQ_title() %></td>
                <td class="user-id"><%= question.getQ_sort() %></td>
                <td class="created-at"><%= question.getQ_writer() %></td>
                <td class="created-at"><%= question.getRegDate() %></td>
                <td class="created-at"><%= question.getReplyornot() %></td>
                <td><a href="getQuestion.do6?q_no=<%= question.getQ_no() %>"><i
													class="mdi mdi-pencil menu-icon"></i></a> | <a
												href="deleteQuestion.do6?q_no=<%= question.getQ_no() %>"><i
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

    <div class="row" style="margin:0 auto;">
        <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
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