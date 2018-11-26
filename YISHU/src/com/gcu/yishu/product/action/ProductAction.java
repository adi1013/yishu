package com.gcu.yishu.product.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

//import com.gcu.yishu.cart.action.CartAction;
import com.gcu.yishu.order.action.OrderAction;
import com.gcu.yishu.pagination.PageInfo;
import com.gcu.yishu.product.pojos.Product;
import com.gcu.yishu.product.service.ProductService;
import com.gcu.yishu.user.pojos.User;
import com.gcu.yishu.uuid.UUIDUtils;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class ProductAction extends ActionSupport implements ModelDriven<Product> {

	private static final long serialVersionUID = 1L;	
	private Product product = new Product();
    private User user = new User();
	
	private ProductService productService;
	private OrderAction orderAction;
	private int shopkeeperId;//卖家ID=this。user
//	private CartAction cartAction;
	
	/*10.27newAdd*/

	private String college;            //学院
	
	/*11.3*/
//	public HttpServletRequest request; 
    
	
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	
	//10.12增
	private int pageSize = 8;//用于表示分页显示商品个数
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	private int Pro_ID;//属性封装，获取物品id，用于detail页面

	public int getPro_ID() {
		return Pro_ID;
	}

	public void setPro_ID(int pro_ID) {
		Pro_ID = pro_ID;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public void setOrderAction(OrderAction orderAction)
	{
		this.orderAction=orderAction;
	}
	
	public void setShopkeeperId(int shopkeeperId){
		this.shopkeeperId=shopkeeperId;
	}
//	public void setCartAction(CartAction cartAction){
//		this.cartAction=cartAction;
//	}

	public String add() throws FileNotFoundException, IOException{

//		User user=(User)sessionUtil.getSession().get("UserList");
//		System.out.println("sessionUtil Test: "+user.getID());

		BufferedImage sourceImg =ImageIO.read(new FileInputStream(product.getPro_pic()));
		//限定长宽1200px*1500px，大小1M内
		if(sourceImg.getWidth()<1200 && sourceImg.getHeight()<1500 && product.getPro_pic().length()/1048576<1){
			if(product.getPro_pic()!=null){
				String filePath="E:/JavaEE/product_pic_save/";
				String fileName = UUIDUtils.getUUID()+".jpg";
				String newpath = filePath+fileName;
//				String secondpath = "/YISHU/productImg/"+fileName;
				File diskFile =new File(newpath);
//				File diskFile =new File(secondpath);
				FileUtils.copyFile(product.getPro_pic(),diskFile);
				System.out.println(filePath+fileName);
//				System.out.println("/YISHU/productImg/"+fileName);
//				product.setPic_path(newpath);
				product.setPic_path("/YISHU/productImg/"+fileName);
			}
		}else{
			System.out.println("图片格式不符合，长宽限制为1200*1500");
			System.out.println("将采用默认图片");
//			String realPath = request.getSession().getServletContext().getRealPath("WebContent/Picture/default.jpg");
			product.setPic_path("/YISHU/productImg/default.jpg");//
		}
		//获取系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		product.setPro_pubishTime(df.format(new Date()));
		
//		//测试用UserID
//		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("User");
		user.setID(shopkeeperId);
		product.setUser(user);
		
		productService.save(product);
		System.out.println("productService-save");
		System.out.println("Product add test： "+product.toString());
		System.out.println("Product add test： "+product.getPro_name());
		return "toHome";
	}

	//个人主页
	public String listUI(){
		
		orderAction.findOrderList();//从数据库获取用户数据存入Session中
		
		orderAction.findOrderItem();//获取数据库中的购物车内容
		 
		String myProduct = this.myProduct();
		System.out.println("myProduct:____________________________>"+myProduct);
		return "listUI";
	}

	private int CurrentPage=1;
	public int getCurrentPage() {
		return CurrentPage;
	}
	public void setCurrentPage(int currentPage) {
		CurrentPage = currentPage;
	}

	public String listPage(){

		pageSize = 5;
		System.out.println("action----CurrentPage: "+CurrentPage);

		PageInfo pageInfo =productService.listpage(CurrentPage,pageSize);

		System.out.println("action-----getAllRowCount(): "+pageInfo.getAllRowCount());	

		ServletActionContext.getRequest().setAttribute("PageInfo", pageInfo);
		return "listPage";
	}
	//用来显示    所有商品    的分页
	public String allProduct(){

		System.out.println("action----CurrentPage: "+CurrentPage);

		PageInfo pageInfo =productService.listpage(CurrentPage,pageSize);

		System.out.println("action-----getAllRowCount(): "+pageInfo.getAllRowCount());	

		ServletActionContext.getRequest().setAttribute("PageInfo", pageInfo);
		
		return "allProduct";
	}



	public String editUI(){	
		System.out.println("Action---editUI");

		Integer pro_id = product.getPro_id();

		System.out.println("id :"+pro_id);
		System.out.println("根据id查询对象");

		Product p = productService.findObjectById(pro_id);

		System.out.println("P: "+p.toString());

		ServletActionContext.getRequest().setAttribute("product", p);
		return "editUI";
	}
	private String picPath;
	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	
	//保存编辑
	public String edit() throws FileNotFoundException, IOException{
		System.out.println("1");
		System.out.println("product.getPro_pic(): "+product.getPro_pic());
		
		
		if(product.getPro_pic()!=null){
			BufferedImage sourceImg =ImageIO.read(new FileInputStream(product.getPro_pic()));
			//单位为px像素  length（）返回单位是字节  字节/1024*1024=M  
			if(sourceImg.getWidth()<1200 && sourceImg.getHeight()<1500 && product.getPro_pic().length()/1048576<1){
				String filePath="E:/JavaEE/product_pic_save/";
				String fileName = UUIDUtils.getUUID()+".jpg";
				String newpath = filePath+fileName;
				File diskFile =new File(newpath);
				FileUtils.copyFile(product.getPro_pic(),diskFile);
				System.out.println(filePath+fileName);
				product.setPic_path("/YISHU/productImg/"+fileName);
			}else{
				System.out.println("图片格式不符合，长宽限制为1200*1500");
				System.out.println("将采用默认图片");
				product.setPic_path("/YISHU/productImg/default.jpg");
			}				
		}else{
			product.setPic_path(picPath);//设回原路径
			System.out.println("采用原图片： "+picPath);
		}
		//11.23外键
		user.setID(shopkeeperId);
		product.setUser(user);
		System.out.println("外键： "+shopkeeperId);

		System.out.println("update检查完图片");
		if(product!=null){
			productService.update(product);
		}
		
		return "toHome";
	}
	//跳转到新增页面
	public String addUI(){

		return "addUI";
	}

	//index的action用来把list放到主页面
	public String homePage(){
		System.out.println("Action--homePage");

		PageInfo pageInfo =productService.listpage(CurrentPage,pageSize);//默认（1,8）
/*10.21*/PageInfo pageInfo2 =productService.listpage(2,pageSize);//第二页
/*10.21*/PageInfo pageInfo3 =productService.listpage(3,pageSize);//第三页
		
		ServletActionContext.getRequest().setAttribute("PageInfo", pageInfo);
/*10.21*/ServletActionContext.getRequest().setAttribute("PageInfo2", pageInfo2);
/*10.21*/ServletActionContext.getRequest().setAttribute("PageInfo3", pageInfo3);

		return "main";
	}
	

	//跳转详情页
	public String detail(){
		System.out.println("id :"+Pro_ID);
		//根据id查询
		System.out.println("根据id查询对象");

		Product product = productService.findObjectById(Pro_ID);
		
		ServletActionContext.getRequest().setAttribute("product", product);
		ServletActionContext.getRequest().getSession().setAttribute("product", product);
		return "detail";
	}
//	//转购物车
//	public String shopCar(){
//
//		System.out.println("购物车");
//		cartAction.addToCart();//添加商品到购物车
//		return "shopCar";
//	}
	//转登录页
	public String login(){
		return "login";
	}
	
	private String Maj;//专业
	public String getMaj() {
		return Maj;
	}
	public void setMaj(String maj) {
		Maj = maj;
	}
	
	//10.27--条件查询选学院专业
	public String major(){
		
		//10.28
//		System.out.println("college： "+getCollege());
		System.out.println("Major： "+ Maj);

		String condition ="major";//条件属性major
		String value ="'"+Maj+"'";
		
		System.out.println("条件属性为： "+ condition+" 值为："+ value);
		
		PageInfo pageInfo =productService.listpage(CurrentPage,pageSize,condition,value);

		System.out.println("pageInfo: "+pageInfo.toString());
		
		ServletActionContext.getRequest().setAttribute("PageInfo", pageInfo);		
//		return "findResult";//"查询结果"
		return "allProduct";		
	}
	//11.6
	private String Condition;//模糊查询的内容
	public String getCondition() {
		return Condition;
	}
	public void setCondition(String condition) {
		Condition = condition;
	}
	
	//11.6
    public String search(){
		
		System.out.println("模糊查询的内容： "+ Condition);
	
		PageInfo pageInfo =productService.listpage(CurrentPage,pageSize,Condition);

		System.out.println("pageInfo: "+pageInfo.toString());
		
		ServletActionContext.getRequest().setAttribute("PageInfo", pageInfo);		
//		return "findResult";//"查询结果"
		return "allProduct";		
	}
    
    public String myProduct(){
    	pageSize = 5;//分页显示商品个数
    	System.out.println("shopkeeperId:"+shopkeeperId);
    	System.out.println("CurrentPage: "+CurrentPage);
    	String condition = "User";
    	String value = ""+shopkeeperId;
    	
    	PageInfo pageInfo = productService.listpage(CurrentPage, pageSize,condition,value);
    	ServletActionContext.getRequest().setAttribute("PageInfo", pageInfo);
    	return "myProduct";
    }
	
	@Override
	public Product getModel() {		
		return product;
	}

}
