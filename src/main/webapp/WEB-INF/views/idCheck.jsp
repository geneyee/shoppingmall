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
		<b><font color="red"><%= user_id %></font>�� �̹� ������� ���̵��Դϴ�.</b>
		<form name="checkForm" method="post" action="registerCheck.do">
		<b>�ٸ� ���̵� �Է��Ͻÿ�.</b><br /><br />
		<input type="text" name="user_id"/>
		<input type="submit" value="ID�ߺ�Ȯ��"/>
		</form>
		<%
		} else {
		%> <center>
		<b>�Է��Ͻ� <font color="red"><%=user_id %></font>��<br />
		����Ͻ� �� �ִ� ID�Դϴ�.</b><br /><br />
		<input type="button" value="�ݱ�" onclick="setid()"/></center>	
		<% }%>
	
<script language="javascript">
function setid(){
	opener.document.userinput.user_id.value="<%=user_id%>";
	self.close();
}
</script>		
</body>
</html>