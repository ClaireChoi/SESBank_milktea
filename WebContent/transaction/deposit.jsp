<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

		<form id="form" action="${pageContext.request.contextPath}/account/depositAction.action" method="post" >
		<div id="contents"><!--내용-->
			<h1>입금<span>입금정보를 입력해 주세요</span></h1><!-- 내용제목 -->
			<ul class="basic_list">
				<li><span>&#47; 계좌구분</span> ${accounttype} 계좌</li>
				<li><span>&#47; 계좌번호</span><input type="text" class="wr_account" name="accountno" value='<s:property value="accountno"/>'/></li>
				<li><span>&#47; 입금금액</span><input type="text" class="wr_account" name="amount"/></li>
			</ul>

			<p class="list_btn">
				<a href="#">이전</a><a href="javascript:formSend();" class="select">입금</a>
			</p>
		


		</div>
		</form>


		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>



		</div>

	</div>




</body>

</html>