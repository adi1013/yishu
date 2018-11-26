package com.gcu.yishu.user.pojos;

import java.io.File;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.gcu.yishu.order.pojos.Order;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4276730154375318999L;
	private Integer ID;//�û����
	private String SNO;//ѧ��
	private String UserName;//��ʵ����
	private String Password;//����
	private String MobilePhone;//�ֻ�����
	private String Grade;//�꼶
	private String Major;//רҵ
	private Integer SuccessOrderNum;//�ɹ�������
	private File HeadImg;//ͷ��
	private String HeadImgPath;//ͷ��·��
	
	private Set<Order> Orders=new HashSet<Order>(0);//һ�Զ�ӳ��Order

	public User(){super();}

	public User(String sNO, String userName, String password, String mobilePhone, String grade, String major) {
		super();
		SNO = sNO;
		UserName = userName;
		Password = password;
		MobilePhone = mobilePhone;
		Grade = grade;
		Major = major;
	}

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getSNO() {
		return SNO;
	}

	public void setSNO(String sNO) {
		SNO = sNO;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getMobilePhone() {
		return MobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		MobilePhone = mobilePhone;
	}

	public String getGrade() {
		return Grade;
	}

	public void setGrade(String grade) {
		Grade = grade;
	}

	public String getMajor() {
		return Major;
	}

	public void setMajor(String major) {
		Major = major;
	}

	public Integer getSuccessOrderNum() {
		return SuccessOrderNum;
	}

	public void setSuccessOrderNum(Integer successOrderNum) {
		SuccessOrderNum = successOrderNum;
	}
	
	public Set<Order> getOrders() {
		return Orders;
	}

	public void setOrders(Set<Order> orders) {
		Orders = orders;
	}
	
	public File getHeadImg() {
		return HeadImg;
	}

	public void setHeadImg(File headImg) {
		HeadImg = headImg;
	}

	public String getHeadImgPath() {
		return HeadImgPath;
	}

	public void setHeadImgPath(String headImgPath) {
		HeadImgPath = headImgPath;
	}
}
