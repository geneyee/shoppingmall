package com.project.shop.vo;

public class ShopVO {
	private int pid;
	private String pname;
	private String poption;
	private int cnt;
	private int price;
	
	public ShopVO() {
		super();
	}


	public ShopVO(String pname, String poption, int cnt, int price) {
		// TODO Auto-generated constructor stub
		super();
		this.pname=pname;
		this.poption=poption;
		this.cnt=cnt;
		this.price=price;
	}

	public ShopVO(int pid, String pname, String poption, int cnt, int price) {
		// TODO Auto-generated constructor stub
		super();
		this.pid=pid;
		this.pname=pname;
		this.poption=poption;
		this.cnt=cnt;
		this.price=price;
	}


	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getPoption() {
		return poption;
	}


	public void setPoption(String poption) {
		this.poption = poption;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
	
	

}
