<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.project.user.dao.UserDAO"%>
<%@ page import="com.project.user.vo.UserVO"%>
<jsp:useBean id="vo" class="com.project.user.vo.UserVO" scope="page" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:setProperty name="vo" property="email" />
<jsp:setProperty name="vo" property="email1" />
<jsp:setProperty name="vo" property="user_id" />
<jsp:setProperty name="vo" property="pwd" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

String email = null;
if (session.getAttribute("email") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
	email = (String) session.getAttribute("email");//유저아이디에 해당 세션값을 넣어준다.
}
String email1 = null;
if (session.getAttribute("email1") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
	email1 = (String) session.getAttribute("email");//유저아이디에 해당 세션값을 넣어준다.
}
String user_id = null;
if (session.getAttribute("user_id") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
	user_id = (String) session.getAttribute("user_id");//유저아이디에 해당 세션값을 넣어준다.
}
      
		UserDAO userDAO = new UserDAO();
		UserVO result = userDAO.pwsearch(vo);
		
	
		
		
		if(result == null){ %>
	<script>
			alert('회원정보가 존재하지 않습니다.');
			history.go(-1);
		</script>

	<%
		} else {
		%>
	<script>
		alert('회원님의 비밀번호는  ${userpw.pwd} 입니다.');
		window.close();
		</script>


	<% }%>



</body>
</html>