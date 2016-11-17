<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.*, my.board.*" %>    
<jsp:useBean id="dao" class="my.board.BoardDataBean" /> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
</head>
<body>
<div align ="center" >
<h3>게 시 판 </h3>
<table width = "600" >
<tr bgcolor = "#E3C4FF" >
  <td align ="right" ><a href ="writeForm.jsp"> 글쓰기</a></td>
  </tr> 
</table>
<table width ="600"  border ="1">
<tr bgcolor = "#FFD6FF">
<th> 번호 </th>
<th> 제목 </th>
<th> 작성자 </th>
<th> 작성일 </th>
<th> 조회 </th>
<th> IP </th>
</tr>
<!-- DB 에서 데이터를 받아와 출력시키기 -->
<%
				int pageSize = 5;
				String pageNum = request.getParameter("pageNum");
				if (pageNum==null){
					pageNum="1";
				}
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage-1) * 5; 
				int endRow = startRow + pageSize - 1;

				List<BoardDBBean> list = dao.listBoard();
				if (endRow>=list.size()) endRow = list.size()-1;
				if (list == null || list.size() == 0) {
			%>
			<tr>
				<td colspan="6">등록된 게시글이 없습니다.</td>
			</tr>
<%			} else{ 
				for(int i=startRow; i<=endRow; ++i){
				BoardDBBean dto =list.get(i); 
				%>
			<tr>
			
				<td><%=dto.getNum()%></td>
				<td>
				<% if (dto.getRe_level()>0){ %>
				<img src = "level.gif" width = "<%=dto.getRe_level()*10 %>" >
				<img src ="re.gif" >
					
					<% }%>
					
				<a href = "content.jsp?num=<%=dto.getNum()%>">
				<%=dto.getSubject()%>
				</a>
				
				</td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getReg_date()%></td>
				<td><%=dto.getReadcount()%></td>
				<td><%=dto.getIp()%></td>
				<td>
				<%if (dto.getFilesize()>0){ %>
					<img src="folder.gif">
				<%}else{ %>
					<img src="level.gif">
				<%} %>
				</td>
			</tr>	
<%				}
			}%>						
		</table>
		<%
		if (list.size()>0){
			int pageBlock = 3;
			int pageAllBlock = list.size()/pageSize + (list.size()%pageSize==0 ? 0 : 1);
			int startBlock = (currentPage-1)/pageBlock*pageBlock  + 1;
			int endBlock = startBlock + pageBlock - 1;
			if (endBlock>pageAllBlock) endBlock = pageAllBlock;
			
			if (startBlock>pageBlock){%>
			 	[<a href="list.jsp?pageNum=<%=startBlock-pageBlock%>">이전</a>]
<%			} 			
			for(int i=startBlock; i<=endBlock; ++i){%>
				[<a href="list.jsp?pageNum=<%=i%>"><%=i%></a>]
<%			}
			if (endBlock<pageAllBlock){%>
				[<a href="list.jsp?pageNum=<%=startBlock+pageBlock%>">다음</a>]
<%			}
		}
		%>
	</div>
</body>
</html>










