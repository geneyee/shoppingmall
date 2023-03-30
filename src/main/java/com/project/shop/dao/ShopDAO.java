package com.project.shop.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.project.dbconn.DBConn;
import com.project.shop.vo.ShopVO;


@Repository
public class ShopDAO {
   private Connection con;
   PreparedStatement pstmt=null;
   PreparedStatement pstmt2=null;
   ResultSet rs = null;
   ResultSet rs2 = null;
   
   public ShopDAO() throws ClassNotFoundException, SQLException {
      con = new DBConn().getConnection();
   }
   public void pstmtClose() throws SQLException {
      if(pstmt!=null)
         pstmt.close();
   }
   public void pstmt2Close() throws SQLException {
	      if(pstmt2!=null)
	         pstmt2.close();
	   }
   public void getAllInfoClose() throws SQLException {
      
      if (rs != null)
         rs.close();
      
      if (rs2 != null)
          rs2.close();
      
      if (pstmt != null)
         pstmt.close();
     
      if (pstmt2 != null)
          pstmt2.close();
      
      if (con != null)
         con.close();
   }
   
   //카트占쏙옙占�
   public void addCart(HttpServletRequest request) throws SQLException {
	      String pname = request.getParameter("product_name");
	      String poption = request.getParameter("poption");
	      String user_id = request.getParameter("user_id");
	      int cnt = Integer.parseInt(request.getParameter("cnt"));
	      int price3= Integer.parseInt(request.getParameter("price3"));
	      int price = cnt * price3;
	      int pid = 0;
	      if(poption.equals("beige-S")) pid=1;
	          else if(poption.equals("beige-L")) pid=2;
	          else if(poption.equals("black-S")) pid=3;
	          else if(poption.equals("black-L")) pid=4;
	          else if(poption.equals("khaki-S")) pid=5;
	          else if(poption.equals("khaki-L")) pid=6;
	      String sql2 = "SELECT * FROM basket WHERE poption=? and user_id = ?";
	      pstmt=con.prepareStatement(sql2);
	      pstmt.setString(1, poption);
	      pstmt.setString(2, user_id);
	      rs = pstmt.executeQuery();
	      
	       
	       if(rs.next()) {
	          
	          if(pname.equals(rs.getString("pname")) && poption.equals(rs.getString("poption"))) {
	            // String sql3 = "UPDATE basket SET cnt=?,price=? WHERE pname = ? and poption=?";
	            pstmt=con.prepareStatement("UPDATE basket SET cnt=?,price=? WHERE pname = ? and poption=?");
	            pstmt.setInt(1,rs.getInt("cnt")+cnt);
	            pstmt.setInt(2,(rs.getInt("cnt")+cnt)*price3);
	            pstmt.setString(3,pname);
	            pstmt.setString(4,poption);
	            rs = pstmt.executeQuery();
	          }     
	       } else if(!rs.next()) {
	          String sql = "INSERT INTO basket VALUES (?,?,?,?,?,?)";
	          pstmt=con.prepareStatement(sql);
	          pstmt.setString(1, pname);
	          pstmt.setString(2, poption);
	          pstmt.setInt(3, cnt); 
	          pstmt.setInt(4, price);
	          pstmt.setString(5, user_id);
	          pstmt.setInt(6,pid);
	          pstmt.executeUpdate();
	          
	         
	       } 
	 }
   public int getNext() { 

	      String SQL = "SELECT pid FROM product1 ORDER BY pid DESC";
	      try {
	         PreparedStatement pstmt = con.prepareStatement(SQL);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            return rs.getInt(1) + 1;
	         }
	         return 1;
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return -1;
	   }

   public void addProduct(HttpServletRequest request) throws SQLException { 
      String pname = request.getParameter("pname");
      String poption = request.getParameter("poption");
      int cnt = Integer.parseInt(request.getParameter("cnt"));
      int price= Integer.parseInt(request.getParameter("price"));
          
         String sql2 = "SELECT * FROM product1 order by pid";
         pstmt=con.prepareStatement(sql2);
         rs = pstmt.executeQuery();
          if(rs.next()) {
             if(pname.equals(rs.getString("pname")) && poption.equals(rs.getString("poption"))) {
                String sql = "UPDATE product1 SET cnt=?,price=? WHERE pname =? and poption=?";
                   pstmt=con.prepareStatement(sql);
                   pstmt.setInt(1, cnt+rs.getInt("cnt"));
                   pstmt.setInt(2, price);
                   pstmt.setString(3, pname);
                   pstmt.setString(4, poption); 
                   System.out.println("겹침");
                   pstmt.executeUpdate();
                   
             }else {
                String sql = "INSERT INTO product1 VALUES (?,?,?,?,?)";
                   pstmt=con.prepareStatement(sql);
                   pstmt.setInt(1, getNext());
                   pstmt.setString(2, pname);
                   pstmt.setString(3, poption); 
                   pstmt.setInt(4, cnt);
                   pstmt.setInt(5, price);
                   System.out.println(pname);
                   System.out.println("있는데 안겹침");
                   pstmt.executeUpdate();
             }
                
          }else {
             String sql = "INSERT INTO product1 VALUES (1,?,?,?,?)";
                pstmt=con.prepareStatement(sql);
                //pstmt.setInt(1, getNext());
                pstmt.setString(1, pname);
                pstmt.setString(2, poption); 
                pstmt.setInt(3, cnt);
                pstmt.setInt(4, price);
                System.out.println("없음");
                pstmt.executeUpdate();
          }
    }


   public ArrayList<ShopVO> Cart_list() throws SQLException{  
      ArrayList<ShopVO> tiarray = new ArrayList<ShopVO>(); 
      String sql = "SELECT * FROM basket"; 
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) { 
         if(rs.getInt("cnt")>0) {
           String pname = rs.getString("pname");
           String poption = rs.getString("poption");
           int cnt = rs.getInt("cnt");
           int price = rs.getInt("price");
           ShopVO bv = new ShopVO(pname,poption,cnt,price); 
           tiarray.add(bv);
         }
      }               
      return tiarray;      
   }

   public ArrayList<ShopVO> Product_list() throws SQLException{   
      ArrayList<ShopVO> tiarray = new ArrayList<ShopVO>(); 
      String sql = "SELECT * FROM product1 order by pid ASC"; 
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
    	int pid =rs.getInt("pid");
        String pname = rs.getString("pname");
        String poption = rs.getString("poption");
        int cnt = rs.getInt("cnt");
        int price = rs.getInt("price");
        ShopVO bv = new ShopVO(pid,pname,poption,cnt,price); 
        tiarray.add(bv);
      }               
      return tiarray;      
   }
   
  //카트占쏙옙占쏙옙
   public void updateCart(ShopVO vo,HttpServletRequest request)throws SQLException{

	      String sql = "UPDATE basket SET cnt=?, price=? WHERE poption=?";
	      pstmt=con.prepareStatement(sql);
	     
	      String pname = request.getParameter("product_name");
	      String poption2 = request.getParameter("poption3");
	      int cnt = Integer.parseInt(request.getParameter("cnt"));
	      int price3 = Integer.parseInt(request.getParameter("price3"));
	      int price = cnt * price3;
	      
	      pstmt.setInt(1, cnt); 
	      pstmt.setInt(2, price);
	      pstmt.setString(3, poption2);
	      System.out.println(poption2);
	      pstmt.executeUpdate();
	      System.out.println("update 占싹뤄옙2");
	    
	     
	}
   public void updateProduct(HttpServletRequest request,HttpServletResponse response)throws SQLException, Exception{
       String sql3="SELECT * FROM product1";
       pstmt=con.prepareStatement(sql3);
        rs = pstmt.executeQuery();
        String poptionaaa;
        int cntaaa = 0;
     if(rs.next()) {
        poptionaaa = rs.getString("poption");
       cntaaa = rs.getInt("cnt");
       rs.close(); pstmt.close();
     }
     System.out.println(cntaaa);
     
     
     
       String sql2 = "SELECT * FROM basket";
        pstmt=con.prepareStatement(sql2);
        rs = pstmt.executeQuery();
        while(rs.next()) {
           
          
            String poption = rs.getString("poption");
            int cnt = rs.getInt("cnt");
            System.out.println(poption);
            System.out.println(cnt);
            
            if(cntaaa >= cnt) {
           String sql = "UPDATE product1 SET cnt=cnt-? WHERE poption=?";
          pstmt=con.prepareStatement(sql);
          pstmt.setInt(1, cnt); 
          pstmt.setString(2, poption);
          pstmt.executeUpdate();
          PrintWriter script = response.getWriter();
         /* script.println("<script>");
          script.println("alert('주문이 완료 되었습니다')");
          script.println("location.href='main.do'");
          script.println("</script>");*/
            } else if (cntaaa < cnt) {
               PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('재고가 부족합니다')");
                script.println("location.href='orderForm.do'");
                script.println("</script>");
            }
        
       }
    
   } 
   public ShopVO OneCart(String pname2)throws SQLException{
	  String sql = "SELECT * FROM basket where pname=?";
	  pstmt=con.prepareStatement(sql);
      pstmt.setString(1,pname2);
      rs = pstmt.executeQuery();
      ShopVO vv=null;
      if(rs.next()) {
          String pname = rs.getString("pname");
          String poption = rs.getString("poption");
          int cnt = rs.getInt("cnt");
          int price = rs.getInt("price3");
          vv = new ShopVO(pname,poption,cnt,price); 
      }
      else
    	  vv=null;
	return vv;
   }
   

   public void deleteCart(ShopVO vo) throws SQLException{
      String sql = "DELETE from basket where pname=? and poption=?";

         pstmt=con.prepareStatement(sql);
         pstmt.setString(1,vo.getPname());
         pstmt.setString(2,vo.getPoption());
         pstmt.executeUpdate();
         
         
         System.out.println(vo.getPname());
   }

   public void deleteProduct(ShopVO vo) throws SQLException{
      String sql = "DELETE from product1 where pname=? and poption=?";

         pstmt=con.prepareStatement(sql);
         pstmt.setString(1,vo.getPname());
         pstmt.setString(2,vo.getPoption());
         pstmt.executeUpdate();
         
         
         System.out.println(vo.getPname());
   }
   
 
   public void orderInfo(String orderId,String orderRec,String address,String address1,String address2,String orderPhon,int tot)throws Exception{
	    String sql = "insert into order2 values (?,?,?,?,?,?,?,sysdate)";
	    pstmt=con.prepareStatement(sql);
		pstmt.setString(1,orderId);
		pstmt.setString(2,orderRec);
		pstmt.setString(3,address);
		pstmt.setString(4,address1);
		pstmt.setString(5,address2);
		pstmt.setString(6,orderPhon);
		pstmt.setInt(7,tot);
		pstmt.executeUpdate();
		

   }
  
   public void cartAllDelete(String user_id) throws Exception{
	      String sql = "DELETE from basket where user_id=?";

	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1,user_id);
	         pstmt.executeUpdate();
   }
	public void admin_updateProduct(HttpServletRequest request) throws SQLException {

	      String sql = "UPDATE product1 SET cnt=?, price=? WHERE pname=? and poption=?";
	      pstmt=con.prepareStatement(sql);
	      String pname = request.getParameter("pname");
	      String poption = request.getParameter("poption");
	      int cnt = Integer.parseInt(request.getParameter("cnt"));
	      int price = Integer.parseInt(request.getParameter("price"));
	      
	      pstmt.setInt(1, cnt); 
	      pstmt.setInt(2, price);
	      pstmt.setString(3, pname.toString());
	      pstmt.setString(4, poption);
	      System.out.println(cnt);
	      System.out.println(price);
	      System.out.println(pname.toString());
	      System.out.println(price);
	      pstmt.executeUpdate();
	    
		
	}
}
