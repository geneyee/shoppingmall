package com.project.board2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.project.board.vo.BoardVO;
import com.project.board2.vo.Board2VO;
import com.project.dbconn.DBConn;

@Repository
public class Board2DAO {
	
	private Connection con;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public Board2DAO() throws ClassNotFoundException, SQLException {
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

		String SQL = "SELECT board_ID FROM board3 ORDER BY board_ID DESC";
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
	public int write(String board_Title, String user_id, String board_Content) { 

		String SQL = "INSERT INTO board3 VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, board_Title);
			pstmt.setString(3, user_id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, board_Content);
			pstmt.setInt(6,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Board2VO> getList(int pageNumber) {

		String SQL = "SELECT * FROM board3 where board_id > (select max(board_id) from board3) - ? and board_id <= (select max(board_id) from board3) -? order by board_id desc";

		ArrayList<Board2VO> list = new ArrayList<Board2VO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber * 10);
			pstmt.setInt(2, (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board2VO bbs = new Board2VO();
				bbs.setBoard_ID(rs.getInt(1));
				bbs.setBoard_Title(rs.getString(2));
				bbs.setUser_id(rs.getString(3));
				bbs.setBoard_Date(rs.getString(4));
				bbs.setBoard_Content(rs.getString(5));
				bbs.setBoard_Available(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage (int pageNumber) {

		String SQL = "SELECT * FROM board3 WHERE board_ID >= ? AND board_Available = 1";
		ArrayList<Board2VO> list = new ArrayList<Board2VO>();
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

		String SQL = "SELECT count(board_id) from board3 where board_id > ?";
		ArrayList<Board2VO> list = new ArrayList<Board2VO>();
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
	
	public Board2VO getBoard(int board_ID) {

		String SQL = "SELECT * FROM board3 WHERE board_ID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board_ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board2VO bbs = new Board2VO();
				bbs.setBoard_ID(rs.getInt(1));
				bbs.setBoard_Title(rs.getString(2));
				bbs.setUser_id(rs.getString(3));
				bbs.setBoard_Date(rs.getString(4));
				bbs.setBoard_Content(rs.getString(5));
				bbs.setBoard_Available(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int board_ID, String board_Title, String board_Content) {

		String SQL = "update board3 set board_Title = ?, board_Content = ? where board_ID = ?";

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

		String SQL = "delete from board3 WHERE board_ID = ?";
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