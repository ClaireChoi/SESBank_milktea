<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html lang="ko">
<head>
<script type="text/javascript">
	function formSend(trs) {
		var form = document.getElementById("form");
		if (trs == 'deposit') {
			form.action = "${pageContext.request.contextPath}/account/deposit.action"
		} else if (trs == 'withdraw') {
			form.action = "${pageContext.request.contextPath}/account/withdrawFormTest.action"
		} else if (trs == "transfer") {
			form.action = "${pageContext.request.contextPath}/account/transferForm.action"
		} else if(trs == "tradelist") {
			form.action="${pageContext.request.contextPath}/account/tradelist.action"
		} else if(trs="loanForm"){
			form.action="${pageContext.request.contextPath}/account/loanForm.action"
		}
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
			<h1>보유계좌 현황</h1>
			<!-- 내용제목 -->
			<form id="form" action="" method="post">
				<!-- 같은 곳에 name 은 같게 value를 다르게 해서 보내고 읽어본다.  -->
				<!-- 			<form id="wform" action ="../account/withdraw.action" method="post"> -->
				<!-- ../account/transfer.action -->
				<table>
					<tr>
						<th>선택</th>
						<th>계좌종류</th>
						<th>계좌번호</th>
						<th>잔고</th>
						<th>납입(상환)기간</th>
						<th>대출(이율)</th>
					</tr>
					<s:if test="acList!=null">
						<s:iterator value="acList">
						<s:if test="accounttype!='대출'">
						<tr>
								<td><input type="radio" name="backingname"
									value="<s:property value="accountno"/> <s:property value="accounttype"/>" /></td>
								<td><s:property value="accounttype" /></td>
								<td><s:property value="accountno" /></td>
								<td><s:property value="balance" /></td>
								<td><s:property value="startdeposit" /> ~ <s:property
										value="enddeposit" /></td>
								<td><s:property value="interest" /></td>

							</tr>
						</s:if>
						<s:elseif test="accounttype=='대출'">
							<s:if test="approval==\"Y\"">
							<tr>
								<td><input type="radio" name="backingname"
									value="<s:property value="accountno"/> <s:property value="accounttype"/>" /></td>
								<td><s:property value="accounttype" /></td>
								<td><s:property value="accountno" /></td>
								<td><s:property value="balance" /></td>
								<td><s:property value="startdeposit" /> ~ <s:property
										value="enddeposit" /></td>
								<td><s:property value="interest" /></td>

							</tr>
							</s:if>
							</s:elseif>
						</s:iterator>
					</s:if>

				</table>

				<p class="list_btn">
					<a href="javascript:formSend('deposit');">입금</a> <a
						href="javascript:formSend('withdraw');">출금</a> <a
						href="javascript:formSend('transfer');">이체</a> <a
						href="javascript:formSend('tradelist');">거래내역</a> <a
						href="javascript:formSend('loanForm');">대출상환</a>
				</p>


			</form>

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