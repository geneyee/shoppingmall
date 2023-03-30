package com.project.shop.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.dao.ShopDAO;
import com.project.shop.vo.ShopVO;

@Service("ShopService")
public class ShopServiceImpl implements ShopService{
   
   @Autowired
   private ShopDAO shopDAO;
   
   @Override
   public void addCart(HttpServletRequest request) throws SQLException {
      // TODO Auto-generated method stub
      shopDAO.addCart(request);
   }

   @Override
   public ArrayList<ShopVO> Cart_list() throws SQLException {
      // TODO Auto-generated method stub
      return shopDAO.Cart_list();
   }
   
	@Override
	public ShopVO OneCart(String pname2) throws SQLException {
		// TODO Auto-generated method stub
		return shopDAO.OneCart(pname2);
	}

    @Override
    public void deleteCart(ShopVO vo) throws SQLException {
       // TODO Auto-generated method stub
       shopDAO.deleteCart(vo);
    }
	
    @Override
    public void updateCart(ShopVO vo,HttpServletRequest request) throws SQLException {
       // TODO Auto-generated method stub
       shopDAO.updateCart(vo,request);
    }
    @Override
	public void orderInfo(String orderId,String orderRec,String address,String address1,String address2,String orderPhon,int tot) throws Exception {
		// TODO Auto-generated method stub
		shopDAO.orderInfo(orderId,orderRec,address,address1,address2,orderPhon,tot);
	}

	/*@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		// TODO Auto-generated method stub
		shopDAO.orderInfo_Details(orderDetail);
	}*/
	
	@Override
	public void cartAllDelete(String user_id) throws Exception {
		shopDAO.cartAllDelete(user_id);
	}

	@Override
	public void addProduct(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		shopDAO.addProduct(request);
	}

	@Override
	public void deleteProduct(ShopVO vo) throws SQLException {
		// TODO Auto-generated method stub
		shopDAO.deleteProduct(vo);
		
	}

	@Override
	public void admin_updateProduct(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		shopDAO.admin_updateProduct(request);
	}

}
