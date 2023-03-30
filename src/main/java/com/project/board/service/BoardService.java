package com.project.board.service;

import java.util.ArrayList;

import com.project.board.vo.BoardVO;

public interface BoardService {

	public String getDate();
	
	public int getNext();
	
	public int write(String board_Title, String user_id, String board_Content, String board_file);
	
	public ArrayList<BoardVO> getList(int pageNumber);
	
	public boolean nextPage (int pageNumber);
	
	public BoardVO getBoard(int board_ID);
	
	public int update(int board_ID, String board_Title, String board_Content);
	
	public int delete(int board_ID);
	
	public int targetPage (int pageNumber);
}
