<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	String num = request.getParameter("num"); %>
<div align="center">
	<h3>�ۻ���</h3>
	<i>��й�ȣ�� �Է����ּ���.</i>
	<br/><br/>
	<form action="deletePro.jsp" method="post">
		<input type="password" name="passwd" />
		<input type="hidden" name="num" value="<%=num%>">
	</form>
</div>