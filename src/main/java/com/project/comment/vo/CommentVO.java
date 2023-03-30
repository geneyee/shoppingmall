package com.project.comment.vo;

public class CommentVO {
    
	private int comment_id;
	private int board_ID;
	private String user_id;
	private String comment_date;
	private String comment_board;
	
	public CommentVO() {
		
	}

	public CommentVO(int comment_id, int board_ID, String user_id, String comment_date, String comment_board) {
		super();
		this.comment_id = comment_id;
		this.board_ID = board_ID;
		this.user_id = user_id;
		this.comment_date = comment_date;
		this.comment_board = comment_board;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getBoard_ID() {
		return board_ID;
	}

	public void setBoard_ID(int board_ID) {
		this.board_ID = board_ID;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public String getComment_board() {
		return comment_board;
	}

	public void setComment_board(String comment_board) {
		this.comment_board = comment_board;
	}

    
	

	
	
	
}
