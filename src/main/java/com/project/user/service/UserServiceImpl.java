package com.project.user.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.dao.UserDAO;
import com.project.user.vo.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	//회원가입
	@Override
	public void registerAccount(UserVO vo) throws SQLException {
		userDAO.registerAccount(vo);
	}

	//회원탈퇴
	@Override
	public int deleteAccount(String user_id, String pwd) throws SQLException {
		
		return userDAO.deleteAccount(user_id, pwd);
	}

	//로그인
	@Override
	public int login(String user_id, String pwd) throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.login(user_id, pwd);
	}
	
	//마이페이지
	@Override
	public UserVO searchInfo(String sId) {
		
		return userDAO.searchInfo(sId);
		
	}

	
	//마이페이지
	@Override
	public boolean infoupdate(String pwd,String tel,String tel1,String tel2,String email,String email1,String address,String address1, String address2, String user_id) {
		
		return userDAO.infoupdate(pwd, tel, tel1, tel2, email, email1, address, address1, address2, user_id);
	}

	@Override
	public int registerCheck(String user_id) throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.registerCheck(user_id);
	}

	@Override
	public UserVO idserach(UserVO vo) throws SQLException  {
		// TODO Auto-generated method stub
		return userDAO.idserach(vo);
	}
	//비밀번호찾기
	@Override
	public UserVO pwsearch(UserVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.pwsearch(vo);
	}
	//전체회원보기
	@Override
	public ArrayList<UserVO> getAllInfo(UserVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.getAllInfo(vo);
	}


}
