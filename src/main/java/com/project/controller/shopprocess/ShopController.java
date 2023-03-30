package com.project.controller.shopprocess;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.shop.service.ShopService;
import com.project.shop.vo.ShopVO;
import com.project.user.service.UserService;
import com.project.user.vo.UserVO;

@Controller
public class ShopController {

	@Resource(name="ShopService")
	private ShopService shopService;
	
	/*@RequestMapping(value="/", method= {RequestMethod.POST,RequestMethod.GET})
	public String main() {
		return "addCart";
	}*/
	
		//카트담기
	   @RequestMapping(value = "/addCart.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String addCart(HttpServletRequest request) throws SQLException {      
	      shopService.addCart(request);
	      return "addCart";
	   }
	   //관리자-상품추가폼
	   @RequestMapping(value = "/addProductForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String addProductForm() throws SQLException {  
	      return "Admin_addproduct";
	   }
	   @RequestMapping(value = "/admin_addProduct.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String admin_addProduct(HttpServletRequest request) throws SQLException {  
		  shopService.addProduct(request);
	      return "Admin_product";
	   }
	   @RequestMapping(value = "/deleteProductForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String deleteProductForm() throws SQLException {  

	      return "Admin_deleteproduct";
	   }
	   @RequestMapping(value = "/admin_deleteProduct.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String admin_deleteProduct(ShopVO vo) throws SQLException {  
		  shopService.deleteProduct(vo);
	      return "Admin_product";
	   }
	   @RequestMapping(value = "/updateProductForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String updateProductForm() throws SQLException {  
	      return "Admin_updateproduct";
	   }
	   @RequestMapping(value = "/admin_updateProductForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String admin_updateProductForm(HttpServletRequest request) throws SQLException {  
		/*  shopService.admin_updateProduct(request);*/
	      return "Admin_updateproductForm";
	   }@RequestMapping(value = "/admin_updateProduct.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String admin_updateProduct(HttpServletRequest request) throws SQLException {  
		  shopService.admin_updateProduct(request);
	      return "Admin_product";
	   }
	   
	   //카트목록
	   @RequestMapping(value = "/Cart_list.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String Cart_list(ShopVO vo) throws SQLException {      
	      shopService.Cart_list();
	      return "cartForm";
	   }
	   //카트한개
	   @RequestMapping(value = "/Cart_oneForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String Cart_oneForm(String pname2) throws SQLException {  
		  shopService.OneCart(pname2);
	      return "Cart_one";
	   }
	   
	   @RequestMapping(value = "/updateCartForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String updateCartForm(String pname2) throws SQLException {        
		   return "updateCartForm";
	   }
		 //카트수정
	   @RequestMapping(value = "/updateCart.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String updateCart(ShopVO vo,HttpServletRequest request) throws SQLException {     
	      shopService.updateCart(vo,request);
	      
	      return "cartForm";
	   }
	   
	   //카트삭제
	   @RequestMapping(value = "/deleteCart.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String deleteCart(ShopVO vo) throws SQLException {      
	      shopService.deleteCart(vo);
	      return "cartForm";
	   }
	 
	   @RequestMapping(value = "/deleteCartForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String deleteCartForm() {      
	      return "deleteCartForm";
	   }
	   
	   @RequestMapping(value = "/orderForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String orderForm() throws Exception {      
		   return "order";
	   }
	   
	   @RequestMapping(value = "/cartAllDelete.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String cartAllDelete(String user_id) throws Exception {      
		   shopService.cartAllDelete(user_id);
		   return "order";
	   }
	   
	   @RequestMapping(value = "/order.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String order(String orderRec,String address,String address1,String address2,String orderPhon,int tot) throws Exception {
		   
		   /*UserVO user = (UserVO)session.getAttribute("user");  
		   String user_id = user.getUser_id();*/
		   
		   Calendar cal = Calendar.getInstance();
		   int year = cal.get(Calendar.YEAR);
		   String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		   String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		   String subNum = "";
		   
		   for(int i = 1; i <= 6; i ++) {
		    subNum += (int)(Math.random() * 10);
		   }
		   
		   String orderId = ymd + "_" + subNum;
		   return "ordercomplete";
	   }
}
