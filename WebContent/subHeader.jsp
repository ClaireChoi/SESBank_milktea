<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 계좌현황서브 -->


	<div id="wrap">
		<!-- wrap -->

		<div id="header">
			<!-- 상단 -->
			<div id="top">
				<!-- 멤버 -->
				<a href="${pageContext.request.contextPath}/customer/update.action">회원정보수정</a><a href="${pageContext.request.contextPath}/customer/logout.action">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</div>
			<div id="navi">
				<a href="#"><img src="${pageContext.request.contextPath}/images/logo.png" width="150" /></a>
				<div class="gnb">
					<!-- 네비게이션 -->

					<ul>
						<li><a href="${pageContext.request.contextPath}/customer/haveaccount.action" class="select">보유계좌현황</a> 
						<!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> -->
						</li>

						<li><a href="#">신규계좌개설</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/account/add1.action">예금계좌</a></li>
								<li><a href="${pageContext.request.contextPath}/account/add2.action">적금계좌</a></li>
								<li><a href="${pageContext.request.contextPath}/account/add3.action">대출계좌</a></li>
							</ul></li>
						<li><a href="${pageContext.request.contextPath}/board/boardlist.action">고객문의게시판</a> <!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> --></li>
					</ul>
				</div>
			</div>

		</div>
</body>
</html>