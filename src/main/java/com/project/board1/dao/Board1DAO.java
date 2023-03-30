package com.project.board1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.project.board.vo.BoardVO;
import com.project.board1.vo.Board1VO;
import com.project.dbconn.DBConn;

@Repository
public class Board1DAO {
	
	private Connection con;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public Board1DAO() throws ClassNotFoundException, SQLException {
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
	public String getDate1() { 

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

	public int getNext1() { 

		String SQL = "SELECT board_ID FROM board2 ORDER BY board_ID DESC";
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
	public int write1(String board_Title, String user_id, String board_Content) { 

		String SQL = "INSERT INTO board2 VALUES(?,?,?,?,?,?,0,0,?)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext1());
			pstmt.setString(2, board_Title);
			pstmt.setString(3, user_id);
			pstmt.setString(4, getDate1());
			pstmt.setString(5, board_Content);
			pstmt.setInt(6, getNext1());
			pstmt.setInt(7,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Board1VO> getList1(int pageNumber){ 
		
		String SQL = "SELECT * FROM board2 where board_group > (select max(board_group) from board2) - ? and board_group <= (select max(board_group) from board2) -? order by board_group desc,board_seq asc";
		/*String SQL = "SELECT * FROM (select * from board2 WHERE board_group < ? AND board_Available=1 order by board_group desc, board_seq asc) where rownum<=10";*/
		
		ArrayList<Board1VO> list = new ArrayList<Board1VO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,pageNumber * 10);
			pstmt.setInt(2,(pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board1VO bbs = new Board1VO();
				bbs.setBoard_ID(rs.getInt(1));
				bbs.setBoard_Title(rs.getString(2));
				bbs.setUser_id(rs.getString(3));
				bbs.setBoard_Date(rs.getString(4));
				bbs.setBoard_Content(rs.getString(5));
				bbs.setBoard_group(rs.getInt(6));
				bbs.setBoard_seq(rs.getInt(7));
				bbs.setBoard_level(rs.getInt(8));
				bbs.setBoard_Available(rs.getInt(9));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage1 (int pageNumber) {
		
		String SQL = "SELECT * FROM board2 WHERE board_group >= ? AND board_Available = 1";
		ArrayList<Board1VO> list = new ArrayList<Board1VO>();
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

		String SQL = "SELECT count(board_group) from board2 where board_group > ?";
		ArrayList<Board1VO> list = new ArrayList<Board1VO>();
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
	
	public Board1VO getBoard1(int board_ID) {

		String SQL = "SELECT * FROM board2 WHERE board_ID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board_ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board1VO bbs = new Board1VO();
				bbs.setBoard_ID(rs.getInt(1));
				bbs.setBoard_Title(rs.getString(2));
				bbs.setUser_id(rs.getString(3));
				bbs.setBoard_Date(rs.getString(4));
				bbs.setBoard_Content(rs.getString(5));
				bbs.setBoard_group(rs.getInt(6));
				bbs.setBoard_seq(rs.getInt(7));
				bbs.setBoard_level(rs.getInt(8));
				bbs.setBoard_Available(rs.getInt(9));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update1(int board_ID, String board_Title, String board_Content) {

		String SQL = "update board2 set board_Title = ?, board_Content = ? where board_ID = ?";

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

		String SQL = "delete from board2 WHERE board_ID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board_ID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	
	public int reply(String board_Title, String user_id, String board_Content,Board1VO parent) { 

		String SQL = "INSERT INTO board2 VALUES(?,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext1());
			pstmt.setString(2, board_Title);
			pstmt.setString(3, user_id);
			pstmt.setString(4, getDate1());
			pstmt.setString(5, board_Content);
			pstmt.setInt(6, parent.getBoard_group());
			pstmt.setInt(7, parent.getBoard_seq() + 1);
			pstmt.setInt(8, parent.getBoard_level() + 1);
			pstmt.setInt(9,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int replyupdate(Board1VO parent) {

		String SQL = "update board2 set board_seq = board_seq + 1 where board_group = ? and board_seq > ? ";

		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, parent.getBoard_group());
			pstmt.setInt(2, parent.getBoard_seq());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	
}