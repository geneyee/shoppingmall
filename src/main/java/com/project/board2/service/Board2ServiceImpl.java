package com.project.board2.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.board2.dao.Board2DAO;
import com.project.board2.vo.Board2VO;

@Service("Board2Service")
public class Board2ServiceImpl implements Board2Service {

	@Autowired
	private Board2DAO boardDAO;

	@Override
	public String getDate() {
		// TODO Auto-generated method stub
		return boardDAO.getDate();
	}

	@Override
	public int getNext() {
		// TODO Auto-generated method stub
		return boardDAO.getNext();
	}

	@Override
	public int write(String board_Title, String user_id, String board_Content) {
		// TODO Auto-generated method stub
		return boardDAO.write(board_Title, user_id, board_Content);
	}

	@Override
	public ArrayList<Board2VO> getList(int pageNumber) {
		// TODO Auto-generated method stub
		return boardDAO.getList(pageNumber);
	}

	@Override
	public boolean nextPage(int pageNumber) {
		// TODO Auto-generated method stub
		return boardDAO.nextPage(pageNumber);
	}

	@Override
	public Board2VO getBoard(int board_ID) {
		// TODO Auto-generated method stub
		return boardDAO.getBoard(board_ID);
	}

	@Override
	public int update(int board_ID, String board_Title, String board_Content) {
		// TODO Auto-generated method stub
		return boardDAO.update(board_ID, board_Title, board_Content);
	}

	@Override
	public int delete(int board_ID) {
		// TODO Auto-generated method stub
		return boardDAO.delete(board_ID);
	}

	@Override
	public int targetPage(int pageNumber) {
		// TODO Auto-generated method stub
		return boardDAO.targetPage(pageNumber);
	}
	
	
}
