package com.gcu.yishu.cart.action;

import org.apache.struts2.ServletActionContext;

import com.gcu.yishu.cart.pojos.Cart;
import com.gcu.yishu.cart.pojos.CartItem;
import com.gcu.yishu.order.action.OrderAction;
import com.gcu.yishu.product.pojos.Product;
import com.opensymphony.xwork2.ActionSupport;

public class CartActionImpl extends ActionSupport implements CartAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Product product;
	private CartItem cartItem;
	private Integer count;
	
	private OrderAction orderAction;
	
	public void setCount(Integer count){
		this.count=count;
	}
	
	public void setOrderAction(OrderAction orderAction){
		this.orderAction=orderAction;
	}

	@Override
	public String addToCart() {
		System.out.println("--------------AddToCart Test----------");
		cartItem = new CartItem();
		product=(Product) ServletActionContext.getRequest().getSession().getAttribute("product");
		cartItem.setProductID(product);
		cartItem.setCount(count);//商品数量修改

		Cart cart = getCart();
		cart.addCart(cartItem);
		
		orderAction.addOrderItem();//添加购物项到数据库
		
		System.out.println("AddToCart Test");
		Cart carts=(Cart)ServletActionContext.getRequest().getSession().getAttribute("Cart");
		System.out.println("Test CartItems"+carts.getCartItems());
		for(CartItem cartItem: carts.getCartItems()){
			System.out.println("ProductID Test------>"+cartItem.getProductID());
		}
		return "addCartSuccess";
	}

	@Override
	public void deleteOnCart() {
		// TODO Auto-generated method stub

	}

	@Override
	public void cartCount() {
		// TODO Auto-generated method stub

	}

	public Cart getCart() {
		Cart cart = (Cart)ServletActionContext.getRequest().getSession().getAttribute("Cart");
		if(cart==null)
		{
			cart = new Cart();
			ServletActionContext.getRequest().getSession().setAttribute("Cart", cart);

		}
		return cart;
	}
	
	/*
	 * 
	 */
	public String turnLogin(){
		return "login";
	}
}
