<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="my.board.BoardDataBean" />

<%

	String num = request.getParameter("num");
	String passwd = request.getParameter("passwd");
	
	int result = dao.deleteBoard(Integer.parseInt(num), passwd);

	String msg = null;
	String url = null;
	if (result>0) {
		msg = "글삭제 성공!! 글목록페이지로 이동합니다.";
		url = "list.jsp";
	}else if (result<0){
		msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요";
		url = "deleteForm.jsp?num="+num;
	}else{
		msg = "글삭제 실패!! 글목록페이지로 이동합니다.";
		url = "list.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>



