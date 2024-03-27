<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셜록HOMES</title>
<style>
    .sidebar-offcanvas {
        background-color: #C8B4D3; 
    }

</style>
</head>
<body>
  <!-- 사이드 -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar" >
        <ul class="nav">
          <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
              <div class="nav-profile-image">
                <img src="/SherlockHomes/images/faces/profile.jpg" alt="profile">
                <span class="login-status online"></span> <!--change to offline or busy as needed-->              
              </div>
              <div class="nav-profile-text d-flex flex-column">
                <span class="font-weight-bold mb-2">${user.getId()}${userId}</span>
                <span class="font-weight-bold mb-2 text-small">관리자</span>
              </div>
              <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="mainView.do3">
              <span class="menu-title">대쉬보드</span>
              <i class="mdi mdi-home menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/SherlockHomes/pages/notice/notice.jsp">
              <span class="menu-title">공지사항</span>
              <i class="mdi mdi-bulletin-board menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">사용자 관리</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-contacts menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="listUser.do8">일반사용자</a></li>
                <li class="nav-item"> <a class="nav-link" href="listAgent.do2">공인중개사</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="listEstate.do4">
              <span class="menu-title">매물관리</span>
              <i class="mdi mdi-diamond menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/SherlockHomes/pages/report/report.jsp">
              <span class="menu-title">신고관리</span>
              <i class="mdi mdi-alert-box menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/SherlockHomes/pages/question/question.jsp">
              <span class="menu-title">문의관리</span>
              <i class="mdi mdi-comment-question menu-icon"></i>
            </a>
        </ul>
      </nav>

</body>
</html>