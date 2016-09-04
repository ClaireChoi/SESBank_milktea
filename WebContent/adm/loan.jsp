<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html lang="ko">
<head>
<script type="text/javascript">
function formSend(vcr){
	var form = document.getElementById("form");
	if(vcr=='approve'){
		form.action="${pageContext.request.contextPath}/account/loan_allow.action";
	}if(vcr=='dec'){
		form.action="${pageContext.request.contextPath}/account/loan_decline.action";
		
	}
	form.submit();
	
}
</script>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<div id="header"><!-- 상단 -->
			<div id="top"><!-- 멤버 -->
				<a href="#">회원정보수정</a><a href="${pageContext.request.contextPath}/customer/logout.action">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</div>
			<div id="adm_navi"><!-- 네비게이션 -->
			<a href=""><img src="${pageContext.request.contextPath}/images/logo.png" width="150" /></a>
			<ul>
				<li class="select"><a href="adm_loan.html">대출승인</a></li>
				<li><a href="${pageContext.request.contextPath}/account/adm_answerlist.action">문의답변</a></li>
			</ul>
			</div>
			
		</div>

	<form id="form" action="" method="post">

		<div id="adm_contents"><!--내용-->
			<h1>관리자 / 대출승인<span></span></h1><!-- 내용제목 -->
			
			<table>
				<tr>
					<th>선택</th>
					<th>신청자</th>
					<th>계좌번호</th>
					<th>대출금액</th>
					<th>대출기간</th>
					<th>(대출)이율</th>
				</tr>
				<s:iterator value="acList" >
				<s:if test="approval==\"N\"">
				<tr>
					<td><input type="radio" name="accountno" value="<s:property value="accountno"/>" /></td>
					<td><s:property value="custid"/></td>
					<td><s:property value="accountno"/></td>
					<td><s:property value="balance"/></td>
					<td><s:property value="startdeposit" /> ~ <s:property
										value="enddeposit" /></td>
					<td><s:property value="interest" /></td>
				</tr>
				</s:if>
				</s:iterator>
				
			</table>
			<p class="adm_paging">
				<a href="javascript:formSend('approve');" class="select">승인</a><a href="javascript:formSend('dec');">거절</a>
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