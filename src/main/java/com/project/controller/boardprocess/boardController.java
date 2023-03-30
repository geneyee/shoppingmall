package com.project.controller.boardprocess;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.board.service.BoardService;
import com.project.user.vo.UserVO;


@Controller
public class boardController {

	@Resource(name="BoardService")
	private BoardService boardService;
	
	@RequestMapping(value="/updateForm.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String loginForm(){
		return "boardupdateForm"; //로그인.jsp 이동
	}
	
	
	@RequestMapping(value = "/delete.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String delete(int board_ID) {		
		
		/*boardService.delete(board_ID);*/
			
		return "boarddelete";
	}
	
	@RequestMapping(value = "/update.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String update(int board_ID, String board_Title, String board_Content) {		
		
		boardService.update(board_ID, board_Title, board_Content);
			
		return "boardupdate";
	}
	
	
}
