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
		msg = "�ۻ��� ����!! �۸���������� �̵��մϴ�.";
		url = "list.jsp";
	}else if (result<0){
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���";
		url = "deleteForm.jsp?num="+num;
	}else{
		msg = "�ۻ��� ����!! �۸���������� �̵��մϴ�.";
		url = "list.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>



