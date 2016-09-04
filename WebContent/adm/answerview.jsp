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
	function delform() {
		var form = document.getElementById("delform");
		form.submit();
	}
	function update(){
		var boardno = document.getElementById("boardno");
		var form = document.getElementById("delform");
		form.action = "../board/updateBoard.action";
		form.submit();
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

			<table class="vw_board">
				<tr>
					<th>작성자</th>
					<td><s:property value="board.custid" /></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><s:property value="board.regdate" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><s:property value="board.title" /></td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2" class="table_contents"><s:property
							value="board.content" /></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><s:a href="fileDownload?boardno=%{board.boardno}">
							<s:property value="board.originalfile" />
						</s:a></td>
				</tr>

			</table>

			<form id="form" name="form"
				action="${pageContext.request.contextPath}/board/replyAction.action"
				method="post">
				<table class="adm_board">
					<s:if test="board.replytext==null">
						<tr>
							<!-- 관리자 답변 -->
							<th>관리자<br /> <span>(2016-01-01 10:21)</span>
							</th>
							<td colspan="2">고객문의게시판입니다. 문의글을 남겨주세요<br /> 2016년 1월 1일 기준
								2.2% 입니다.<br /> <br /> <br /> <br /> <br /> <br />
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

					<s:if test="board.replytext==null">
						<tr>
							<!-- 관리자답변등록 -->
							<th>답변</th>
							<td><textarea id="replytext" name="replytext"> </textarea></td>
							<td><a href="javascript:formSend();" class="btn_reply">등록</a></td>
						</tr>
					</s:if>
				</table>
				<input type="hidden" name="boardno" id="baordno" value="${board.boardno}">
			</form>
			<form name="delform" id="delform"
				action="../board/deleteBoard.action" method="post">
				<p class="list_btn">
					<input type="hidden" name="boardno" value="${board.boardno}">
					<a href="javascript:update();">수정</a>
					<a href="javascript:delform();">삭제</a> 
					<a href="adm_answerlist.html" class="select">목록</a>
				</p>
			</form>
		</div>
		<!-- &boardno=${board.boardno} -->
<!-- 	../board/updateBoard.action -->
		<div id="footer">
			<!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br /> Copyright©2016
			KITA-SESchool ICT Educational Center All rights reserved.
		</div>



	</div>

	</div>




</body>

</html>