<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import ="com.oreilly.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���ε� ���</title>
</head>
<body>
<% 
MultipartRequest mr = null;
String upPath = config.getServletContext().getRealPath("test");
try{
	

// 	mr = new MultipartRequest(request,"��ġ",���ѵ� ũ�� , "�۲�"); >>  cos.jar ������ ������Ѿ��Ѵ�.
	mr = new MultipartRequest(request, upPath, 10*1024*1024 , "EUC-KR");
}catch(IOException e) {
	out.println("���� ���ε� ����!");
	
}
String name = mr.getParameter("name");
String filename = mr. getFilesystemName("filename") ; // ������ �ݵ�� getFilesystemName �̶�� �����;��Ѵ�!



%>

</body>
</html>