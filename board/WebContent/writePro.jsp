<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@	page import="com.oreilly.servlet.*, java.io.*" %>    
<jsp:useBean id="dao" class="my.board.BoardDataBean" />
<%
	MultipartRequest mr = null;
	String upPath = config.getServletContext().getRealPath("img");
	try{
		mr = new MultipartRequest(request,upPath,5*1024*1024,"EUC-KR");
	}catch(IOException e){
		e.printStackTrace();
	}
	String ip = request.getRemoteAddr();
	int result = dao.insertBoard(mr, ip);
	if (result>0){%>
	<script type="text/javascript">
		alert("�Խñ� ��� ����!!")
		location.href="list.jsp"
	</script>
<%	}else { %>
	<script type="text/javascript">
		alert("�Խñ� ��� ����!! �ٽ� �Է� �� �ּ���...")
		location.href="writeForm.jsp"
	</script>
<%	} %>	