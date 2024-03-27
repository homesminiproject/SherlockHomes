<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="DTO.EstateDTO"%>
<%@page import="DAO.EstateDAO"%>
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
#profile{
	margin: 3rem auto;
	width:10rem;
	height:10rem;
	}
#leftBox{
	list-style:none;
	margin: 0 auto;
	width:20rem;
}
#leftBox>li{
padding: 0.5rem;
}
</style>
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
						</span> 매물 정보수정
					</h3>
				</div>

<form action="updateEstate.do4" method="post">
						<input type="hidden" name="e_no" value="${estate.getE_no()}" >				
				<div class="row">
				<!-- 왼쪽위박스 / photo -->
				<div class="col-4 grid-margin stretch-card" >
				<div class="card">
				<div id="imageContainer" ></div>
				</div>
				</div>
				
				<!-- 오른쪽위박스 / content -->
					<div class="col-7 grid-margin stretch-card" style="height: 300px">
						<div class="card">
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
						<tr>
						    <th class="hashtag col-2">내용</th>
						    <td class="hashtag"><textarea class="form-control form-control-lg"
						            id="content" name="content"style="height:10rem">${estate.getContent()}</textarea></td>
						</tr>
									</tbody>
								</table>
							</div>
							</div>
							</div>
							</div>
							
				<div class="row">
				<!-- 왼쪽아래박스 / 수정 가능한 부분 -->			
				<div class="col-4 grid-margin stretch-card" style="height:380px;">
				<div class="card" >
				<div class="row-lg-12" id="boardBox">
				<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<th class="hashtag col-1">매물종류</th>
											<td class="hashtag col-3"><input type="text" style="max-width: 100px;" class="form-control form-control-lg"
											id="p_type" name="p_type"	value="${estate.getP_type() }"></td>
										</tr>
										<tr>
											<th class="hashtag col-1">가격</th>
											<td class="hashtag col-1"><input type="text" style="max-width: 100px;" class="form-control form-control-lg"
											id="price"	 name="price" value="${estate.getPrice() }"></td>
										</tr>
										<tr>
											<th class="hashtag col-1">면적</th>
											<td class="hashtag col-3"><input type="text" style="max-width: 100px;" class="form-control form-control-lg"
											id="area" name="area" value="${estate.getArea() }"></td>
										</tr>
										<tr>
											<th class="hashtag col-1">위험도</th>
											<td class="hashtag col-3"><input type="text" style="max-width: 100px;" class="form-control form-control-lg"
											id="risk"	name="risk" value="${estate.getRisk() }"></td>
										</tr>
										<tr>
										<td colspan=3><input type="submit" value="수정하기" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" style="width:15rem; margin:0 auto;"></input></td>
										</tr>
										</tbody>
										</table>
										</div>
				</div>
				</div>
				
				<!-- 오른쪽아래박스 / 수정 불가능 부분-->
					<div class="col-7 grid-margin stretch-card" style="height: 380px">
						<div class="card">
						
							<div class="row-lg-12" id="boardBox">
								<table class="table" id="article-table" style="margin-top:2rem;">
									<tbody>
										<tr>
											<th class="hashtag col-1">우편번호</th>
											<td class="hashtag col-2"><input type="text" class="form-control form-control-lg"
											id="postcode" readonly 	value="${estate.getPostcode() }"></td>
											<th class="hashtag col-2">주소</th>
											<td class="hashtag col-4"><input type="text" class="form-control form-control-lg"
											id="address" readonly 	value="${estate.getRoadaddress() } 	${estate.getDetailaddress() }"></td>
										</tr>
										<tr>
											<th class="hashtag col-2"><a>매물 분류</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="e_type"  readonly 	value="${estate.getE_type() }"></td>
											<th class="hashtag col-2"><a>공인중개사</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="ea_name"  readonly 	value="${estate.getEa_name() }"></td>

										</tr>
										<tr>
											<th class="hashtag col-2"><a>방 개수</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="room"  readonly 	value="${estate.getRoom() }개"></td>
											<th class="hashtag col-2"><a>작성일</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="regDate"  readonly 	value="${estate.getRegDate() }"></td>

										</tr>
										<tr>
											<th class="hashtag col-2"><a>건물 층수 / 매물 층수</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="floor" readonly 	value="${estate.getMax_floor() } / ${estate.getE_floor() }"></td>
											<th class="hashtag col-2"><a>준공일</a></th>
											<td class="hashtag"><input type="text" class="form-control form-control-lg"
											id="e_date" readonly 	value="${estate.getE_date() }"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					</div>
					</form>

					<script>
					    // 이미지를 표시할 컨테이너 엘리먼트
					    var imageContainer = document.getElementById("imageContainer");
					
					    // 이미지 URL 가져오기
					    var imageUrl = "${estate.getFilePath()}";
					
					    // 이미지를 표시하는 함수
					    function displayImage(imageUrl) {
					        // 이미지 요소 생성
					        var imgElement = document.createElement("img");
					        imgElement.src = imageUrl; // 이미지 URL 설정
					        imgElement.alt = "이미지";
					        imgElement.style.width = "700px"; // 이미지 너비 설정
					        imgElement.style.height = "300px"; // 이미지 높이 설정
					
					        // 이미지를 표시할 컨테이너에 이미지 요소 추가
					        imageContainer.appendChild(imgElement);
					    }
					
					    // 이미지 URL이 유효한지 확인하고 이미지 표시
					    if (imageUrl && imageUrl !== "null") {
					        displayImage(imageUrl);
					    } else {
					        // 이미지 URL이 없거나 null인 경우 기본 이미지를 표시
					        var defaultImageUrl = "/SherlockHomes/images/upload/1.jpg";
					        displayImage(defaultImageUrl);
					    }
					</script>

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