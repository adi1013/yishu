package com.gcu.yishu.order.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.gcu.yishu.order.dao.OrderDao;
import com.gcu.yishu.order.pojos.Order;
import com.gcu.yishu.order.pojos.OrderItem;
import com.gcu.yishu.user.pojos.User;

public class OrderServiceImpl implements OrderService{

	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao)
	{
		this.orderDao=orderDao;
	}
	
	@Override
	public String addOrderList(Order order) {
		// TODO Auto-generated method stub
		System.out.println("Service addItem Test!!");
		
		User user=(User)ServletActionContext.getRequest().getSession().getAttribute("User");
		Order orders = orderDao.findNullOrder(user);
		List<OrderItem> orderItems = orderDao.findOrderItem(orders);
		order.setOrder(getDate(), 1, 1, 1, 1, user);
		for(OrderItem isOrderItems:orderItems)
		{
				isOrderItems.setOrderID(order);
				order.getOrderItems().add(isOrderItems);
		}
		orderDao.addOrderList(order);
		return null;
	}

	@Override
	public List<Order> findOrderList(User user) {
		// TODO Auto-generated method stub
		List<Order> orders = orderDao.findOrderList(user);
		return orders;
	}

	@Override
	public String addOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		int exitOrderItem=0;
		System.out.println("<--------------------------addOrderService----------------------->");
		User user=(User)ServletActionContext.getRequest().getSession().getAttribute("User");
		Order order = orderDao.findNullOrder(user);
		List<OrderItem> orderItems = orderDao.findOrderItem(order);
		System.out.println("----=====+++++"+orderItems.toString());
		if(orderItems.isEmpty()){
			orderDao.addOrderItem(orderItem);
		}else{
		for(OrderItem addOrderItems:orderItems){
			if(orderItem.getProductID().getPro_id().equals(addOrderItems.getProductID().getPro_id())){
				System.out.println("addOrderItem Service Test addOrderItems----------->");
				addOrderItems.setCount(orderItem.getCount()+addOrderItems.getCount());
				addOrderItems.setSum(addOrderItems.getCount()*addOrderItems.getProductID().getPro_price());
				System.out.println("addOrderItem Service Test addOrderItems----------->"+addOrderItems.getOrderItemID()+addOrderItems.getCount());
				orderDao.addOrderItem(addOrderItems);
				exitOrderItem=1;
			}
		}
		}
		if(exitOrderItem==0){
			System.out.println("exitItemout----------------->");
			orderDao.addOrderItem(orderItem);
		}
		return null;
	}

	@Override
	public void addNullOrder(Order order) {
		// TODO Auto-generated method stub
		orderDao.addOrderList(order);
	}
	
	@Override
	public Order findNullOrder(User user) {
		// TODO Auto-generated method stub
		Order order=orderDao.findNullOrder(user);
		return order;
	}

	@Override
	public List<OrderItem> findOrderItemList(Order order) {
		// TODO Auto-generated method stub
		List<OrderItem> orderItems=orderDao.findOrderItem(order);
		return orderItems;
	}
	
	private Date getDate(){
		/*
		 *以固定格式获取系统时间入库
		 * */
		Date date = null;
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);
		try {
			date = formatter.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

}
