package com.gcu.yishu.order.dao;

import java.util.List;

import com.gcu.yishu.order.pojos.Order;
import com.gcu.yishu.order.pojos.OrderItem;
import com.gcu.yishu.user.pojos.User;

public interface OrderDao {
	
	/*ͨ���û�������û�����*/
	public void addOrderList(Order order);
	/*ͨ���û������Ҷ�Ӧ����*/
	List<Order> findOrderList(User user);
	
	public void addOrderItem(OrderItem orderItem);//添加订单到购物车调用方法
	public void updateOrderItem(OrderItem orderItem);//更新数据
	
	public List<OrderItem> findOrderItem(Order order);
	
	
	Order findNullOrder(User user);

}
