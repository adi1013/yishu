package com.gcu.yishu.user.action;

public interface UserAction {
	
	public String add();
	public String login();
	public String update();
	
	/*
	 * 
	 * */
	public String addOrder();
	public String findOrder();
	
	public String loginOut();
	
	public String ToRegister();
	public String ToLogin();
	public String to_main();
	public String listUI();
	public String homePage();
}
