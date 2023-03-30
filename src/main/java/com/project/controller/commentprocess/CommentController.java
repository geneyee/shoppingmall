package com.project.controller.commentprocess;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.comment.service.CommentService;
import com.project.comment.vo.CommentVO;

@Controller
public class CommentController {

	@Resource(name="CommentService")
	private CommentService commentService;
	
	//´ñ±Û¾²±â
		@RequestMapping(value = "/commentwrite.do", method= {RequestMethod.POST,RequestMethod.GET})
		public String commentwrite(String board_comment) {		
			
			return "commentwriteAction";//loginForm.jsp;
		}
}
