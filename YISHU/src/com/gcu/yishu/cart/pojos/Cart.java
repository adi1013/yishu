package com.gcu.yishu.cart.pojos;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	private Map<Integer, CartItem> map = new LinkedHashMap<Integer, CartItem>();

	private double total;//商品总计

	public double getTotal() {
		return total;
	}

	// Cart对象中有一个叫cartItems属性.
	public Collection<CartItem> getCartItems(){
		return map.values();
	}

	//添加到购物车
	public void addCart(CartItem cartItem) {
		
		System.out.println("---Test Cart add ---------");//测试类方法
		
		Integer pid = cartItem.getProductID().getPro_id();//获取订单项中的商品ID
		if(map.containsKey(pid)){// 存在
			CartItem _cartItem = map.get(pid);// 获得购物车中原来的购物项
			_cartItem.setCount(_cartItem.getCount()+cartItem.getCount());
			_cartItem.setSum();
		}else{
			map.put(pid, cartItem);// 不存在
		}
		
		cartItem.setSum();//计算单个商品总额
		
		total += cartItem.getSum();// 设置总计的值
		System.out.println("total----------------------->"+total);
	}

	//从购物车移除购物项
	public void removeCart(Integer pid) {
		CartItem cartItem = map.remove(pid);// 将购物项移除购物车:
		total -= cartItem.getSum();// 总计 = 总计 -移除的购物项小计:
	}

	//清空购物车
	public void clearCart() {
		map.clear();// 将所有购物项清空
		total = 0;// 将总计设置为0
	}
}
