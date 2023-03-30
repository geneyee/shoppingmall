package com.project.user.vo;

public class UserVO {
	
	private String user_id;
	private String name;
	private String pwd;
	private String tel;
	private String tel1;
	private String tel2;
	private String email;
	private String email1;
	private String address;
	private String address1;
	private String address2;
	private int user_point;
	private int verify;
	
	public UserVO() {
		
	}

	public UserVO(String user_id, String name, String pwd, String tel, String tel1, String tel2, String email,
			String email1, String address, String address1, String address2, int user_point, int verify) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.pwd = pwd;
		this.tel = tel;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.email = email;
		this.email1 = email1;
		this.address = address;
		this.address1 = address1;
		this.address2 = address2;
		this.user_point = user_point;
		this.verify = verify;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
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

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}

	
	
}
