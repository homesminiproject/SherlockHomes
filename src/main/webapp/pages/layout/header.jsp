
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page errorPage="/SherlockHomes/pages/errors/boardError.jsp" %>
<%@page import="DTO.UsersDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셜록HOMES</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link href="/SherlockHomes/css/basic.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

    <!-- 상단바 -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" >
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center" >
        <a class="navbar-brand brand-logo" href="mainView.do3" style="height: 100%"><img src="/SherlockHomes/images/HOMES.png" alt="logo"  style="height: 100%" /></a>
        <a class="navbar-brand brand-logo" href="mainView.do3"  style="color: rgba(0, 0, 0, 0.9)"><h1 id="logo">셜록HOMES</h1></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <div class="search-field d-none d-md-block">

        </div>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
              <div class="nav-profile-img">
                <img src="/SherlockHomes/images/faces/profile.jpg" alt="image">
                <span class="availability-status online"></span>             
              </div>
              <div class="nav-profile-text">
                <p class="font-weight-bold mb-2">${user.getName()}${userId}</p>
              </div>
            </a>
            <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="/SherlockHomes/index.jsp">
                <i class="mdi mdi-cached mr-2 text-success"></i>
                쪽지
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="logout.do3">
                <i class="mdi mdi-logout mr-2 text-primary"></i>
                로그아웃
              </a>
            </div>
          </li>
          <li class="nav-item d-none d-lg-block full-screen-link">
            <a class="nav-link">
              <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
            </a>
          </li>
         
          
          <li class="nav-item nav-logout d-none d-lg-block">
            <a class="nav-link" href="/SherlockHomes/index.jsp">
              <i class="mdi mdi-power"></i>
            </a>
          </li>
          <li class="nav-item nav-settings d-none d-lg-block">
            <a class="nav-link" href="#">
              <i class="mdi mdi-format-line-spacing"></i>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
<%
	UsersDTO user = (UsersDTO) session.getAttribute("user");
%>
<Script>
function checkSession() {
    fetch('/checkSession') // 세션 확인을 위한 URL 설정
    .then(response => {
        if (response.status === 401) { // 세션 만료 상태 코드
            alert("세션이 만료되었습니다. 다시 로그인해주세요.");
            window.location.href = "logout.do3"; // 로그아웃 페이지로 리다이렉트
        }
    })
    .catch(error => {
        console.error('Error checking session:', error);
    });
}

// 일정 간격으로 checkSession 함수 호출
setInterval(checkSession, 300000); // 5분마다 세션 확인
</Script>
	
	</div>
</body>
</html>