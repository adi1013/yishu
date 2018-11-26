package com.gcu.yishu.user.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.gcu.yishu.user.pojos.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao{
	
	private Session session;
	
	@Override
	public void User_add(User user)
	{
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(user);
		transaction.commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findUserList(String sno) {
		// TODO Auto-generated method stub
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Query<User> query = (Query<User>) session.createQuery("from User where SNO=?");
		query.setParameter(0, sno);
		List<User> users = query.list();
		session.close();
		return users;
	}

	@Override
	public void updateUserList(User exitUser) {
		// TODO Auto-generated method stub
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(exitUser);
		transaction.commit();
		session.close();
		System.out.println("User update success");
	}
}
