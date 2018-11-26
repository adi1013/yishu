package com.gcu.yishu.order.service;

import java.util.List;

import com.gcu.yishu.order.pojos.Order;
import com.gcu.yishu.order.pojos.OrderItem;
import com.gcu.yishu.user.pojos.User;

public interface OrderService {

	/*ͨ���û�������û�����*/
	public String addOrderList(Order order);
	/*ͨ���û������Ҷ�Ӧ����*/
	List<Order> findOrderList(User user);
	
	public void addNullOrder(Order order);//添加唯一标识空订单进数据库
	Order findNullOrder(User user);//获取当前用户的空订单
	
	public String addOrderItem(OrderItem orderItem);//添加购物车内容进数据库
	public List<OrderItem> findOrderItemList(Order order);//查找订单项中指向Nullr的项
}
