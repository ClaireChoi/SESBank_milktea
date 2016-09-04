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

<body><!-- 계좌현황서브 -->
<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>


		<div id="contents"><!--내용-->
			<h1>신규계좌 개설<span>예금계좌정보를 입력해 주세요</span></h1><!-- 내용제목 -->
			<form id="form" action="${pageContext.request.contextPath}/account/add1Action.action" method="post">
				<input type="hidden" name="accounttype" value="checking">
			<ul class="basic_list">
				<!-- 예금계좌 -->
				<li><span>&#47; 계좌구분</span>예금계좌</li>
				<li><span>&#47; 계좌번호</span><input type="text" class="wr_account" placeholder="2354-258-25891" readonly /> <!-- <a href="#">계좌번호 발급</a> --></li>
				<li><span>&#47; 초기잔고</span><input type="text" class="wr_account" name="balance"/></li>

			</ul>

			<p class="list_btn">
				<a href="javascript:formSend();" class="select">계좌개설</a>
			</p>
			</form>
			<p class="extext">
			※ 대출계좌는 승인 완료 후 계좌현황에서 확인하실 수 있습니다
			</p>

		</div>

		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>



		</div>

	</div>




</body>

</html>