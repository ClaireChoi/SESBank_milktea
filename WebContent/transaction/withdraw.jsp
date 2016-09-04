<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<title>SESbank</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
function formSend(){
	var form = document.getElementById("form");
	form.submit();
	
	
}
</script>ipt
</head>

<body>
	<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>

		<form action="${pageContext.request.contextPath}/account/withdrawAction.action" id="form" method="post">
			<div id="contents">
				<!--내용-->
				<h1>
					출금<span>출금정보를 입력해 주세요</span>
				</h1>
				<!-- 내용제목 -->
				<ul class="basic_list">
					<li><span>&#47; 계좌구분</span> ${accounttype}계좌</li>
					<li><span>&#47; 계좌번호</span><input type="text" name="accountno"
						class="wr_account" value='${accountno}' readonly /></li>
					<li><span>&#47; 출금금액</span><input type="text"
						class="wr_account" name="amount" /></li>
				</ul>

				<p class="list_btn">
					<a href="customer/haveaccount.action">이전</a><a href="javascript:formSend();" class="select">출금</a>
				</p>



			</div>
		</form>


		<div id="footer">
			<!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br /> Copyright©2016
			KITA-SESchool ICT Educational Center All rights reserved.
		</div>



	</div>

	</div>




</body>

</html>