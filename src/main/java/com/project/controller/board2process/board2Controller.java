package com.project.controller.board2process;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.board2.service.Board2Service;



@Controller
public class board2Controller {

	@Resource(name="Board2Service")
	private Board2Service boardService;
	
	@RequestMapping(value="/board2.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String board(){
		return "noticeboard"; // 공지사항게시판.jsp 이동
	}
	
	@RequestMapping(value="/writeAction2.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String writeAction(){
		return "writeAction2"; // 공지사항게시판 글쓰기
	}
	
	@RequestMapping(value="/view2.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String view(){
		return "view2"; // 공지사항게시판 글보기.jsp로 이동
	}
	
	@RequestMapping(value="/board2write.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String writeForm(){
		return "write2"; // 공지사항게시판 글쓰기 화면
	}
	
	
	
	@RequestMapping(value="/updateForm2.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String board2updateForm(){
		return "boardupdateForm2"; 
	}
	
	
	@RequestMapping(value = "/delete2.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String delete(int board_ID) {		
		
		/*boardService.delete(board_ID);*/
			
		return "boarddelete2";
	}
	
	@RequestMapping(value = "/update2.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String update(int board_ID, String board_Title, String board_Content) {		
		
		boardService.update(board_ID, board_Title, board_Content);
			
		return "boardupdate2";
	}
	
	
}
