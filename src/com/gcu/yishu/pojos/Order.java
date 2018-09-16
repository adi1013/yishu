package com.gcu.yishu.pojos;

import java.util.Date;

public class Order {
	
	private Integer OrderId;//订单编号
	private Date Create_time;//订单生成时间
	/**
	 *  以下三个属性均默认为0
	 * */
	private Integer IsitPay;//订单支付状态
	private Integer Isitarrive;//订单交付状态
	private Integer IsitOnline;//是否通过线上交易
	/*  订单与用户关系应当是多对一*/
	private User user;//所属用户
	/*商品信息一对一关联所存在的商品*/
	private Product product;//商品信息
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getOrderId() {
		return OrderId;
	}

	public void setOrderId(Integer orderId) {
		OrderId = orderId;
	}

	public Date getCreate_time() {
		return Create_time;
	}

	public void setCreate_time(Date create_time) {
		Create_time = create_time;
	}

	public Integer getIsitPay() {
		return IsitPay;
	}

	public void setIsitPay(Integer isitPay) {
		IsitPay = isitPay;
	}

	public Integer getIsitarrive() {
		return Isitarrive;
	}

	public void setIsitarrive(Integer isitarrive) {
		Isitarrive = isitarrive;
	}

	public Integer getIsitOnline() {
		return IsitOnline;
	}

	public void setIsitOnline(Integer isitOnline) {
		IsitOnline = isitOnline;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	

	
}
