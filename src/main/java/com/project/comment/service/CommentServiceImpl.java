package com.project.comment.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.comment.dao.CommentDAO;
import com.project.comment.vo.CommentVO;


@Service("CommentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;

	@Override
	public int commentwrite(int board_ID, String user_id, String comment_board) {
		// TODO Auto-generated method stub
		return commentDAO.commentwrite(board_ID, user_id, comment_board);
	}
	
	

	
	
	
	
	
	

}
