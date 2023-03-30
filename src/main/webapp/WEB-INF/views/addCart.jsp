<%@page import="com.project.order.vo.OrderVO"%>
<%@page import="com.project.shop.dao.ShopDAO"%>
<%@page import="com.project.shop.vo.ShopVO"%>
<%@page import="java.util.ArrayList"%>
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
			String user_id = null;
			if(session.getAttribute("user_id") != null){
				user_id = (String) session.getAttribute("user_id");
			}
		%>
		  <% if(user_id == null){%> 
				<script>alert("로그인 후 서비스를 이용하실수 있습니다"); location.href = "loginForm.do";</script>
                    
          <% } %>
		 <%
		 	int cnt = Integer.parseInt(request.getParameter("cnt")); 
		 	if(cnt<=0){%>
		 		<script>alert("상품 수량을 다시 설정해주세요"); history.back();</script>
		 <%} %>
		
		<%if(cnt>0) {%>
		<script>alert("상품이 장바구니에 추가 되었습니다."); 
		location.href = "main.do";
		</script>
		<%} %>
		
</body>
</html>