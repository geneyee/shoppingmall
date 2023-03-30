<%@page import="com.project.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserDAO userDAO = new UserDAO();
	//로그인 한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
	String user_id = (String) session.getAttribute("user_id");
	String pwd = request.getParameter("pwd");

	//1=탈퇴성공 0=비번틀림 -1=아이디X
	int check = new UserDAO().deleteAccount(user_id, pwd);
	
	if(check==1){
		session.invalidate();//세션정보삭제 %>
		<script>
		alert("탈퇴하셨습니다.");
		window.close();
   		/* location.href = "loginForm.do"; */
		</script>


	<% }
		else{%>
		<script >
			alert("비밀번호가 맞지않습니다.");
			history.go(-1);//뒤로가기
		</script>		
	<% }%>
</body>3
</html>