<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("EUC-KR"); %>
   
 <jsp:useBean id ="dto" class="my.board.BoardDBBean" />
  <jsp:setProperty property ="*" name="dto" />
   <jsp:useBean id ="dao" class="my.board.BoardDataBean" />
    
   <% 
   int result = dao.updateBoard(dto);

	String msg = null;
	String url = null;
	if (result>0) {
		msg = "�ۼ��� ����!! �۸���������� �̵��մϴ�.";
		url = "list.jsp";
	}else if (result<0){
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���";
		url = "updateForm.jsp?num="+dto.getNum();
	}else{
		msg = "�ۼ��� ����!! �۸���������� �̵��մϴ�.";
		url = "list.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
