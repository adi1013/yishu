package com.gcu.yishu.pojos;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 **用户类
 * @param
 * @return
 * */
public class User implements Serializable {
	private Integer Id;//序号
	private String stu_No;//学号
	private String password;//密码
	private String MobilePhone;//手机号码
	private String Grade;//年级
	private String Major;//专业
	private String TrueName;//真实姓名
	private Integer SuccessNum;//成功订单数
	private Set<Product> products=new HashSet<Product>(0);//一对多映射product
	private Set<Order> Orders=new HashSet<Order>(0);//一对多映射Order
	
	public User() {
		
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getStu_No() {
		return stu_No;
	}

	public void setStu_No(String stu_No) {
		this.stu_No = stu_No;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobilePhone() {
		return MobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		MobilePhone = mobilePhone;
	}

	public String getGrade() {
		return Grade;
	}

	public void setGrade(String grade) {
		Grade = grade;
	}

	public String getMajor() {
		return Major;
	}

	public void setMajor(String major) {
		Major = major;
	}

	public String getTrueName() {
		return TrueName;
	}

	public void setTrueName(String trueName) {
		TrueName = trueName;
	}

	public Integer getSuccessNum() {
		return SuccessNum;
	}

	public void setSuccessNum(Integer successNum) {
		SuccessNum = successNum;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public Set<Order> getOrders() {
		return Orders;
	}

	public void setOrders(Set<Order> orders) {
		Orders = orders;
	}
	

}
