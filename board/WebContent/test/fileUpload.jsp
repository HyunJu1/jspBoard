<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���Ͼ��ε�</title>
</head>
<body>


	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� �� �� Ʈ</h2>
		<hr color="green" width="300">
		<form name="f" action="fileUpload_ok.jsp" method="post"
				enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>�ø���</th><td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>���ϸ�</th><td><input type="file" name="filename"></td>
					<!--  �ݵ�� input type �� file �� ����������Ѵ�!!!!!!!!!������ ���� ������� �ø��� ���ؼ�. -->
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="��������">
						<input type="reset" value="�ٽ��ۼ�">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>