package com.gcu.yishu.pojos;

public class Product_Style {
	private Integer styleId;
	/*每件二手产品相对应的五张实体图 */
	private String Pic1;
	private String Pic2;
	private String Pic3;
	private String Pic4;
	private String Pic5;
	private String Pro_Remark;//产品介绍
	private Product product;//对应的产品
	
	public Product_Style() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getPic1() {
		return Pic1;
	}

	public void setPic1(String pic1) {
		Pic1 = pic1;
	}

	public String getPic2() {
		return Pic2;
	}

	public void setPic2(String pic2) {
		Pic2 = pic2;
	}

	public String getPic3() {
		return Pic3;
	}

	public void setPic3(String pic3) {
		Pic3 = pic3;
	}

	public String getPic4() {
		return Pic4;
	}

	public void setPic4(String pic4) {
		Pic4 = pic4;
	}

	public String getPic5() {
		return Pic5;
	}

	public void setPic5(String pic5) {
		Pic5 = pic5;
	}

	public Integer getStyleId() {
		return styleId;
	}
	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}
	public String getPro_Remark() {
		return Pro_Remark;
	}
	public void setPro_Remark(String pro_Remark) {
		Pro_Remark = pro_Remark;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
