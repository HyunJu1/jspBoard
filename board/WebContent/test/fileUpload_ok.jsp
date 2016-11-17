<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import ="com.oreilly.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파일 업로드 결과</title>
</head>
<body>
<% 
MultipartRequest mr = null;
String upPath = config.getServletContext().getRealPath("test");
try{
	

// 	mr = new MultipartRequest(request,"위치",제한된 크기 , "글꼴"); >>  cos.jar 생성자 적용시켜야한다.
	mr = new MultipartRequest(request, upPath, 10*1024*1024 , "EUC-KR");
}catch(IOException e) {
	out.println("파일 업로드 실패!");
	
}
String name = mr.getParameter("name");
String filename = mr. getFilesystemName("filename") ; // 파일은 반드시 getFilesystemName 이라고 가져와야한다!



%>

</body>
</html>