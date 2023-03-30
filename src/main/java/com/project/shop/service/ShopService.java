package com.project.shop.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.shop.vo.ShopVO;




public interface ShopService {
   //īƮ���
   public void addCart(HttpServletRequest request) throws SQLException;

   //īƮ���
   public ArrayList<ShopVO> Cart_list() throws SQLException;
  
   //�Ѱ����
   public ShopVO OneCart(String pname)throws SQLException;
   
   //īƮ����
   public void deleteCart(ShopVO vo) throws SQLException;
   
   //īƮ����
   public void updateCart(ShopVO vo,HttpServletRequest request)throws SQLException;
   
   //�ֹ�����
   public void orderInfo(String orderId,String orderRec,String address,String address1,String address2,String orderPhon,int tot)throws Exception;
   
  /* //�ֹ�������
   public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;*/
  
   //īƮ �������
   public void cartAllDelete(String user_id) throws Exception;
   
   public void addProduct(HttpServletRequest request) throws SQLException ;

   public void deleteProduct(ShopVO vo) throws SQLException ;
   
   public void admin_updateProduct(HttpServletRequest request) throws SQLException ;
   
}