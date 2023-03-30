package com.project.user.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.project.user.vo.UserVO;

public interface UserService {
	//ȸ������
	public void registerAccount(UserVO vo) throws SQLException;
	//ȸ��Ż��
	public int deleteAccount(String user_id, String pwd) throws SQLException;
	//�α���üũ
	public int login(String user_id, String pwd) throws SQLException;
	//�α���-����������
	public UserVO searchInfo(String sId);
	//�������� - ��й�ȣ,��ȭ��ȣ,�̸���,�ּ�
	public boolean infoupdate(String pwd,String tel,String tel1,String tel2,String email,String email1,String address,String address1,String address2, String user_id);
    //���̵� �ߺ� üũ
	public int registerCheck(String user_id) throws SQLException ;
	//���̵� ã��
	public UserVO idserach(UserVO vo) throws SQLException;
	//��й�ȣ ã��
	public UserVO pwsearch(UserVO vo) throws SQLException;
	//��üȸ������
	public ArrayList<UserVO> getAllInfo(UserVO vo) throws SQLException;
	
	
}
