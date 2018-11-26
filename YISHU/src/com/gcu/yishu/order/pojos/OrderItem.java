package com.gcu.yishu.order.pojos;

import com.gcu.yishu.product.pojos.Product;

public class OrderItem {
	private Integer orderItemID;//订单项ID
	private int count;//商品数量
	private double sum;//商品总金额
	
	private Order orderID;//Order订单ID
	private Product productID;//product产品ID
	
	
	public Integer getOrderItemID() {
		return orderItemID;
	}
	public void setOrderItemID(Integer orderItemID) {
		this.orderItemID = orderItemID;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getSum() {
		return sum;
	}
	public void setSum(double sum) {
		this.sum = sum;
	}
	public Order getOrderID() {
		return orderID;
	}
	public void setOrderID(Order orderID) {
		this.orderID = orderID;
	}
	public Product getProductID() {
		return productID;
	}
	public void setProductID(Product productID) {
		this.productID = productID;
	}
	
	
}
