package com.gcu.yishu.order.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.gcu.yishu.order.pojos.Order;
import com.gcu.yishu.order.pojos.OrderItem;
import com.gcu.yishu.user.pojos.User;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao{

	private Session session;
	
	@Override
	public void addOrderList(Order item) {
		System.out.println("addItemList Dao Test");
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(item);
		transaction.commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findOrderList(User user) {
		System.out.println("findItemList Dao Test");
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Query<Order> query = (Query<Order>) session.createQuery("from Order o where o.user = ?");
		query.setParameter(0, user);
		List<Order> orders=query.list();
		session.close();
		return orders;
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		System.out.println("----------->addOrderItem Dao Test");
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(orderItem);
		transaction.commit();
		session.close();
		System.out.println("ORderItemSaveOrUpdateSuccess!!!!!!!!");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Order findNullOrder(User user) {
		// TODO Auto-generated method stub
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Query<Order> query = (Query<Order>) session.createQuery("from Order o where o.user = ? and o.IsitPay = 0");
		query.setParameter(0, user);
		Order order=(Order) query.list().get(0);
		session.close();
		return order;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItem> findOrderItem(Order order) {
		// TODO Auto-generated method stub
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Query<OrderItem> query = (Query<OrderItem>) session.createQuery("from OrderItem where orderID=?");
		query.setParameter(0,order);
		List<OrderItem> orderItems = query.list();
		session.close();
		return orderItems;
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		System.out.println("updateOrderItem------------=======");
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		transaction.commit();
		session.close();
	}
	
}
