<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	String num = request.getParameter("num"); %>
<div align="center">
	<h3>글삭제</h3>
	<i>비밀번호를 입력해주세요.</i>
	<br/><br/>
	<form action="deletePro.jsp" method="post">
		<input type="password" name="passwd" />
		<input type="hidden" name="num" value="<%=num%>">
	</form>
</div>