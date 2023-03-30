package com.project.board1.service;

import java.util.ArrayList;

import com.project.board1.vo.Board1VO;

public interface Board1Service {

	public String getDate1();
	
	public int getNext1();
	
	public int write1(String board_Title, String user_id, String board_Content);
	
	public ArrayList<Board1VO> getList1(int pageNumber);
	
	public boolean nextPage1 (int pageNumber);
	
	public Board1VO getBoard1(int board_ID);
	
	public int update1(int board_ID, String board_Title, String board_Content);
	
	public int delete(int board_ID);
	
	public int reply(String board_Title, String user_id, String board_Content,Board1VO parent);
	
	public int replyupdate(Board1VO parent);
	
	public int targetPage (int pageNumber);
}
