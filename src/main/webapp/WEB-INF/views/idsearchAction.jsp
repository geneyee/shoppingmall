<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.project.user.dao.UserDAO"%>
<%@ page import="com.project.user.vo.UserVO"%>
<jsp:useBean id="vo" class="com.project.user.vo.UserVO" scope="page" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- // Bbs bbs = new Bbs(); -->
<jsp:setProperty name="vo" property="email" /><!-- bbs.setBbsTitle(requrst) -->
<jsp:setProperty name="vo" property="email1" />
<jsp:setProperty name="vo" property="user_id" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		UserVO result = userDAO.idserach(vo);
		
	
	
		
		
		
		if(result == null){ %>
	<script>
		alert('회원정보가 존재하지 않습니다.');
		history.go(-1);
		</script>
	<%
		} else {
		%>
	<script>
		alert('회원님의 아이디는  ${ usersss.user_id } 입니다.');
		window.close();
		</script>
	<% }%>



</body>
</html>