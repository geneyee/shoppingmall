package com.project.shop.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.shop.vo.ShopVO;




public interface ShopService {
   //카트담기
   public void addCart(HttpServletRequest request) throws SQLException;

   //카트목록
   public ArrayList<ShopVO> Cart_list() throws SQLException;
  
   //한개출력
   public ShopVO OneCart(String pname)throws SQLException;
   
   //카트삭제
   public void deleteCart(ShopVO vo) throws SQLException;
   
   //카트수정
   public void updateCart(ShopVO vo,HttpServletRequest request)throws SQLException;
   
   //주문정보
   public void orderInfo(String orderId,String orderRec,String address,String address1,String address2,String orderPhon,int tot)throws Exception;
   
  /* //주문상세정보
   public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;*/
  
   //카트 다지우기
   public void cartAllDelete(String user_id) throws Exception;
   
   public void addProduct(HttpServletRequest request) throws SQLException ;

   public void deleteProduct(ShopVO vo) throws SQLException ;
   
   public void admin_updateProduct(HttpServletRequest request) throws SQLException ;
   
}