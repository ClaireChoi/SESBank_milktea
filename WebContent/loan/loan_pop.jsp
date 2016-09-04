<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="ko">
<head>
<script type="text/javascript">
function formSend(){
	//var form = document.getElementById("form");
 	var waccountno = document.form.waccountno.value;
	opener.document.getElementById("waccountno").value= waccountno;
// 	form.submit();
	this.close();
}

</script>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

</head>

<body>

<div class="popwrap">

<h2>출금계좌 선택</h2>
	<div style="">
	<form id="form" name="form" action="${pageContext.request.contextPath}/account/loan_popAction.action" method="post">
		<table>
			<tr>
				<th>선택</th>
				<th>계좌번호</th>
				<th>잔고</th>
			</tr>
<s:if test="acList!=null">
	<s:iterator value="acList">
			<tr>
				<td><input type="radio" name="waccountno" value="<s:property value="accountno"/>"/></td>
				<td><s:property value="accountno"/></td>
				<td><s:property value="balance"/></td>
			</tr>
			
</s:iterator>
		</s:if>
		</table>
		
		<p class="list_btn">
			<a href="javascript:formSend();">선택</a>
			</form>
		</p>
	</div>
</div>



</body>



</html>