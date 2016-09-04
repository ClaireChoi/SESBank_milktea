<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<body>
	<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>
		<div id="contents">
			<!--내용-->
			<h1>
				이체<span>이체정보를 입력해 주세요</span>
			</h1>
			<form id="form" action="${pageContext.request.contextPath}/account/transferAction.action" method="post">
				<!-- 내용제목 -->
				<ul class="basic_list">
					<li><span>&#47; 계좌구분</span> ${accounttype}계좌</li>
					<li><span>&#47; 출금계좌번호</span><input type="text" name="accountno"
						class="wr_account" value="${accountno}" readonly /></li>
					<li><span></span><input type="radio" checked
						name="add_account"
						onclick="window.open('${pageContext.request.contextPath}/account/transfer_pop.action','pop','resizable=no scrollbars=yes top=300 left=500 width=500 height=300');return false" />본인계좌
						<input type="radio" name="add_account"
						onclick="window.open('${pageContext.request.contextPath}/account/transfer_pop1.action','pop','resizable=no scrollbars=yes top=300 left=500 width=400 height=250');return false" />타인계좌</li>
					<li><span>&#47; 입금계좌번호</span><input type="text" name="accountsel"
						id="accountsel" class="wr_account" placeholder="1233-434-23432"
						value="${accountsel}" readonly /> <!-- <a href="#">조회</a> --></li>
					<li><span>&#47; 이체금액</span><input type="text" name="amount"
						class="wr_account" /></li>
				</ul>

				<p class="list_btn">
					<a href="haveaccount.html">이전</a><a href="javascript:formSend();" class="select">이체</a>
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