<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html lang="ko">
<head>
<script type="text/javascript">
function formSend(){
	var form = document.getElementById("form");
	form.submit();
	
	
	
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
			<h1>고객센터<span>아이디, 패스워드 찾기</span></h1><!-- 내용제목 -->
			<div class="login_area">
				
				<img src="${pageContext.request.contextPath}/images/login_icon.png" class="login_icon" />
				
			
				
				<form id="form" action="${pageContext.request.contextPath}/customer/findIdAction.action" method="post">
				
				
					<ul style="display:;"><!-- 아이디찾기 -->
					
						<li class=""><img src="${pageContext.request.contextPath}/images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li><a href="#" class="findtitle_btn tab">아이디 찾기</a>&nbsp;<a href="#" class="findtitle_btn">패스워드 찾기</a></li>
						<li><input type="text" placeholder="이름" class="login_write" name="name"/></li>
						<li><input type="email" placeholder="이메일주소@도메인" class="login_write" name="email" /></li>
						<li><a href="javascript:formSend();" class="btn_idfind">아이디 확인</a></li>
					</ul>
					
					<ul style="display:none;"><!-- 비밀번호찾기 -->
						<li class=""><img src="${pageContext.request.contextPath}/images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li><a href="#" class="findtitle_btn">아이디 찾기</a>&nbsp;<a href="#" class="findtitle_btn tab"> 패스워드 찾기</a></li>
						<li><input type="text" placeholder="아이디" class="login_write" /></li>
						<li><input type="text" placeholder="이름" class="login_write" /></li>
						<li><input type="email" placeholder="이메일주소@도메인" class="login_write" /></li>
						<li><a href="#" class="btn_idfind">비밀번호 찾기</a></li>
					</ul>
					
					
				</form>
				
					<s:if test="%customer.custid!= null">
					찾으시는 ID <s:property value="customer.custid"/>
				</s:if>
			</div>


		</div>



		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>



		</div>

	</div>




</body>

</html>