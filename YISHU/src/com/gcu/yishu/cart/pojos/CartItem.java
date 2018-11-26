package com.gcu.yishu.cart.pojos;

import com.gcu.yishu.product.pojos.Product;

public class CartItem {
	
	private Product productID;//商品ID
	private int count;//商品数量
	private double sum;//商品总金额 =数量*商品价格
	
	public Product getProductID() {
		return productID;
	}
	public void setProductID(Product productID) {
		this.productID = productID;
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
	public void setSum() {
		this.sum = count*productID.getPro_price();
	}
}
