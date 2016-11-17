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
		alert("게시글 등록 성공!!")
		location.href="list.jsp"
	</script>
<%	}else { %>
	<script type="text/javascript">
		alert("게시글 등록 실패!! 다시 입력 해 주세요...")
		location.href="writeForm.jsp"
	</script>
<%	} %>	