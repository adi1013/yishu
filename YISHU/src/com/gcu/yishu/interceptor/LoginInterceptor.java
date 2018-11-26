package com.gcu.yishu.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
/*
 * 登录拦截器类
 * */
//拦截器
public class LoginInterceptor extends MethodFilterInterceptor{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {		
	
		
		Object obj = ServletActionContext.getRequest().getSession().getAttribute("User");
        if(obj != null){
        	//处于登录状态
        	System.out.println("登录了");
        	//"放行"
        	return invocation.invoke();
        }else{
        	//不是登录状态，返回登录页
        	//回到result里找值
        	System.out.println("没登录");
        	return "Login";
        }
		
	}

}
