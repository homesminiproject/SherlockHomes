
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page errorPage="/WEB-INF/errors/boardError.jsp" %>
<%@page import="DTO.UsersDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셜록HOMES</title>
  <link href="SherlockHomes/css/basic.css" rel="stylesheet" />
</head>
<body>

    <!-- 상단바 -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="/SherlockHomes/pages/general/main.jsp" style="height: 100%"><img src="/SherlockHomes/images/HOMES.png" alt="logo"  style="height: 100%" /></a>
        <a class="navbar-brand brand-logo" href="/SherlockHomes/pages/general/main.jsp"  style="color: rgba(0, 0, 0, 0.9)"><h1 id="logo">셜록HOMES</h1></a>
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
                <p class="mb-1 text-black">관리자</p>
              </div>
            </a>
            <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="/SherlockHomes/index.jsp">
                <i class="mdi mdi-cached mr-2 text-success"></i>
                계정관리
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="/SherlockHomes/pages/general/adminLogin.jsp">
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
            <a class="nav-link" href="../../index.jsp">
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
<%--
<%	if(user == null) { %>
	<a href="/board/insertUser.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;
	<a href="login.do">로그인</a>&nbsp;&nbsp;&nbsp;
<%	} else { %>
	<a href="insertBoard.do">글등록</a>&nbsp;&nbsp;&nbsp;
	<a href="logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;
<%	} %>
 --%>	
	
	</div>
</body>
</html>