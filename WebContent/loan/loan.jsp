<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
function loan_pop(){
	window.open('${pageContext.request.contextPath}/account/loan_pop.action','pop','resizable=no scrollbars=yes top=300 left=500 width=500 height=300');
	return false;
	
}
function formSend(){
	var form = document.getElementById("form");
	form.submit();
	
}
</script>
</head>

<body>
<!-- 계좌현황서브 -->
<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>

	<form action="${pageContext.request.contextPath}/account/loanAction.action" id="form" method="post">
		<div id="contents"><!--내용-->
			<h1>대출상환<span>상환정보를 입력해 주세요</span></h1><!-- 내용제목 -->
			<ul class="basic_list">
				<li><span>&#47; 계좌구분</span> 대출계좌</li>
				<li><span>&#47; 계좌번호</span><input type="text" class="wr_account" value="${accountno}" name="accountno"/></li>
				<li><span>&#47; 출금계좌번호</span><input type="text" class="wr_account" placeholder="2354-258-25891" id="waccountno" name="accountsel"/><a href="#" onclick="loan_pop();">조회</a></li>
				<li><span>&#47; 상환금액</span><input type="text" class="wr_account" name="amount" /></li>
			</ul>

			<p class="list_btn">
				<a href="haveaccount.html">이전</a><a href="javascript:formSend();" class="select">대출상환</a>
			</p>
		</form>


		</div>



		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>



		</div>

	</div>




</body>

</html>