package com.gcu.yishu.user.service;

import java.util.List;

import com.gcu.yishu.user.pojos.User;

public interface UserService {

	public void User_add(User user);//�û�ע��
	public List<User> User_login(User user,String sno);//�û���¼
	public String User_update(User exitUser);//�û������޸�
	
}
