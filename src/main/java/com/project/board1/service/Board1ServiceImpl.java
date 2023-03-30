package com.project.board1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.board1.dao.Board1DAO;
import com.project.board1.vo.Board1VO;

@Service("Board1Service")
public class Board1ServiceImpl implements Board1Service {

	@Autowired
	private Board1DAO board1DAO;

	@Override
	public String getDate1() {
		// TODO Auto-generated method stub
		return board1DAO.getDate1();
	}

	@Override
	public int getNext1() {
		// TODO Auto-generated method stub
		return board1DAO.getNext1();
	}

	@Override
	public int write1(String board_Title, String user_id, String board_Content) {
		// TODO Auto-generated method stub
		return board1DAO.write1(board_Title, user_id, board_Content);
	}

	@Override
	public ArrayList<Board1VO> getList1(int pageNumber) {
		// TODO Auto-generated method stub
		return board1DAO.getList1(pageNumber);
	}

	@Override
	public boolean nextPage1(int pageNumber) {
		// TODO Auto-generated method stub
		return board1DAO.nextPage1(pageNumber);
	}

	@Override
	public Board1VO getBoard1(int board_ID) {
		// TODO Auto-generated method stub
		return board1DAO.getBoard1(board_ID);
	}

	@Override
	public int update1(int board_ID, String board_Title, String board_Content) {
		// TODO Auto-generated method stub
		return board1DAO.update1(board_ID, board_Title, board_Content);
	}

	@Override
	public int delete(int board_ID) {
		// TODO Auto-generated method stub
		return board1DAO.delete(board_ID);
	}

	@Override
	public int reply(String board_Title, String user_id, String board_Content, Board1VO parent) {
		// TODO Auto-generated method stub
		return board1DAO.reply(board_Title, user_id, board_Content, parent);
	}

	@Override
	public int replyupdate(Board1VO parent) {
		// TODO Auto-generated method stub
		return board1DAO.replyupdate(parent);
	}

	@Override
	public int targetPage(int pageNumber) {
		// TODO Auto-generated method stub
		return board1DAO.targetPage(pageNumber);
	}
	
	
}
