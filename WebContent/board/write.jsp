<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="ko">
<head>
<script type="text/javascript">
function formSend(vkr) {
	var title = document.getElementById('title');
	var content = document.getElementById('content');
	var form = document.getElementById("form");
	
	if(title.value.length == 0 || content.value.length== 0){
		alert('제목과 내용을 입력하세요.');
		return;
	}
// 	if(vkr=='ok'){
// 		form.action="writeAction"
// 	}
	if(vkr=='upok'){
		form.action="${pageContext.request.contextPath}/board/updateAction.action";
	}
	
	form.submit();
}
</script>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

</head>

<body>

<!-- 계좌현황서브 -->
<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>

		<div id="contents"><!--내용-->
			<s:form enctype="multipart/form-data" id="form" action="writeAction" method="post" theme="simple">
			<h1>고객문의 게시판<span></span></h1><!-- 내용제목 ../board/writeAction.action-->
			<table class="wr_board">
				<tr>
					<th>작성자</th>
					<td> <s:property value="#session.loginId"/> <s:property value="board.custid"/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" id='title' name="board.title" value="<s:property value="board.title"/>"/></td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2"><textarea id='content' name="board.content"><s:property value="board.content"/></textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><s:file id="upload" name="upload"/></td>
				</tr>
			
			</table>
			<input type="hidden" name="board.boardno" value='<s:property value="board.boardno"/>'>
</s:form>
			<p class="list_btn">
				<a href="board_list.html">취소</a>
				<s:if test="board==null">
				<a href="javascript:formSend('ok');" class="select">등록</a></s:if>
				<s:if test="board!=null"> 
				<a href="javascript:formSend('upok');" class="select">수정완료</a><!-- 분기처리하기 -->
				</s:if>
				
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