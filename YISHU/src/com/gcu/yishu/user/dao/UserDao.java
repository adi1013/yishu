package com.gcu.yishu.user.dao;

import java.util.List;

import com.gcu.yishu.user.pojos.User;

public interface UserDao {
	
	public void User_add(User user);//�û�ע��
	List<User> findUserList(String sno);//�û���¼
	public void updateUserList(User exitUser);//�û������޸�
}
