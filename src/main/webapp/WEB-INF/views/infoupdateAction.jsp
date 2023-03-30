<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.project.user.dao.UserDAO"%>
<%@page import="com.project.user.vo.UserVO"%>    
<jsp:useBean id="user" class="com.project.user.vo.UserVO" scope="page" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="pwd" />
<jsp:setProperty name="user" property="tel" />
<jsp:setProperty name="user" property="tel1" />
<jsp:setProperty name="user" property="tel2" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="email1" />
<jsp:setProperty name="user" property="address" />
<jsp:setProperty name="user" property="address1" /> 
<jsp:setProperty name="user" property="address2" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserDAO userDAO = new UserDAO();
	String user_id = (String) session.getAttribute("user_id");
	String pwd = request.getParameter("pwd");
	String tel = request.getParameter("tel");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String email = request.getParameter("email");
	String email1 = request.getParameter("email1");
	String address = request.getParameter("address");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");

	boolean b1 = userDAO.infoupdate(pwd, tel, tel1, tel2, email, email1, address, address1, address2, user_id);
			
	if(!b1){%>
		<script>
		alert("회원정보 수정실패");
		history.go(-1);
		</script>
	<% }else{
		session.setAttribute("pwd", user.getPwd());
		session.setAttribute("tel", user.getTel());
		session.setAttribute("tel1", user.getTel1());
		session.setAttribute("tel2", user.getTel2());
		session.setAttribute("email", user.getEmail());
		session.setAttribute("email1", user.getEmail1());
		session.setAttribute("address", user.getAddress());
	%>
		<script>
		alert("회원정보가 수정되었습니다.");
		location.href="mypageForm.do";
		</script>

	<%} %>


</body>
</html>