package com.project.user.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.project.user.vo.UserVO;

public interface UserService {
	//회원가입
	public void registerAccount(UserVO vo) throws SQLException;
	//회원탈퇴
	public int deleteAccount(String user_id, String pwd) throws SQLException;
	//로그인체크
	public int login(String user_id, String pwd) throws SQLException;
	//로그인-마이페이지
	public UserVO searchInfo(String sId);
	//정보수정 - 비밀번호,전화번호,이메일,주소
	public boolean infoupdate(String pwd,String tel,String tel1,String tel2,String email,String email1,String address,String address1,String address2, String user_id);
    //아이디 중복 체크
	public int registerCheck(String user_id) throws SQLException ;
	//아이디 찾기
	public UserVO idserach(UserVO vo) throws SQLException;
	//비밀번호 찾기
	public UserVO pwsearch(UserVO vo) throws SQLException;
	//전체회원보기
	public ArrayList<UserVO> getAllInfo(UserVO vo) throws SQLException;
	
	
}
