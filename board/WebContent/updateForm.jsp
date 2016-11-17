<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*, my.board.*" %>
<jsp:useBean id= "dao" class= "my.board.BoardDataBean"/>


       

    
<html>
<head>
	<title> 글 수 정 </title>
	<script type="text/javascript">
	function checkBoard(){
		if (f.writer.value==""){
			alert("이름을 입력하세요!")
			f.writer.focus()
			return false;
			}
		if (f.subject.value==""){
			alert("제목을 입력하세요!")
			f.subject.focus()
			return false;}
			if (f.content.value==""){
				alert("내용을 입력하세요!")
				f.content.focus()
				return false;}
			if (f.passwd.value==""){
				alert("비밀번호를 입력하세요!")
				f.passwd.focus()
				return false;}
				return true; 
	}
	</script>
</head>


    <%

int num = Integer.parseInt(request.getParameter("num"));
BoardDBBean dto = dao.searchBoard(num);
%>
<body>


	<div align="center">
		<form name="f" method="post" action="updatePro.jsp" onsubmit="return checkBoard()">
		<input type ="hidden" name="num" value="<%=num %>" />
		<table border="1" width="600">
			<tr bgcolor="#D9D6FF">
				<td colspan="2" align="center">글 수 정</td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">이름</td>
				<td><input type="text" name="writer" value ="<%=dto.getWriter() %>"></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">제목</td>
				<td><input type="text" name="subject" size="60" value ="<%=dto.getSubject() %>" ></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">이메일</td>
				<td><input type="text" name="email" size="60" value ="<%=dto.getEmail() %>" ></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">내용</td>
				<td><textarea name="content" rows="6" cols="60" <%=dto.getContent() %> ></textarea></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정완료">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="javascript:location.href='list.jsp'" >
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>