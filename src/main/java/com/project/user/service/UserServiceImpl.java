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
	
	//ȸ������
	@Override
	public void registerAccount(UserVO vo) throws SQLException {
		userDAO.registerAccount(vo);
	}

	//ȸ��Ż��
	@Override
	public int deleteAccount(String user_id, String pwd) throws SQLException {
		
		return userDAO.deleteAccount(user_id, pwd);
	}

	//�α���
	@Override
	public int login(String user_id, String pwd) throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.login(user_id, pwd);
	}
	
	//����������
	@Override
	public UserVO searchInfo(String sId) {
		
		return userDAO.searchInfo(sId);
		
	}

	
	//����������
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
	//��й�ȣã��
	@Override
	public UserVO pwsearch(UserVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.pwsearch(vo);
	}
	//��üȸ������
	@Override
	public ArrayList<UserVO> getAllInfo(UserVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.getAllInfo(vo);
	}


}
