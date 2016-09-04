<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="ko">
<head>
<script type="text/javascript">
	function formSend() {
		var form = document.getElementById("form");
		form.submit();

	}
	function formSend1(accountno){
		var form1 = document.getElementById("form1");
		opener.document.getElementById("accountsel").value= accountno;
		form.submit();
		this.close();
		
	}

</script>
<meta charset="utf-8">
<title>SESbank</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

</head>

<body>

	<div class="popwrap">

		<h2>입금계좌 입력</h2>
		<div>
			<p class="list_btn">
			<form id="form" action="${pageContext.request.contextPath}/account/transfer_pop2Action.action">
				<input type="text" class="wr_idcheck" placeholder="${accountno}" value="${accountno}" id="accountno"
					name="accountno" /> <a href="javascript:formSend();">조회</a><br />
			</form>

			<s:if test="accountsel==1">
				<br />
				<form id="form1" action="${pageContext.request.contextPath}/account/transfer_pop2Submit.action" >
				<span style="display:;"> <span>위 계좌는 유효한 계좌입니다</span><br />
					<br /> <br /> <a href="javascript:formSend1('${accountno}');" class="select">적용</a>
					</form>
			</s:if>
			<s:if test="accountsel!=1">
				</span>
				<span style="display: ;"> <span>위 계좌는 존재하지않는 계좌입니다</span><br />
					<br /> <br />
				</span>

			</s:if>

			</p>

		</div>
	</div>



</body>

</html>