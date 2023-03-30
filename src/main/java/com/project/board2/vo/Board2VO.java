package com.project.board2.vo;

public class Board2VO {

	private int board_ID;
	private String board_Title;
	private String user_id;
	private String board_Date;
	private String board_Content;
	private int board_Available;
	
	public Board2VO() {
		
	}

	public Board2VO(int board_ID, String board_Title, String user_id, String board_Date, String board_Content,
			int board_Available) {
		super();
		this.board_ID = board_ID;
		this.board_Title = board_Title;
		this.user_id = user_id;
		this.board_Date = board_Date;
		this.board_Content = board_Content;
		this.board_Available = board_Available;
	}

	public int getBoard_ID() {
		return board_ID;
	}

	public void setBoard_ID(int board_ID) {
		this.board_ID = board_ID;
	}

	public String getBoard_Title() {
		return board_Title;
	}

	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_Date() {
		return board_Date;
	}

	public void setBoard_Date(String board_Date) {
		this.board_Date = board_Date;
	}

	public String getBoard_Content() {
		return board_Content;
	}

	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}

	public int getBoard_Available() {
		return board_Available;
	}

	public void setBoard_Available(int board_Available) {
		this.board_Available = board_Available;
	}
	
	
}
