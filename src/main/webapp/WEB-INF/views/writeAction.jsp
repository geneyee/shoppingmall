<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.project.board.dao.BoardDAO"%>
<jsp:useBean id="board" class="com.project.board.vo.BoardVO" scope="page" />
<!-- // Bbs bbs = new Bbs(); -->
<jsp:setProperty name="board" property="board_Title" /><!-- bbs.setBbsTitle(requrst) -->
<jsp:setProperty name="board" property="board_Content" />    
<jsp:setProperty name="board" property="board_file" />
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
      } else {
         if (board.getBoard_Title() == null || board.getBoard_Content() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            BoardDAO BoardDAO = new BoardDAO();
            int result = BoardDAO.write(board.getBoard_Title(), user_id, board.getBoard_Content(),board.getBoard_file());
            if (result == -1) {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('글쓰기에 실패했습니다')");
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