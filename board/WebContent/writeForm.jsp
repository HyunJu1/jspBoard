<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>�۾���</title>
	<script type="text/javascript">
	function checkBoard(){
		if (f.writer.value==""){
			alert("�̸��� �Է��ϼ���!")
			f.writer.focus()
			return false;
			}
		if (f.subject.value==""){
			alert("������ �Է��ϼ���!")
			f.subject.focus()
			return false;}
			if (f.content.value==""){
				alert("������ �Է��ϼ���!")
				f.content.focus()
				return false;}
			if (f.passwd.value==""){
				alert("��й�ȣ�� �Է��ϼ���!")
				f.passwd.focus()
				return false;}
				return true; 
	}
	</script>
</head>

<% 
int num=0 , re_step =0 , re_level =0 ;
String snum = request.getParameter("num");
if(snum!= null){
num=Integer.parseInt(snum);
re_step=Integer.parseInt(request.getParameter("re_step"));
re_level=Integer.parseInt(request.getParameter("re_level"));
}

%>
<body>
	<div align="center">
		<form name="f" method="post" action="writePro.jsp" 
		onsubmit="return checkBoard()"  enctype="multipart/form-data">
		<input type= "hidden" name ="num" value="<%=num%>">
		<input type= "hidden" name ="re_step" value="<%=re_step%>">
		<input type= "hidden" name ="re_level" value="<%=re_level%>">
		
		
		<table border="1" width="600">
			<tr bgcolor="#D9D6FF">
				<td colspan="2" align="center">�� �� ��</td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">�̸�</td>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">����</td>
				<td><input type="text" name="subject" size="60"></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">�̸���</td>
				<td><input type="text" name="email" size="60"></td>
			</tr>
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">����</td>
				<td><textarea name="content" rows="6" cols="60"></textarea></td>
			</tr>
			
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">���ϸ�</td>
				<td><input type="file" name="filename" size="60"></td>
			</tr>
		
			
			<tr>
				<td bgcolor="#D9D6FF" align="center" width="20%">��й�ȣ</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="�۾���">
					<input type="reset" value="�ٽ��ۼ�">
					<input type="button" value="�۸��">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>