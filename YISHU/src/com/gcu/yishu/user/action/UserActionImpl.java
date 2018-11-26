package com.gcu.yishu.user.action;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.gcu.yishu.order.action.OrderAction;
import com.gcu.yishu.user.pojos.User;
import com.gcu.yishu.user.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserActionImpl extends ActionSupport implements ModelDriven<User>, UserAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7046918605087489712L;

	private UserService userService;
	private OrderAction orderAction;
	private User user = new User();

	public void setUserService(UserService userService)
	{
		this.userService=userService;
	}
	public void setOrderAction(OrderAction orderAction)
	{
		this.orderAction=orderAction;
	}

	@Override
	public String add() {
		// TODO Auto-generated method stub
		System.out.println("user:"+user.toString());
		try {
			if(user!=null){
				System.out.println("user Pass");
				System.out.println(user.getHeadImg());
				if(user.getHeadImg()!=null){
					System.out.println("HeadImg Pass");
					String filePath=ServletActionContext.getServletContext().getRealPath("upload/user");
					String fileName=UUID.randomUUID().toString()+".jpg";
					String path=filePath+fileName;
					File file =new File(path);
					FileUtils.copyFile(user.getHeadImg(),file);
					user.setHeadImgPath(path);
				}
				System.out.println("userGetPath Test:"+user.getHeadImgPath());
				userService.User_add(user);
				ServletActionContext.getRequest().getSession().setAttribute("User1",user);
				orderAction.addNULLOrder();//添加购物车用的空订单
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Override
	public String login() {
		System.out.println("User_Login test_01"+user.toString());
		List<User> users=userService.User_login(user,user.getSNO());

		System.out.println("User Login Test-------->::"+users);

		if(users.equals(null)) return "error";
		if(users.get(0).getSNO().equals(user.getSNO())&&users.get(0).getPassword().equals(user.getPassword()))
		{
			ServletActionContext.getRequest().getSession().setAttribute("User", users.get(0));//将User放入Session中
			return "toHome";/*10.8*/
		}

		return "error";
	}

	@Override
	public String update() {
		// TODO Auto-generated method stub
		userService.User_update(user);
		return "userupdatesuccess";
	}

	@Override
	public String addOrder() {
		// TODO Auto-generated method stub
		System.out.println("AddItem Test");
		orderAction.addOrderList();
		return null;
	}

	@Override
	public String findOrder() {
		// TODO Auto-generated method stub
		System.out.println("FindItem Test");
		orderAction.findOrderList();
		return null;
	}


	@Override
	public String loginOut() {
		// TODO Auto-generated method stub
		ServletActionContext.getRequest().getSession().invalidate();
		return "home";
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	@Override
	public String ToRegister() {
		// TODO Auto-generated method stub
		return "toRegister";
	}

	@Override
	public String ToLogin() {
		// TODO Auto-generated method stub
		return "toLogin";
	}

	@Override
	public String to_main() {
		// TODO Auto-generated method stub
		return "main";
	}
	//到个人主页
	@Override
	public String listUI() {
		// TODO Auto-generated method stub
		return "listUI";
	}
	//到主页
	@Override
	public String homePage() {
		// TODO Auto-generated method stub
		/*10.8*/return "home";
	}
}

