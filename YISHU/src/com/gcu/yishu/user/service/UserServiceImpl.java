package com.gcu.yishu.user.service;

import java.util.List;

import com.gcu.yishu.user.dao.UserDao;
import com.gcu.yishu.user.pojos.User;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;
	
	//Í¨¹ýspring×¢Èë
	public void setUserDao(UserDao userDao)
	{
		this.userDao = userDao;
	}
	
	@Override
	public void User_add(User user)
	{
//		userDaoImpl.User_add(user);
		userDao.User_add(user);
		System.out.println("UserService Test Interface Success!");
	}

	@Override
	public List<User> User_login(User user, String sno) {
		// TODO Auto-generated method stu
//		List<User> users = userDaoImpl.findUserList(sno);
		List<User> users = userDao.findUserList(sno);
		return users;
	}

	@Override
	public String User_update(User exitUser) {
		// TODO Auto-generated method stub
//		userDaoImpl.updateUserList(exitUser);
		userDao.updateUserList(exitUser);
		return null;
	}

}
