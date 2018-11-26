package com.gcu.yishu.order.pojos;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.gcu.yishu.user.pojos.User;

public class Order {
	/*
	 * 
	 */
	private Integer Order_Id;//
	private Date CreateTime;//
	private Integer IsitPay;//
	private Integer Isitarrive;//
	private Integer IsitOnline;//
	private Integer Pro_sum;//

	private User user;//

	private Set<OrderItem> orderItems = new HashSet<OrderItem>();//订单项集合
	
	public Order(){super();};
	
	public void setOrder(Date createTime, Integer isitPay, Integer isitarrive, 
			Integer isitOnline, Integer pro_sum, User user)
	{
		this.CreateTime = createTime;
		this.IsitPay = isitPay;
		this.Isitarrive = isitarrive;
		this.IsitOnline = isitOnline;
		this.Pro_sum = pro_sum;
		this.user = user;
	}

	public Integer getOrder_Id() {
		return Order_Id;
	}

	public void setOrder_Id(Integer order_Id) {
		Order_Id = order_Id;
	}

	public Date getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(Date createTime) {
		CreateTime = createTime;
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
	
	public Integer getPro_sum() {
		return Pro_sum;
	}

	public void setPro_sum(Integer pro_sum) {
		Pro_sum = pro_sum;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
}