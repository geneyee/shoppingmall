<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.project.user.dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
        String user_id = request.getParameter("user_id");

		UserDAO userDAO = new UserDAO();
		int result = userDAO.registerCheck(user_id);
	
		if(result == 0){ %>
		<b><font color="red"><%= user_id %></font>는 이미 사용중인 아이디입니다.</b>
		<form name="checkForm" method="post" action="registerCheck.do">
		<b>다른 아이디를 입력하시오.</b><br /><br />
		<input type="text" name="user_id"/>
		<input type="submit" value="ID중복확인"/>
		</form>
		<%
		} else {
		%> <center>
		<b>입력하신 <font color="red"><%=user_id %></font>는<br />
		사용하실 수 있는 ID입니다.</b><br /><br />
		<input type="button" value="닫기" onclick="setid()"/></center>	
		<% }%>
	
<script language="javascript">
function setid(){
	opener.document.userinput.user_id.value="<%=user_id%>";
	self.close();
}
</script>		
</body>
</html>