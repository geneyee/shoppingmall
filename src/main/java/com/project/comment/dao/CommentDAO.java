package com.project.comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.project.board.vo.BoardVO;
import com.project.comment.vo.CommentVO;
import com.project.dbconn.DBConn;
import com.project.user.vo.UserVO;

@Repository
public class CommentDAO {

	private Connection con;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public CommentDAO() throws ClassNotFoundException, SQLException {
		con = new DBConn().getConnection();
	}
	public void pstmtClose() throws SQLException {
		if(pstmt!=null)
			pstmt.close();
	}
	public void getAllInfoClose() throws SQLException {
		
		if (rs != null)
			rs.close();
		
		if (pstmt != null)
			pstmt.close();
		
		if (con != null)
			con.close();
		
	}
	
	public String getDate() { 

		String SQL = "select TO_CHAR(sysdate,'RR-MM-DD') from dual";
				
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext() { 

		String SQL = "SELECT comment_id FROM comment1 ORDER BY comment_id DESC";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	
	
	//실제로 글을 작성하는 함수
	public int commentwrite(int board_ID, String user_id,String comment_board) { 

			String SQL = "INSERT INTO comment1 VALUES(?,?,?,?,?)";
			
			try {
				PreparedStatement pstmt = con.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setInt(2, board_ID);
				pstmt.setString(3, user_id);
				pstmt.setString(4, getDate());
				pstmt.setString(5, comment_board);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
	
	public ArrayList<CommentVO> getList(int board_ID){ 

		String SQL = "SELECT * FROM comment1 where board_id = ?";
		
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board_ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setComment_id(rs.getInt(1));
				comment.setBoard_ID(rs.getInt(2));
				comment.setUser_id(rs.getString(3));
				comment.setComment_date(rs.getString(4));
				comment.setComment_board(rs.getString(5));
				
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public void delete(int board_ID) {
	      
	      
	      String SQL = "delete from comment1 WHERE board_ID = ?";
	      try {
	         PreparedStatement pstmt = con.prepareStatement(SQL);   
	         pstmt.setInt(1, board_ID);
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	       // 데이터베이스 오류
	   }
}
