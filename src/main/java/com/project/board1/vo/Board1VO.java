package com.project.board1.vo;

public class Board1VO {

	private int board_ID;
	private String board_Title;
	private String user_id;
	private String board_Date;
	private String board_Content;
	private int board_group;
	private int board_seq;
	private int board_level;
	private int board_Available;
	
	public Board1VO() {
		
	}

	public Board1VO(int board_ID, String board_Title, String user_id, String board_Date, String board_Content,
			int board_group, int board_seq, int board_level, int board_Available) {
		super();
		this.board_ID = board_ID;
		this.board_Title = board_Title;
		this.user_id = user_id;
		this.board_Date = board_Date;
		this.board_Content = board_Content;
		this.board_group = board_group;
		this.board_seq = board_seq;
		this.board_level = board_level;
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

	public int getBoard_group() {
		return board_group;
	}

	public void setBoard_group(int board_group) {
		this.board_group = board_group;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public int getBoard_level() {
		return board_level;
	}

	public void setBoard_level(int board_level) {
		this.board_level = board_level;
	}

	public int getBoard_Available() {
		return board_Available;
	}

	public void setBoard_Available(int board_Available) {
		this.board_Available = board_Available;
	}

	
	
	
}
