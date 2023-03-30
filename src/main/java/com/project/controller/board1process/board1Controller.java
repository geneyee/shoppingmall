package com.project.controller.board1process;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.board1.service.Board1Service;


@Controller
public class board1Controller {

	@Resource(name="Board1Service")
	private Board1Service board1Service;
	
	@RequestMapping(value="/board1.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String board(){
		return "Q&Aboard"; // 게시판.jsp 이동
	}
	
	@RequestMapping(value="/writeAction1.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String writeAction(){
		return "writeAction1"; //실제 글쓰기
	}
	
	@RequestMapping(value="/view1.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String view(){
		return "view1"; // 게시글보기.jsp 이동
	}
	
	@RequestMapping(value="/boardwrite1.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String writeForm(){
		return "write1"; // 글쓰기 화면
	}
	@RequestMapping(value="/updateForm1.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String loginForm(){
		return "boardupdateForm1"; //로그인.jsp 이동
	}
	
	
	@RequestMapping(value = "/delete1.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String delete(int board_ID) {		
		
		//board1Service.delete(board_ID);
			
		return "boarddelete1";
	}
	
	@RequestMapping(value = "/update1.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String update1(int board_ID, String board_Title, String board_Content) {		
		
		board1Service.update1(board_ID, board_Title, board_Content);
			
		return "boardupdate1";
	}
	
	@RequestMapping(value="/refForm.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String refForm(){
		return "refForm"; //로그인.jsp 이동
	}
	
	@RequestMapping(value="/refAction.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String refAction(){
		return "refAction"; //로그인.jsp 이동
	}
	
	
}
