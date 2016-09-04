<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="ko">
<head>
<script type="text/javascript">
function formSend(){
	//var accountsel = document.getElementsByName("accnountsel");
	var accountsel = document.form.accountsel.value;
	opener.document.getElementById("accountsel").value= accountsel;
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

		<h2>입금계좌 선택</h2>
		<div style="">
		<form id="form" name="form" action="transfer_pop1Action" method="post">
			<table>
				<tr>
					<th>선택</th>
					<th>계좌번호</th>
					<th>잔고</th>
				</tr>
				<s:if test="acList!=null">
					<s:iterator value="acList">
						<tr>
							<td><input type="radio" name="accountsel" value="<s:property value="accountno" />"/></td>
							<td><s:property value="accountno" /></td>
							<td><s:property value="balance" /></td>
						</tr>
						</s:iterator>
				</s:if>
				
			</table>

			<p class="list_btn">
				<a href="javascript:formSend();">선택</a>
			</p>
			</form>
		</div>
	</div>



</body>

</html>