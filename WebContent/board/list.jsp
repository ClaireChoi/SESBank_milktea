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
	function formSend() {
		var form = document.getElementById("form");
		form.submit();

	}
	function changePage(page) {
		document.pcform.currentPage.value = page;
		pcform.submit();

	}
</script>
</head>

<body>
	<!-- 계좌현황서브 -->

	<jsp:include page="/subHeader.jsp" flush="true">
		<jsp:param name="lo" value="" />
	</jsp:include>

	<div id="contents">
		<!--내용-->
		<h1>
			고객문의 게시판<span></span>
		</h1>
		<!-- 내용제목 -->

		<table>
			<tr>
				<th>No.</th>
				<th>문의내용</th>
				<th>일자</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>

			<s:iterator value="boardlist" status="board">
				<tr>
					<s:url id="readurl" value="../board/boardRead.action">
						<s:param name="boardno" value="%{boardno}"></s:param>
					</s:url>
					<td><s:property value="#board.index+1" /></td>
					<td class="board_title"><s:a href="%{readurl}">
							<s:property value="title" />
						</s:a></td>
					<td><s:property value="regdate" /></td>
					<td><s:property value="custid" /></td>
					<td><s:property value="hitcount" /></td>
				</tr>
			</s:iterator>

		</table>
		<p class="paging">
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
			<a href="${pageContext.request.contextPath}/board/board_write.action"
				class="btn_write">글쓰기</a>
		</p>
		<form id="form"
			action="${pageContext.request.contextPath}/board/searchText.action"
			method="post">
			<p class="board_search">
				<select name="searchField">
					<option value="all">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="custid">작성자</option>
				</select> <input type="text" name="searchText" /> <a
					href="javascript:formSend();">검색</a>

			</p>
		</form>
	</div>

	<form
		action="${pageContext.request.contextPath}/board/boardlist.action"
		method="post" name="pcform" id="pcform">
		<input type="hidden" name="currentPage" value="pagenavi.currentPage">
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