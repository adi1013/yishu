package com.gcu.yishu.pojos;

import java.util.Date;

public class Order {
	
	private Integer OrderId;//�������
	private Date Create_time;//��������ʱ��
	/**
	 *  �����������Ծ�Ĭ��Ϊ0
	 * */
	private Integer IsitPay;//����֧��״̬
	private Integer Isitarrive;//��������״̬
	private Integer IsitOnline;//�Ƿ�ͨ�����Ͻ���
	/*  �������û���ϵӦ���Ƕ��һ*/
	private User user;//�����û�
	/*��Ʒ��Ϣһ��һ���������ڵ���Ʒ*/
	private Product product;//��Ʒ��Ϣ
	
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
