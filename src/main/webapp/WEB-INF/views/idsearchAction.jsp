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
if (session.getAttribute("email") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
	email = (String) session.getAttribute("email");//�������̵� �ش� ���ǰ��� �־��ش�.
}
String email1 = null;
if (session.getAttribute("email1") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
	email1 = (String) session.getAttribute("email");//�������̵� �ش� ���ǰ��� �־��ش�.
}
String user_id = null;
if (session.getAttribute("user_id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
	user_id = (String) session.getAttribute("user_id");//�������̵� �ش� ���ǰ��� �־��ش�.
}
      
		UserDAO userDAO = new UserDAO();
		UserVO result = userDAO.idserach(vo);
		
	
	
		
		
		
		if(result == null){ %>
	<script>
		alert('ȸ�������� �������� �ʽ��ϴ�.');
		history.go(-1);
		</script>
	<%
		} else {
		%>
	<script>
		alert('ȸ������ ���̵��  ${ usersss.user_id } �Դϴ�.');
		window.close();
		</script>
	<% }%>



</body>
</html>