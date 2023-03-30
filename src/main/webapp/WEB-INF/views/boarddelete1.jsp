<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.board1.dao.Board1DAO"%>
<%@ page import="com.project.board1.vo.Board1VO"%>
<%@ page import="java.io.PrintWriter"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
      String user_id = null;
      if (session.getAttribute("user_id") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
         user_id = (String) session.getAttribute("user_id");//유저아이디에 해당 세션값을 넣어준다.
      }

      if (user_id == null) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('로그인을 하세요.')");
         script.println("location.href = 'loginForm.do'");
         script.println("</script>");
      } 

      int board_ID = 0;

      if(request.getParameter("board_ID") != null){
         board_ID = Integer.parseInt(request.getParameter("board_ID"));
      }
      
      if(board_ID == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않은 글 입니다')");
         script.println("location.href='setProduct.do'"); 
         script.println("</script>");
      }

      Board1VO board = new Board1DAO().getBoard1(board_ID);

      if(!user_id.equals(board.getUser_id())) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('권한이 없습니다')");
         script.println("location.href='setProduct.do'");
         script.println("</script>");         
      }
      else{
         Board1DAO boardDAO = new Board1DAO();
         int result = boardDAO.delete(board_ID);
         if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('글 삭제에 실패했습니다')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href='setProduct.do'");
            script.println("</script>");
         }
      }
   %>
</body>
</html>