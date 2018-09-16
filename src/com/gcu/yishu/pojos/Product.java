package com.gcu.yishu.pojos;

import java.io.Serializable;
import java.util.Date;
/**
 * ���ֲ�Ʒ��
 * 
 * @param
 * @return
 * */
public class Product implements Serializable {
	private Integer pro_Num;
	private String pro_Name;
	private String pro_Press;
	private String pro_Author;
	private Integer pro_Type;//��Ʒ����  1��ʾ�鼮��2��ʾ���Ӳ�Ʒ��3��ʾ�˶�����
	private Date pro_PubishTime;//����ʱ��
	private User user;//��������
	private Product_Style product_Style;
	//private Order order;//һ��һ���ܶ���ӳ��
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
	public String getPro_Press() {
		return pro_Press;
	}



	public void setPro_Press(String pro_Press) {
		this.pro_Press = pro_Press;
	}



	public String getPro_Author() {
		return pro_Author;
	}



	public void setPro_Author(String pro_Author) {
		this.pro_Author = pro_Author;
	}



	public Date getPro_PubishTime() {
		return pro_PubishTime;
	}



	public void setPro_PubishTime(Date pro_PubishTime) {
		this.pro_PubishTime = pro_PubishTime;
	}



//	public Order getOrder() {
//		return order;
//	}
//
//
//	public void setOrder(Order order) {
//		this.order = order;
//	}


	public Product_Style getProduct_Style() {
		return product_Style;
	}


	public void setProduct_Style(Product_Style product_Style) {
		this.product_Style = product_Style;
	}


	public Integer getPro_Num() {
		return pro_Num;
	}

	public void setPro_Num(Integer pro_Num) {
		this.pro_Num = pro_Num;
	}

	public String getPro_Name() {
		return pro_Name;
	}
	public void setPro_Name(String pro_Name) {
		this.pro_Name = pro_Name;
	}
//	public String getPro_Press() {
//		return pro_Press;
//	}
//	public void setPro_Press(String pro_Press) {
//		this.pro_Press = pro_Press;
//	}
//	public String getPro_Author() {
//		return pro_Author;
//	}
//	public void setPro_Author(String pro_Author) {
//		this.pro_Author = pro_Author;
//	}
//	public Date getPro_PubishTime() {
//		return pro_PubishTime;
//	}
//	public void setPro_PubishTime(Date pro_PubishTime) {
//		this.pro_PubishTime = pro_PubishTime;
//	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "Product [pro_Num=" + pro_Num + ", pro_Name=" + pro_Name + "]";
	}
	
}
