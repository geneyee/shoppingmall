package com.project.board2.service;

import java.util.ArrayList;

import com.project.board2.vo.Board2VO;

public interface Board2Service {

	public String getDate();
	
	public int getNext();
	
	public int write(String board_Title, String user_id, String board_Content);
	
	public ArrayList<Board2VO> getList(int pageNumber);
	
	public boolean nextPage (int pageNumber);
	
	public Board2VO getBoard(int board_ID);
	
	public int update(int board_ID, String board_Title, String board_Content);
	
	public int delete(int board_ID);
	
	public int targetPage (int pageNumber);
}
