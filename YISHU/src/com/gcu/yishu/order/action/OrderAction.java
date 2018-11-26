package com.gcu.yishu.order.action;

public interface OrderAction {

	public String findOrderList();//查询订单的方法
	public String addOrderList();//购买商品时调用添加订单方法

	
	public String addNULLOrder();//添加空订单方法，用于购物车功能的实现
	
	public String addOrderItem();//将购物车内容添加到数据库
	
	public String findOrderItem();//查询购物车内容
}
