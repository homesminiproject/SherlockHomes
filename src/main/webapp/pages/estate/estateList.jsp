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
  <link rel="stylesheet" href="/SherlockHomes/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/SherlockHomes/vendor/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/SherlockHomes/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/SherlockHomes/images/HOMES.png" />
<script>
// 동적으로 생성된 요소에 이벤트 핸들러를 바인딩하기 위해 document에 이벤트를 바인딩합니다.
$(document).on('click', '.delete-estate', function(event) {
    // 기본 동작 방지
    event.preventDefault();

    // 삭제할 부동산의 번호 가져오기
    var eNo = $(this).data('no');

    // AJAX 요청
    $.ajax({
        type: 'GET', // 요청 방식
        url: 'deleteEstate.do4', // 요청 URL
        data: { e_no: eNo }, // 전송할 데이터
        success: function(response) { // 요청 성공 시 실행되는 함수
            // 성공 메시지를 사용자에게 표시하거나, 성공 후의 동작 수행
            console.log('매물 삭제 완료');
            alert('매물 삭제 완료.');
            // 페이지 새로고침
            location.reload();
        },
        error: function(xhr, status, error) { // 요청 실패 시 실행되는 함수
            console.error(xhr.responseText); // 콘솔에 오류 로그 출력
            // 사용자에게 오류 메시지를 보여줄 수도 있음
            alert('매물 삭제에 실패했습니다. 다시 시도해주세요.');
        }
    });
});
</script>
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
				                <form action="SearchEstate.do4" method="post" >
				                    <div class="row">
				                        <div class="col-12">
				                            <div class="row no-gutters">
				                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
				                                    <label for="search-type" hidden>검색 유형</label>
				                                    <select class="form-control" id="searchCondition" name="searchCondition">
				                                        <option>주소</option>
				                                        <option>건물종류</option>
				                                        <option>매매종류</option>
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
                <th class="hashtag col-1"><a>등록번호</a></th>
                <th class="title col-2"><a>주소</a></th>
                <th class="title col-1"><a>건물종류</a></th>
                <th class="title xcol-1"><a>전/월세</a></th>
                <th class="user-id col-1"><a>가격</a></th>
                <th class="user-id col-2"><a>공인중개사</a></th>
                <th class="created-at col-2"><a>매물 등록일</a></th>
                <th class="created-at col-1"><a>위험도</a></th>
                <th class="created-at col-1"><a>수정|삭제</a></th>
            </tr>
            </thead>

<!-- 내용 -->            
            <tbody>
  <c:forEach begin="${startUserIndex}" end="${endUserIndex}" items="${estateList}" var="estate" varStatus="status">
			<tr>
			    <td class="hashtag">${estate.getE_no()}</td>
			    <td class="title"><a>${estate.getRoadaddress()}</a></td>
			    <td class="user-id">${estate.getE_type()}</td>
			    <td class="user-id">${estate.getP_type()}</td>
			    <td class="user-id">${estate.getPrice()}</td>
			    <td class="created-at">${estate.getEa_name()}</td>
			    <td class="created-at">${estate.getRegDate()}</td>
			    <td class="created-at">${estate.getRisk()}</td>
			    <td>
			        <a href="getEstate.do4?e_no=${estate.getE_no()}"><i class="mdi mdi-pencil menu-icon"></i></a> | 
			        <a href="deleteEstate.do4?e_no=${estate.getE_no()}"><i class="mdi mdi-delete-empty menu-icon"></i></a>

			    </td>
			</tr>
          </c:forEach>
            </tbody>
        </table>
    </div>

		<div style="text-align: center; margin-top: 10px;">
		    <c:if test="${hasPreviousPage}">
		        <a  href="listEstate.do4?page=${currentPage - 1}" style="font-size: 14px;">이전</a>
		    </c:if>
		<c:forEach begin="0" end="${total/10}" var="i"> 
		    <a href="listEstate.do4?page=${i+1}" style="font-size: 14px; margin-left: 10px;">${i+1}</a>
		</c:forEach>
		    <c:if test="${hasNextPage}">
		        <a href="listEstate.do4?page=${currentPage + 1}" style="font-size: 14px; margin-left: 10px;">다음</a>
		    </c:if>
		</div>
		<br>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
										<input type="button" value="매물 등록"
											class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
											style="width: 20rem; margin: 0 auto;"
											onclick="location.href='/SherlockHomes/pages/estate/estateInsert.jsp'">
									</div>

              </div>
            </div>
            </div>
         <br>

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