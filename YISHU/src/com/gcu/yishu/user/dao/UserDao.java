package com.gcu.yishu.user.dao;

import java.util.List;

import com.gcu.yishu.user.pojos.User;

public interface UserDao {
	
	public void User_add(User user);//用户注册
	List<User> findUserList(String sno);//用户登录
	public void updateUserList(User exitUser);//用户资料修改
}
