package com.project.order.vo;

import java.util.Date;

public class OrderVO {
	private String orderId;
	private String user_Id;
	private String orderRec;
	private String address;
	private String address1;
	private String address2;
	private String orderPhon;
	private int tot;
	private Date orderDate;
	public String getOrderId() {
		return orderId;
	}
	
	public OrderVO(String orderId, String orderRec, String address, String address1, String address2,
			String orderPhon) {
		super();
		this.orderId = orderId;
		this.orderRec = orderRec;
		this.address = address;
		this.address1 = address1;
		this.address2 = address2;
		this.orderPhon = orderPhon;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getOrderPhon() {
		return orderPhon;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	public int gettot() {
		return tot;
	}
	public void settot(int tot) {
		this.tot = tot;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
