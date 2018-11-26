package com.gcu.yishu.cart.action;

public interface CartAction {
	
	public String addToCart();//添加商品到购物车
	public void deleteOnCart();//从购物车中删除商品
	
	public void cartCount();//统计购物车中商品的总金额
	
}
