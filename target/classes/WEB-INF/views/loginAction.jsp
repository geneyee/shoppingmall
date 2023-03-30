<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.user.dao.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->    
<jsp:useBean id="user" class="com.project.user.vo.UserVO" scope="page" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="pwd" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
       String user_id = null;
	   if(session.getAttribute("userID") != null){
		   user_id = (String) session.getAttribute("user_id");
	   }
	   if(user_id != null){
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('이미 로그인이 되어있습니다.')");
		   script.println("location.href='index2.jsp'");
		   script.println("</script>");
	   }
	
		UserDAO userDAO = new UserDAO(); //인스턴스생성
		int result = userDAO.login(user.getUser_id(), user.getPwd());
		

		//로그인 성공
		if(result == 1){
			session.setAttribute("user_id", user.getUser_id()); 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.do'");
			script.println("</script>");
		}
		
		//로그인 실패
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}

		//아이디 없음

		else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");

		}

		//DB오류

		else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}		
	%>
</body>
</html>