package my.board;


import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.oreilly.servlet.MultipartRequest;

import my.board.BoardDBBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;






	public class BoardDataBean {
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		
		static DataSource ds;//javax.sql.*
		static{
			try{
				Context init = new InitialContext();//javax.namming.*
				ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			}catch(NamingException e){//javax.namming.*
				System.out.println("lookup실패 : " + e.getMessage());
			}
		}
		
		// 게시판의 모든 글들 다 List로
		public List listBoard() throws SQLException {
			String sql = "select * from jsp_board order by re_step asc";
			try {
				con= ds.getConnection();
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				List list = makeList(rs);
				return list;
			} finally {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			}
		}
	public List makeList(ResultSet rs) throws SQLException{
		List list = new ArrayList();
		while(rs.next()){
			BoardDBBean dto = new BoardDBBean();
			dto.setNum(rs.getInt("num"));
			
			dto.setEmail(rs.getString("email"));
			dto.setIp(rs.getString("ip"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setContent(rs.getString("content"));
			dto.setWirter(rs.getString("writer"));
			dto.setRe_step(rs.getInt("re_step"));
			dto.setRe_level(rs.getInt("re_level"));

			dto.setFilename(rs.getString("filename"));
			dto.setFilesize(rs.getInt("filesize"));
			list.add(dto);
		}
		return list;
	}
	
	protected void setRe_Step(String sql) throws SQLException {
		try{
			con= ds.getConnection();
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
			
		}finally{
			if(con!=null) con.close();
		}
	}
	public int insertBoard(MultipartRequest mr, String ip) throws SQLException {
		int num = Integer.parseInt(mr.getParameter("num"));
		int re_step = Integer.parseInt(mr.getParameter("re_step"));
		int re_level = Integer.parseInt(mr.getParameter("re_level"));
		
		if (num==0){//새글이냐
			String sql = "update jsp_board set re_step = re_step + 1";
			setRe_Step(sql);
		}else{//답글이면
			String sql = "update jsp_board set re_step = re_step + 1 "
					+ "where re_step>"+re_step;
			setRe_Step(sql);
			re_step++;
			re_level++;
		}
		
		String sql = "insert into jsp_board values" + "(jsp_board_seq.nextval, "
				+ "?,?,?,?,sysdate,0,?,?,?,?,?,?)";
		try {
			con= ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("writer"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("subject"));
			ps.setString(4, mr.getParameter("passwd"));
			ps.setString(5, mr.getParameter("content"));
			ps.setString(6, ip);
			ps.setInt(7, re_step);
			ps.setInt(8, re_level);
			ps.setString(9, mr.getFilesystemName("filename"));
			int filesize = 0;
			File file = mr.getFile("filename");
			if (file != null) {
				filesize = (int)file.length();
			}
			ps.setInt(10, filesize);
			
			int res = ps.executeUpdate();
			return res;
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	
	//글정보 하나 가져오기
	public BoardDBBean searchBoard(int num) throws SQLException{
		String sql ="select * from jsp_board where num=? "; 
		try{	
			con= ds.getConnection();
	       ps = con.prepareStatement(sql);
	       ps.setInt(1, num);
	       ResultSet rs =ps.executeQuery();
	       List<BoardDBBean> list = makeList(rs);
			return list.get(0);
		} finally {
			if (con != null)
				con.close();
		}
		
	}
      
	       
	       
	 /*  	BoardDBBean dto = new BoardDBBean();
		if(rs.next()){
	   	dto.setNum(rs.getInt("num"));
		
		dto.setEmail(rs.getString("email"));
		dto.setIp(rs.getString("ip"));
		dto.setSubject(rs.getString("subject"));
		dto.setPasswd(rs.getString("passwd"));
		dto.setReadcount(rs.getInt("readcount"));
		dto.setReg_date(rs.getString("reg_date"));
		dto.setContent(rs.getString("content"));
		dto.setWirter(rs.getString("writer"));
		}
		return dto;
		}finally {
			if(con!=null)
				con.close();
		}
		
	}
	
	
	
}*/
	protected boolean isPass(int num, String passwd) throws SQLException {
		String sql ="select passwd from jsp_board where num = ?";
		try {
			con= ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			rs.next();
			String dbPass = rs.getString(1);
			if (dbPass.equals(passwd)){
				return true;
			}else return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	// 글 삭제하기
	public int deleteBoard(int num, String passwd) throws SQLException {
	boolean isPasswd = isPass(num,passwd) ;
	if(isPasswd){
	String sql = "delete from jsp_board where num = ?";
			try{	
				con= ds.getConnection();
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				int res = ps.executeUpdate();
				return res;
			}
			
		finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}}
	return -1;//password가 틀렸을때 반환되는 값
	}
	
	public int updateBoard(BoardDBBean dto) throws SQLException {
		boolean isPasswd = isPass(dto.getNum(), dto.getPasswd());
		if (isPasswd){
			String sql = "update jsp_board set writer=?, "
				+ "subject=?, email=?, content=? where num=?";
			try{
				con= ds.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getWriter());
				ps.setString(2, dto.getSubject());
				ps.setString(3, dto.getEmail());
				ps.setString(4, dto.getContent());
				ps.setInt(5, dto.getNum());
				int res = ps.executeUpdate();
				return res;
			}finally {
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
		}
		return -1;//password가 틀렸을때 반환되는 값
	}
}

