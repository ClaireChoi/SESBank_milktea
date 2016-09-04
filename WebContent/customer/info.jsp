<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

<meta charset="utf-8">
<title>SESbank</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
function formSend(){
	var form = document.getElementById("form");
	form.submit();
	
}
</script>
</head>

<body>
<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>

		<div id="contents">
			<!--내용-->
			<h1>
				회원정보 수정<span></span>
			</h1>
			<!-- 내용제목 -->
			<div>
				<form id="form" action="customer/updateAction.action" method="post">
					<ul class="member_info">
						<!-- 회원가입 -->
						<li><s:radio list="#{'personal':'개인','company':'법인'}" name="division" value="#{'personal'}"/></li>
<!-- 						<li><label for="" id="" name="division">회원구분</label><input type="radio" -->
<!-- 							name="personal" checked /> 개인 <input type="radio" name="company" /> 법인</li> -->
						<li><label for="wr_id">아이디</label><input type="text"
							id="wr_id"
							placeholder='<s:property value="custid" />' name="custid" 
							value='<s:property value="custid" />'
							class="login_write" READONLY /></li>
<%-- 						<li><s:textfield id="wr_id" key="아이디" value="custid" class="login_write"  ></s:textfield></li> --%>
							
						<li><label for="wr_pass">비밀번호</label><input type="password"
							id="wr_pass" name="password" class="login_write" /></li>
						<li><label for="wr_passchk">비밀번호 확인</label><input
							type="password" id="wr_passchk" class="login_write" /></li>
						<li><label for="wr_name">이름</label><input type="text" name="name"
							id="wr_name" class="login_write" /></li>
						<li><label for="wr_birnum">주민(사업자)번호</label><input name="idno"
							type="text" id="wr_birnum" placeholder='<s:property value="idno" />'
							class="login_write" READONLY /></li>
						<li><label for="wr_email">이메일</label><input type="email" name="email"
							id="wr_email" class="login_write" /></li>
						<li><label for="wr_address">주소</label><input type="text" name="address"
							id="wr_address" class="login_write" /></li>

					</ul>


				</form>
				<p class="list_btn">
					<a href="javascript:formSend();" class="select">회원정보수정</a>
				</p>
			</div>


		</div>



		<div id="footer">
			<!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br /> Copyright©2016
			KITA-SESchool ICT Educational Center All rights reserved.
		</div>



	</div>

	</div>




</body>

</html>