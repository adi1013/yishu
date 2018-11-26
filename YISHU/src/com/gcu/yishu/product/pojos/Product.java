package com.gcu.yishu.product.pojos;

import java.io.File;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.gcu.yishu.order.pojos.OrderItem;
import com.gcu.yishu.user.pojos.User;
//import java.util.Date;
/**
 * 閿熸枻鎷烽敓琛楄鎷峰搧閿熸枻鎷�
 * 
 * @param
 * @return
 * */
/*娴溠冩惂鐎圭偘缍嬬猾锟�*/
public class Product implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 6096095933736141003L;

	private Integer Pro_id;//商品id---主键
	private String Pro_name;//商品名字
	private String Pro_press;//出版社
	private double Pro_price;//价格
	private String Pro_author;//作者
	private Integer Pro_num;//商品数量
//	private Date pro_PubishTime;//娴溠冩惂閸欐垵绔烽弮鍫曟？
	private String Pro_pubishTime;
	private Integer Collected_count;
	private Product_Style product_Style;//鍥剧墖鏍峰紡绫�
	
	private String Pro_isbn;
	private String Pro_version;

	private User user;//卖家
	
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();//订单项集合
	
	private File pro_pic;//图片文件	
	private String pic_path;//图片路径
	/*11.2新增属性*/
	private String major;
	
	//閺嬪嫰锟界姵鏌熷▔锟�
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getPro_id() {
		return Pro_id;
	}

	public void setPro_id(Integer pro_id) {
		Pro_id = pro_id;
	}

	public String getPro_name() {
		return Pro_name;
	}

	public void setPro_name(String pro_name) {
		Pro_name = pro_name;
	}

	public String getPro_press() {
		return Pro_press;
	}

	public void setPro_press(String pro_press) {
		Pro_press = pro_press;
	}

	public double getPro_price() {
		return Pro_price;
	}

	public void setPro_price(double pro_price) {
		Pro_price = pro_price;
	}

	public String getPro_author() {
		return Pro_author;
	}

	public void setPro_author(String pro_author) {
		Pro_author = pro_author;
	}

	public Integer getPro_num() {
		return Pro_num;
	}

	public void setPro_num(Integer pro_num) {
		Pro_num = pro_num;
	}

	public Integer getCollected_count() {
		return Collected_count;
	}

	public void setCollected_count(Integer collected_count) {
		Collected_count = collected_count;
	}

	public File getPro_pic() {
		return pro_pic;
	}

	public void setPro_pic(File pro_pic) {
		this.pro_pic = pro_pic;
	}
	
	public String getPro_pubishTime() {
		return Pro_pubishTime;
	}

	public void setPro_pubishTime(String pro_pubishTime) {
		Pro_pubishTime = pro_pubishTime;
	}


	public Product_Style getProduct_Style() {
		return product_Style;
	}

	public void setProduct_Style(Product_Style product_Style) {
		this.product_Style = product_Style;
	}

	public String getPro_isbn() {
		return Pro_isbn;
	}

	public void setPro_isbn(String pro_isbn) {
		Pro_isbn = pro_isbn;
	}

	public String getPro_version() {
		return Pro_version;
	}

	public void setPro_version(String pro_version) {
		Pro_version = pro_version;
	}

	public String getPic_path() {
		return pic_path;
	}

	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	
}
