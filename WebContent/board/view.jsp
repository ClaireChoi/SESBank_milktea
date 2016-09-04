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
function formSend(vtr){
	var form = document.getElementById("form");
	if(vtr=='update'){
		form.action="${pageContext.request.contextPath}/board/board_write.action"
	}else if(vtr=='delete'){
		form.action="${pageContext.request.contextPath}/board/deleteBoardCu.action"
	}
	
	form.submit();
	
}
</script>
</head>

<body><!-- 계좌현황서브 -->
<jsp:include page="/subHeader.jsp" flush="true">
<jsp:param name="lo" value=""/>
</jsp:include>

<form id="form" action="" method="post">
<input type="hidden" name="boardno" value='<s:property value="board.boardno"/>'/>
		<div id="contents"><!--내용-->
			<h1>고객문의 게시판<span></span></h1><!-- 내용제목 -->
			
			<table class="vw_board">
				<tr>
					<th>작성자</th>
					<td><s:property value="board.custid"/>  </td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><s:property value="board.regdate"/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><s:property value="board.title"/></td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2" class="table_contents">
					<s:property value="board.content"/>
					
					
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><s:a href="fileDownload?boardno=%{board.boardno}"> <s:property value="board.originalfile"/> </s:a></td>
				</tr>
			
			</table>
			<input type="hidden" value='<s:property value='board'/>' name="board">
			<table class="adm_board">
			<s:if test="board.replytext==null">
				<tr>
					<th>관리자<br />
					<span>(2016-01-01 10:21)</span>
					</th>
					<td>
						
						고객문의게시판입니다. 문의글을 남겨주세요<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />


					
					</td>
				</tr>
				</s:if>
				<s:if test="board.replytext!=null">
				<tr>
							<!-- 관리자 답변 -->
							<th>관리자<br /> <span> (<s:property
										value="board.repdate" />)
							</span>
							</th>
							<td colspan="2"><s:property value="board.replytext" /> <br />
								<br /> <br /> <br /> <br /></td>
						</tr>
				</s:if>
			</table>
			<p class="list_btn">
				<s:if test="board.replytext==null">			
				<a href="javascript:formSend('delete');">삭제</a></s:if>
				<a href="../board/boardlist.action" class="select">목록</a>
				
				
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