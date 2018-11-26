package com.gcu.yishu.product.pojos;

public class Product_Style {
	private Integer styleId;
	private String Pic1;//用来保存路径
	private Product product;//对应产品
	
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
	
	public Integer getStyleId() {
		return styleId;
	}

	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
//	
//	
}
