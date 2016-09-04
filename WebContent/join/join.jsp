<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="ko">
<head>
<script type="text/javascript">
	function idCheck(){
		var custid = document.getElementById("custid").value;
		window.open('customer/idCheck.action?custid='+custid+'','pop','resizable=no scrollbars=yes, top=300, left=500, width=300, height=180')
		return true;
	}
	
	function formSend(){
		var sform = document.getElementById("sform");
		var pw= document.getElementById("password").value;
		var pwch = document.getElementById("passwordCheck").value;
		
		if((pw==null)||(pw!=pwch)){
			alert('비밀번호와 비밀번호확인이 일치하지 않습니다. 다시 확인해 주세요.');
			return false;
		}
		
		sform.submit();
	}
</script>

<meta charset="utf-8">
<title>SESbank</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

</head>
<!-- window.open('customer/idCheck.action','pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180');return false -->
<body>
<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>


		<div id="contents">
			<!--내용-->
			<h1>
				회원가입<span>가입항목을 입력해 주세요</span>
			</h1>
			<!-- 내용제목 -->
			<div class="login_area">
				<img src="${pageContext.request.contextPath}/images/login_icon.png" class="login_icon" />
				<form id="sform" action="customer/joinAction.action" method="post">
					<ul>
						<!-- 회원가입 -->
						
						<li
							style="border-bottom: 1px dotted #e7121c; padding-bottom: 5px;"><img
							src="${pageContext.request.contextPath}/images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li class="grp_area"><label for="">회원구분</label>
						<s:radio list="#{'personal':'개인','company':'법인'}" name="division" value="#{'personal'}"/>
<!-- 						<input -->
<!-- 							type="radio" name="grp" checked /> 개인 <input type="radio" -->
<!-- 							name="grp" /> 법인</li> -->
						<li><input type="text" placeholder="아이디" class="join_write" name="custid" id="custid"/>
				
						<a href="#" class="id_check"
							onclick="idCheck();">중복체크</a></li>
						<li><input type="password" placeholder="비밀번호" name="password" id="password"
							class="login_write" /></li>
						<li><input type="password" placeholder="비밀번호 확인" name="passwordcheck" id="passwordCheck"
							class="login_write" /></li>
						<li><input type="text" placeholder="이름" class="login_write" name="name"/></li>
						<li><input type="text" placeholder="주민(사업자)번호"  name="idno"
							class="login_write" /></li>
						<li><input type="email" placeholder="이메일주소@도메인" name="email"
							class="login_write" /></li>
						<li><input type="text" placeholder="주소" name="address" class="login_write" /></li>
						<li><a href="javascript:formSend()" class="btn_join">회원가입</a></li>
					</ul>


				</form>
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