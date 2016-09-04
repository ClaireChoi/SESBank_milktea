<%@page import="seschool.bank.util.PageNavigator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>SESbank</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
	function formSend() {
		var form = document.getElementById("form");
		form.submit();

	}
</script>
</head>

<body>
	<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>
		<div id="contents">
			<!--내용-->
			<h1>
				거래내역 조회<span></span>
			</h1>
			<form action="${pageContext.request.contextPath}/account/tradelistSearch.action" id="form"
				method="post">
				<!-- 내용제목 -->
				<ul class="basic_list">
					<li><span>&#47; 조회계좌번호</span> <span>${accountno}</span></li>
					<li><span>&#47; 조회기간선택</span><input type="text"
						class="wr_date" name="startdate" /> ~ <input type="text"
						class="wr_date" name="enddate" /></li>
					<li><span>&#47; 조회내용</span><input type="radio"
						name="listcheck" checked value="all" />전체 <input type="radio"
						name="listcheck" value="deposit" />입금내역 <input type="radio"
						name="listcheck" name="withdraw" />출금내역</li>
					<li><span>&#47; 조회결과순서</span> <input type="radio"
						name="listcheck2" value="asc" checked />최근거래순서 <input
						type="radio" name="listcheck2" value="desc" />과거거래순서</li>
				</ul>

				<p class="list_btn">
					<a href="haveaccount.html">이전</a><a href="javascript:formSend();"
						class="select">조회</a>
				</p>
			</form>
			 
			<s:if test="pageList!=null">
				<table>
					<tr>
						<th>거래일자</th>
						<th>시간</th>
						<th>출금</th>
						<th>입금</th>
						<th>내용</th>
						<th>잔액</th>
					</tr>
					<s:iterator value="pageList">
						<tr>
							<td><s:property value="eventdate" /></td>
							<td><s:property value="eventtime" /></td>
							<td><s:if test="eventtype=='withdraw'">
									<s:property value="amount" />
								</s:if></td>
							<td><s:if test="eventtype=='deposit'">
									<s:property value="amount" />
								</s:if></td>
							<td><s:property value="eventrecord" /></td>
							<td><s:property value="balance" /></td>
						</tr>
					</s:iterator>
				</table>
			</s:if>
<s:if test="pagenavi!=null">
			<p class="paging">
				<a href="#">&lt</a>
				<a href="${pageContext.request.contextPath}/account/tradelistSearch.action?startPageGroup='${startPageGroup}'" class="select"><s:property value="startPageGroup"/></a>
				<a href="${pageContext.request.contextPath}/account/secondPagelist.action?startPageGroup='${startPageGroup}'"><s:property value="startPageGroup+1"/></a>
				<a href="#"><s:property value="startPageGroup+2"/></a>
				...<a href="#">&gt</a>
			</p>
</s:if>

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