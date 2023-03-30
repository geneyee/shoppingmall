<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.project.board1.dao.Board1DAO"%>
<%@ page import="com.project.board1.vo.Board1VO"%>
<jsp:useBean id="board1" class="com.project.board1.vo.Board1VO" scope="page" />
<!-- // Bbs bbs = new Bbs(); -->
<jsp:setProperty name="board1" property="board_Title" /><!-- bbs.setBbsTitle(requrst) -->
<jsp:setProperty name="board1" property="board_Content" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
        

        int board_ID = 0;

        if(request.getParameter("board_ID") != null){
        board_ID = Integer.parseInt(request.getParameter("board_ID"));
        }

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
      } else {
         if (board1.getBoard_Title() == null || board1.getBoard_Content() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            Board1DAO Board1DAO = new Board1DAO();
            Board1VO parent = Board1DAO.getBoard1(board_ID);
            Board1DAO.replyupdate(parent);
            int result = Board1DAO.reply(board1.getBoard_Title(), user_id, board1.getBoard_Content(),parent);
            
            if (result == -1) {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('글쓰기에 실패했습니다')");
               script.println("history.back()");
               script.println("</script>");
            } else {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("location.href='setProduct.do'");
               //script.println("history.back()");
               script.println("</script>");
            }
         }
      }
   %>
   
</body>
</html>