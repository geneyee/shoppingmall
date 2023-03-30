package com.project.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.project.board.vo.BoardVO;
import com.project.dbconn.DBConn;

@Repository
public class BoardDAO {
	
	private Connection con;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public BoardDAO() throws ClassNotFoundException, SQLException {
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
	
	
	//현재의 시간을 가져오기
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
	
	//bbsID 게시글 번호 가져오는 함수

	public int getNext() { 

		String SQL = "SELECT board_ID FROM board1 ORDER BY board_ID DESC";
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
	public int write(String board_Title, String user_id, String board_Content,String board_file) { 

		String SQL = "INSERT INTO board1 VALUES(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, board_Title);
			pstmt.setString(3, user_id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, board_Content);
			pstmt.setString(6, board_file);
			pstmt.setInt(7,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<BoardVO> getList(int pageNumber){ 

		
		String SQL = "SELECT * FROM board1 where board_id > (select max(board_id) from board1) - ? and board_id <= (select max(board_id) from board1) -? order by board_id desc";
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,pageNumber * 10);
			pstmt.setInt(2,(pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO bbs = new BoardVO();
				bbs.setBoard_ID(rs.getInt(1));
				bbs.setBoard_Title(rs.getString(2));
				bbs.setUser_id(rs.getString(3));
				bbs.setBoard_Date(rs.getString(4));
				bbs.setBoard_Content(rs.getString(5));
				bbs.setBoard_file(rs.getString(6));
				bbs.setBoard_Available(rs.getInt(7));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage (int pageNumber) {

		String SQL = "SELECT * FROM board1 WHERE board_ID >= ? AND board_Available = 1";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,pageNumber * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 		
	}
	
	public int targetPage (int pageNumber) {

		String SQL = "SELECT count(board_id) from board1 where board_id > ?";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,(pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) / 10;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;		
	}
	
	public BoardVO getBoard(int board_ID) {

		String SQL = "SELECT * FROM board1 WHERE board_ID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board_ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				BoardVO bbs = new BoardVO();
				bbs.setBoard_ID(rs.getInt(1));
				bbs.setBoard_Title(rs.getString(2));
				bbs.setUser_id(rs.getString(3));
				bbs.setBoard_Date(rs.getString(4));
				bbs.setBoard_Content(rs.getString(5));
				bbs.setBoard_file(rs.getString(6));
				bbs.setBoard_Available(rs.getInt(7));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int board_ID, String board_Title, String board_Content) {

		String SQL = "update board1 set board_Title = ?, board_Content = ? where board_ID = ?";

		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, board_Title);
			pstmt.setString(2, board_Content);
			pstmt.setInt(3, board_ID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
public int delete(int board_ID) {
		
		
		String SQL = "delete from board1 WHERE board_ID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);   
			pstmt.setInt(1, board_ID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	
	
	
	
}