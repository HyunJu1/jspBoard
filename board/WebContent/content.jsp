<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.*, my.board.*" %>
<jsp:useBean id= "dao" class= "my.board.BoardDataBean"/>
<jsp:useBean id="df" class="java.text.DecimalFormat"/>

    

<%

int num = Integer.parseInt(request.getParameter("num"));
BoardDBBean dto = dao.searchBoard(num);
%>



<html>
<head>
	<title>글내용 보기</title>
</head>
<body>
	<div align="center">
		<h3> 글내용 보기</h3>
		<table border="1" width="600">
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">글번호</td>
				<td align="center" width="20%"><%=dto.getNum() %></td>		
				
			
				<td bgcolor="#D9D6FF" align="center" width="20%">조회수</td>
				<td align="center" width="20%"><%=dto.getReadcount() %></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">작성자</td>
				<td align="center" width="20%"><%=dto.getWriter() %></td>
				<td bgcolor="#D9D6FF" align="center" width="20%">작성일</td>
				<td align="center" width="20%"><%=dto.getReg_date() %> </td>
			</tr>
			
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">글제목</td>
				<td colspan = 3 align="center" ><%=dto.getSubject() %> </td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">글내용</td>
				<td colspan = 3 align="center"><%=dto.getContent() %> </td>
			</tr>
			<%			if (dto.getFilesize()>0){ 
				String upPath = config.getServletContext().getRealPath("img");
%>			
			<tr>
				<td bgcolor="lightyellow" align="center" width="20%">파일</td>
				<td colspan = 3 align="center">
					<a href="<%=upPath%>/<%=dto.getFilename()%>">	
						<%=dto.getFilename()%>
					</a>
				</td>
			</tr>
<%			} %>
				<td colspan = 4 bgcolor="#D9D6FF" colspan="2" align="right">
				
				<input type="button" value="답글 달기" 
						onclick="javascript:location.href='writeForm.jsp?num=<%=dto.getNum() %>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'" >
						
					<input type="button" value="글삭제" 
						onclick="javascript:location.href='deleteForm.jsp?num=<%=dto.getNum() %>'" >
						<!-- action으로 작성내용가지고 넘어가게 처리가 끝나있음 -->
						
						<input type="button" value="글수정" 
						onclick="javascript:location.href='updateForm.jsp?num=<%=dto.getNum() %>'" >
						
					<input type="button" value="글목록" 
						onclick="javascript:location.href='list.jsp'" >
				</td>
				
			</tr>
		</table>
	
	</div>
</body>
</html>