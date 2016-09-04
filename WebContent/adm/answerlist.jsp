<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html lang="ko">
<head>

<meta charset="utf-8">
<title>SESbank</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
	function changePage(page) {
		document.pcform.currentPage.value = page;
		pcform.submit();

	}
</script>
</head>

<body>
	<!-- 계좌현황서브 -->


	<div id="wrap">
		<!-- wrap -->

		<div id="header">
			<!-- 상단 -->
			<div id="top">
				<!-- 멤버 -->
				<a href="#">회원정보수정</a><a href="${pageContext.request.contextPath}/customer/logout.action">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</div>
			<div id="adm_navi">
				<!-- 네비게이션 -->
				<a href=""><img
					src="${pageContext.request.contextPath}/images/logo.png"
					width="150" /></a>
				<ul>
					<li><a href="adm_loan.html">대출승인</a></li>
					<li class="select"><a href="adm_answerlist.html">문의답변</a></li>
				</ul>
			</div>

		</div>



		<div id="adm_contents">
			<!--내용-->
			<h1>
				관리자 / 문의답변<span></span>
			</h1>
			<!-- 내용제목 -->

			<table>
				<tr>
					<th>No.</th>
					<th>문의내용</th>
					<th>일자</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록</th>
				</tr>
				<s:iterator value="boardlist" status="var">
					<tr>
						<s:url id="readurl" value="../board/answerview.action">
							<s:param name="boardno" value="%{boardno}"></s:param>
						</s:url>
						<td><s:property value="#var.index+1" /></td>
						<td class="board_title"><s:a href="%{readurl}">
						<s:property value="title" /> </s:a></td>
						<td><s:property value="regdate" /></td>
						<td><s:property value="custid" /></td>
						<td><s:property value="hitcount" /></td>
						<td><s:property value="notify" /></td>
					</tr>
				</s:iterator>
			</table>

			<p class="adm_paging">
				<a
					href="javascript:changePage(${pagenavi.currentPage} - ${pagenavi.pagePerGroup})">&lt</a>
				<s:iterator var="counter" begin="pagenavi.startPageGroup"
					end="pagenavi.endPageGroup">
					<s:if test="pagenavi.currentPage==#counter">
						<a href="javascript:changePage(<s:property value="counter"/>)"
							class="select"><s:property value="counter" /></a>
					</s:if>
					<s:else>
						<a href="javascript:changePage(<s:property value="counter"/>)"><s:property
								value="counter" /></a>
					</s:else>
				</s:iterator>
				<a
					href="javascript:changePage(${pagenavi.currentPage} + ${pagenavi.pagePerGroup})">&gt</a>
			</p>
			<p class="board_search">
				<select>
					<option value="">전체</option>
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">작성자</option>
				</select> <input type="text" /> <a href="#">검색</a>

			</p>

		</div>



		<div id="footer">
			<!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br /> Copyright©2016
			KITA-SESchool ICT Educational Center All rights reserved.
		</div>


		<form
			action="${pageContext.request.contextPath}/account/adm_answerlist.action"
			method="post" name="pcform" id="pcform">
			<input type="hidden" name="currentPage" value="pagenavi.currentPage">
		</form>

	</div>

	</div>




</body>

</html>