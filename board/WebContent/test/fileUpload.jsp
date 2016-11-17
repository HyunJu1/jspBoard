<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파일업로드</title>
</head>
<body>


	<div align="center">
		<hr color="green" width="300">
		<h2>파 일 업 로 드 테 스 트</h2>
		<hr color="green" width="300">
		<form name="f" action="fileUpload_ok.jsp" method="post"
				enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>올린이</th><td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>파일명</th><td><input type="file" name="filename"></td>
					<!--  반드시 input type 을 file 로 지정해줘야한다!!!!!!!!!서버에 파일 내용까지 올리기 위해서. -->
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="파일전송">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>