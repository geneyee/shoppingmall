<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.project.comment.dao.CommentDAO"%>
<%@ page import="com.project.comment.vo.CommentVO"%>
<%@ page import="com.project.board.dao.BoardDAO"%>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="comment" class="com.project.comment.vo.CommentVO" scope="page" />
<jsp:setProperty name="comment" property="comment_board" />
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		String user_id = null;
		if (session.getAttribute("user_id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			user_id = (String) session.getAttribute("user_id");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		
		int comment_id = 0;
		if (request.getParameter("commnet_id") != null) {
	        comment_id = Integer.parseInt(request.getParameter("comment_id"));
	        }
		
		int board_ID = 0;
		if (request.getParameter("board_ID") != null) {
	        board_ID = Integer.parseInt(request.getParameter("board_ID"));
	        }
		
		String comment_board = null;
		if (session.getAttribute("comment_board")!= null){
			comment_board = (String) session.getAttribute("comment_board");
		}
		
		String comment_date = null;
		if (session.getAttribute("comment_date")!= null){
			comment_date = (String) session.getAttribute("comment_date");
		}
		
		/* CommentDAO commentDAO = new CommentDAO();
		ArrayList <CommentVO> commentlist = commentDAO.getList(board_ID); */
	
		if (user_id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���.')");
			script.println("location.href = 'loginForm.do'");
			script.println("</script>");
		} else {
			if (comment.getComment_board() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				CommentDAO CommentDAO = new CommentDAO();
				int result = CommentDAO.commentwrite(board_ID, user_id, comment.getComment_board());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('��۾��⿡ �����߽��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='board.do'");
					//script.println("history.back()");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>