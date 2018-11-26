package com.gcu.yishu.user.service;

import java.util.List;

import com.gcu.yishu.user.pojos.User;

public interface UserService {

	public void User_add(User user);//用户注册
	public List<User> User_login(User user,String sno);//用户登录
	public String User_update(User exitUser);//用户资料修改
	
}
