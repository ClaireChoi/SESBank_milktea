<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">
function formSend(){
	
	var sform = document.getElementById("sform");
	sform.submit();
	
}
</script>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

</head>
<body><!-- 계좌현황서브 -->
<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>
	
		<div id="contents"><!--내용-->
			<h1>로그인</h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="${pageContext.request.contextPath}/images/login_icon.png" class="login_icon" />
				<form id="sform" action="customer/login.action" method="post">
					<ul>
						<li class=""><img src="${pageContext.request.contextPath}/images/ico_login.png" width="14" /> SE Bank Login</li>
						<li><input type="text" placeholder="아이디" class="login_write" name="custid"/></li>
						<li><input type="password" placeholder="비밀번호" class="login_write" name="password" /></li>
						<li><a href="javascript:formSend()" class="btn_login">로그인</a></li>
						<li><a href="customer/join.action" class="btn_join">회원가입</a></li>
						<li><a href="customer/find_idpw.action" class="btn_findid">아이디 / 비밀번호 찾기</a></li>
					</ul>
				</form>
			</div>


		</div>
	<s:if test="%{message}!=''">
	<script type="text/javascript">
	alert('${message}');
	</script>
	</s:if>


		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>



		</div>

	



</body>

</html>