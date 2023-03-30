package com.project.comment.service;

import java.sql.SQLException;

import com.project.comment.vo.CommentVO;

public interface CommentService {

	public int commentwrite(int board_ID, String user_id,String comment_board);
	
	

}
