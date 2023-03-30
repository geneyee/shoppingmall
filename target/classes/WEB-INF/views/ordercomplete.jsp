<%@page import="com.project.order.vo.OrderVO"%>
<%@page import="com.project.shop.dao.ShopDAO"%>
<%@page import="com.project.shop.vo.ShopVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
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
      ShopDAO shopdao= new ShopDAO();
      shopdao.updateProduct(request, response);
      shopdao.cartAllDelete(user_id);
      
      /*  if(b1 == 0){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('재고가 부족합니다')");
         script.println("history.back()");
         script.println("</script>");
      } else if(b1 == 1){
         
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('주문이 완료 되었습니다')");
         script.println("location.href='main.do'");
         script.println("</script>");
         shopdao.cartAllDelete(user_id);
      }else if( b1==-1){
         PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('장바구니가 비어있습니다')");
          script.println("history.back()");
          script.println("</script>");
      }  */
%>
      
      
      
      
</body>
</html>