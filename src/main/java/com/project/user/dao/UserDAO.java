package com.project.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;


import com.project.dbconn.DBConn;
import com.project.user.vo.UserVO;

@Repository
public class UserDAO {

	private Connection con;
	PreparedStatement pstmt=null;
	ResultSet rs = null;

	public UserDAO() throws ClassNotFoundException, SQLException {
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

	//회원가입
	public void registerAccount(UserVO vo) throws SQLException {

		String sql = "INSERT INTO usertable VALUES (?,?,?,?,?,?,?,?,?,?,?,1000,0)";

		pstmt=con.prepareStatement(sql);

		pstmt.setString(1, vo.getUser_id());
		pstmt.setString(2, vo.getName());
		pstmt.setString(3, vo.getPwd());
		pstmt.setString(4, vo.getTel());
		pstmt.setString(5, vo.getTel1());
		pstmt.setString(6, vo.getTel2());
		pstmt.setString(7, vo.getEmail());
		pstmt.setString(8, vo.getEmail1());
		pstmt.setString(9, vo.getAddress());
		pstmt.setString(10, vo.getAddress1());
		pstmt.setString(11, vo.getAddress2());


		pstmt.executeUpdate();
	}

	//회원탈퇴
	public int deleteAccount(String user_id, String pwd) throws SQLException {
		String sql = "SELECT pwd FROM usertable WHERE user_id=?";//먼저 비밀번호 확인

		pstmt=con.prepareStatement(sql);

		pstmt.setString(1, user_id);
		rs=pstmt.executeQuery();

		if(rs.next()) {//아이디가 존재한다면
			if(pwd.equals(rs.getString("pwd"))) {//비밀번호 같다면
				pstmt=con.prepareStatement("DELETE FROM usertable WHERE user_id=?");
				pstmt.setString(1, user_id);
				pstmt.executeUpdate();

				return 1;//회원탈퇴
			}
			else 
				return 0;//비밀번호 틀림
		}
		else//아이디x
			return -1;

	}

	//로그인
	public int login(String user_id, String pwd) throws SQLException {

		String SQL = "SELECT pwd FROM usertable WHERE user_id = ?";
		try {
			// pstmt : prepared statement 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스가져옴
			pstmt = con.prepareStatement(SQL);
			// sql인젝션 같은 해킹기법을 방어하는것... pstmt을 이용해 하나의 문장을 미리 준비해서(물음표사용)
			// 물음표해당하는 내용을 유저아이디로, 매개변수로 이용.. 1)존재하는지 2)비밀번호무엇인지
			pstmt.setString(1, user_id);
			// rs:result set 에 결과보관
			rs = pstmt.executeQuery();
			// 결과가 존재한다면 실행
			if (rs.next()) {
				// 패스워드 일치한다면 실행
				if (rs.getString("pwd").equals(pwd)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치

			}
			return -1; // 아이디가 없음 오류
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미
	}

	//아이디중복확인
	public int registerCheck(String user_id) throws SQLException {

		String SQL = "SELECT user_id FROM usertable WHERE user_id = ?";
		try {
			// pstmt : prepared statement 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스가져옴
			pstmt = con.prepareStatement(SQL);
			// sql인젝션 같은 해킹기법을 방어하는것... pstmt을 이용해 하나의 문장을 미리 준비해서(물음표사용)
			// 물음표해당하는 내용을 유저아이디로, 매개변수로 이용.. 1)존재하는지 2)비밀번호무엇인지
			pstmt.setString(1, user_id);
			// rs:result set 에 결과보관
			rs = pstmt.executeQuery();
			// 결과가 존재한다면 실행

			if (rs.next() || user_id.equals("")) {
				return 0; //이미 존재하는 회원
			} else {
				return 1; //가입가능한 회원
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류를 의미
	}

	//아이디찾기
	public UserVO idserach(UserVO vo) throws SQLException {
		String user_id = null;
		String SQL = "SELECT user_id FROM usertable WHERE email = ? and email1 = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getEmail1());
			// rs:result set 에 결과보관
			rs = pstmt.executeQuery();
			// 결과가 존재한다면 실행
			while(rs.next()) {
				UserVO user = new UserVO();
				user.setUser_id(rs.getString(1));
				//user.setUser_id(rs.getString(1));

				/*user.setName(rs.getString(2));
						user.setPwd(rs.getString(3));
						user.setTel(rs.getString(4));
						user.setTel1(rs.getString(5));
						user.setTel2(rs.getString(6));
						user.setEmail(rs.getString(7));
						user.setEmail1(rs.getString(8));
						user.setAddress(rs.getString(9));
						user.setAddress1(rs.getString(10));
						user.setAddress2(rs.getString(11));	
						user.setUser_point(rs.getInt(12));*/
				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류를 의미
	}

	//비밀번호 찾기
	public UserVO pwsearch(UserVO vo) throws SQLException {
		String SQL = "SELECT pwd FROM usertable WHERE user_id=? and email = ? and email1 = ?";

		pstmt=con.prepareStatement(SQL);
		pstmt.setString(1, vo.getUser_id());
		pstmt.setString(2, vo.getEmail());
		pstmt.setString(3, vo.getEmail1());

		rs=pstmt.executeQuery();
		while(rs.next()) {

			UserVO user = new UserVO();
			user.setPwd(rs.getString(1));

			return user;
		}

		return null;
	}	


	/*public ArrayList<UserVO> getUser(){ 

					String SQL = "SELECT user_id FROM usertable" ;

					ArrayList<UserVO> list = new ArrayList<UserVO>();
					try {
						PreparedStatement pstmt = con.prepareStatement(SQL);

						rs = pstmt.executeQuery();
						while (rs.next()) {
							UserVO user = new UserVO();
							user.setUser_id(rs.getString(1));
							user.setName(rs.getString(2));
							user.setPwd(rs.getString(3));
							user.setTel(rs.getString(4));
							user.setTel1(rs.getString(5));
							user.setTel2(rs.getString(6));
							user.setEmail(rs.getString(7));
							user.setEmail1(rs.getString(8));
							user.setAddress(rs.getString(9));
							user.setAddress1(rs.getString(10));
							user.setAddress2(rs.getString(11));	
							user.setUser_point(rs.getInt(12));
							list.add(user);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return list; 
				}			
	 */				


	//해당 아이디 찾기-마이페이지 
	public UserVO searchInfo(String sId) {

		String SQL = "SELECT * FROM usertable WHERE user_id = ?";
		try {
			pstmt=con.prepareStatement(SQL);	
			pstmt.setString(1, sId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				UserVO user = new UserVO();
				user.setUser_id(rs.getString(1));
				user.setName(rs.getString(2));
				user.setPwd(rs.getString(3));
				user.setTel(rs.getString(4));
				user.setTel1(rs.getString(5));
				user.setTel2(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setEmail1(rs.getString(8));
				user.setAddress(rs.getString(9));
				user.setAddress1(rs.getString(10));
				user.setAddress2(rs.getString(11));	
				user.setUser_point(rs.getInt(12));

				return user;

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	//회원정보수정
	public boolean infoupdate(String pwd,String tel,String tel1,String tel2,String email,String email1,String address,String address1,String address2,String user_id) {
		String sql="UPDATE usertable SET pwd=?, tel=?, tel1=?, tel2=?, email=?, email1=?, address=?, address1=?, address2=? WHERE user_id=?";

		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, tel);
			pstmt.setString(3, tel1);
			pstmt.setString(4, tel2);
			pstmt.setString(5, email);
			pstmt.setString(6, email1);
			pstmt.setString(7, address);
			pstmt.setString(8, address1);
			pstmt.setString(9, address2);
			pstmt.setString(10, user_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			return false;
		}
		return true;
	}
	//전체회원보기
	public ArrayList<UserVO> getAllInfo(UserVO vo) throws SQLException{
		
		ArrayList<UserVO> array = new ArrayList<UserVO>();
		
		String sql = "SELECT * FROM usertable";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			UserVO userinfo = new UserVO();
			
			userinfo.setUser_id(rs.getString("user_id"));
			userinfo.setName(rs.getString("name"));
			userinfo.setTel(rs.getString("tel"));
			userinfo.setTel1(rs.getString("tel1"));
			userinfo.setTel2(rs.getString("tel2"));
			userinfo.setEmail(rs.getString("email"));
			userinfo.setEmail1(rs.getString("email1"));
			userinfo.setAddress(rs.getString("address"));
			userinfo.setAddress1(rs.getString("address1"));
			userinfo.setAddress2(rs.getString("address2"));	
			userinfo.setUser_point(rs.getInt("user_point"));
			
			array.add(userinfo);
		}
		return array;
	}


}
