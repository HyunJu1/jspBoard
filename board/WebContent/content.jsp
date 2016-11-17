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
	<title>�۳��� ����</title>
</head>
<body>
	<div align="center">
		<h3> �۳��� ����</h3>
		<table border="1" width="600">
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">�۹�ȣ</td>
				<td align="center" width="20%"><%=dto.getNum() %></td>		
				
			
				<td bgcolor="#D9D6FF" align="center" width="20%">��ȸ��</td>
				<td align="center" width="20%"><%=dto.getReadcount() %></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">�ۼ���</td>
				<td align="center" width="20%"><%=dto.getWriter() %></td>
				<td bgcolor="#D9D6FF" align="center" width="20%">�ۼ���</td>
				<td align="center" width="20%"><%=dto.getReg_date() %> </td>
			</tr>
			
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">������</td>
				<td colspan = 3 align="center" ><%=dto.getSubject() %> </td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">�۳���</td>
				<td colspan = 3 align="center"><%=dto.getContent() %> </td>
			</tr>
			<%			if (dto.getFilesize()>0){ 
				String upPath = config.getServletContext().getRealPath("img");
%>			
			<tr>
				<td bgcolor="lightyellow" align="center" width="20%">����</td>
				<td colspan = 3 align="center">
					<a href="<%=upPath%>/<%=dto.getFilename()%>">	
						<%=dto.getFilename()%>
					</a>
				</td>
			</tr>
<%			} %>
				<td colspan = 4 bgcolor="#D9D6FF" colspan="2" align="right">
				
				<input type="button" value="��� �ޱ�" 
						onclick="javascript:location.href='writeForm.jsp?num=<%=dto.getNum() %>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'" >
						
					<input type="button" value="�ۻ���" 
						onclick="javascript:location.href='deleteForm.jsp?num=<%=dto.getNum() %>'" >
						<!-- action���� �ۼ����밡���� �Ѿ�� ó���� �������� -->
						
						<input type="button" value="�ۼ���" 
						onclick="javascript:location.href='updateForm.jsp?num=<%=dto.getNum() %>'" >
						
					<input type="button" value="�۸��" 
						onclick="javascript:location.href='list.jsp'" >
				</td>
				
			</tr>
		</table>
	
	</div>
</body>
</html>