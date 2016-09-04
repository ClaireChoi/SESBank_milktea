<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/./css/style.css" />
<script type="text/javascript">
	function idCheck(){
		var custid = document.getElementById("custid").value;
		window.open('customer/idCheck.action?custid='+custid+'','pop','resizable=no scrollbars=yes, top=300, left=500, width=300, height=180')
		return true;
	}
	
	function idChecked(id){
		//var id = document.getElimentByid("id").value;
		opener.document.getElementById("custid").value= id;
		this.close();
	}
</script>
</head>

<body>

<div class="popwrap">

<h2>ID중복확인</h2>
<s:if test='%{customer==null}'>
	<div >
		[<span> <input type="hidden" id="id" <s:property value="custid"/> > <s:property value="custid"/></span>] 아이디는 사용가능합니다.
		<p class="list_btn">
		<a href="#" onclick="idChecked('<s:property value="custid"/>');">적용</a>
		</p>
	</div>
</s:if><s:else>
	<div >
		[<span> <s:property value="custid"/> </span>] 아이디는 이미 사용중입니다.
		<p class="list_btn">
		<input type="text" class="wr_idcheck" id="custid" /> <a href="#" onclick="idCheck();">중복확인</a>
		</p>
	</div>
</div>
</s:else>


</body>

</html>