<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    
%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试个人主页</title>

<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/yishu_myselfpage.css">

<script type="text/javascript" src="<%=basePath%>JSP/lib/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>JSP/lib/bootstrap/js/vue.min.js"></script>
<script type="text/javascript" src="<%=basePath%>JSP/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>JSP/lib/bootstrap/js/yishu_myselfpage.js"></script>



</head>
<body>
<!-- 头部 -->
    <jsp:include page="/JSP/top.jsp"></jsp:include>
    <div style="background-color:#f8f9fa;"><br/></div>
    <br/>
<!-- 对应session的user -->
<c:set var="user" value="${User}"></c:set>
  <div id="select_main">
		<div class="myseft_mass">
			<div class="myseft_mass_left">
				<img src="../lib/img/test1.jpg">
				<p class="my_name">${user.userName}</p>
				<p class="my_numb">${user.SNO}</p>
				<p class="my_numb">
					<a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">>>查看更多<<</a>
				</p>
			</div>
			<div id="collapseExample" class="collapse myseft_mass_right">
				<div class="panel-body">	
					<table>
						<tr>
							<th>手机号</th>							
							<td class="show_massge">
								<span class="form-control" style="width: 60px;float: left;margin-right: 10px;">+86</span>
								<span id="show_massge_phone" style="line-height: 2.5em;">${user.mobilePhone}</span>
							</td>
							<td class=" change_massage">
								<span class="form-control" style="width: 60px;float: left;">+86</span>
								<input type="text" class="form-control " id="is_phone_input" placeholder="手机号" style="width: 140px;float: left;">
							</td>
						</tr>
						<tr>
							<th>专业</th>						
							<td id="show_massge_major" class="show_massge">${user.major}</td>
							<td><input type="text" class="form-control change_massage" id="is_major_input" placeholder="专业"></td>
						</tr>
						<tr>
							<th>真实姓名</th>
							<td id="show_massge_truename" class="show_massge"></td>
							<td><input type="text" class="form-control change_massage" id="is_true_name_input" placeholder="真实姓名"></td>
						</tr>
						<tr>
							<th>成功次数</th>
							<td id="show_phone">100</td>
						</tr>
					</table>
					<div style="clear: both;"></div>
					<button type="button" class="btn btn-info change_massage_button" id="is_change_button">修改</button>
					<button type="button" class="btn btn-danger change_massage_button" id="is_succ_button">确定</button>
				</div>
				
			</div>  
		</div>
		<div style="clear: both;height: 20px;border-bottom:1px  solid rgba(226,226,226,0.6 );"></div>
		<div class="select_type">
			<nav role="navigation">
				<ul class="nav nav-tabs">
					<li role="presentation" id="select_type_sale" class="select_type_myclass">我的商品</li>
				    <li role="presentation" id="select_type_buy">订单</li>
				    <li role="presentation" id="select_type_like">购物车</li>
				    <li><a href="${pageContext.request.contextPath}/JSP/addUI.jsp">上架商品</a></li>
				</ul>
			</nav>
		</div>
		<div id="goods_sale">	
		<div class="table_show">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>商品名</th>
							<th>价格</th>
							<th>出版社</th>
							<th>作者</th>
							<th>上架时间</th>
							<th>库存</th>
							<th>编辑</th>
						</tr>
						<c:forEach items="${PageInfo.list}" var="product">  
						<tr>
							<td><a href="${pageContext.request.contextPath}/Product_detail.action?Pro_ID=${product.pro_id}">${product.pro_name}</a></td>
							<td>${product.pro_price}</td>
							<td>${product.pro_press}</td>
							<td>${product.pro_author}</td>
							<td>${product.pro_pubishTime}</td>
							<td>${product.pro_num}</td>
							<td>
				               <a href="Product_editUI.action?pro_id=${product.pro_id}">编辑</a>
				               <a href="Product_delete.action?pro_id=${product.pro_id}">删除</a>
				            </td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div style="clear: both;"></div>
			<div class="select_main_page_numb">
			           共[<b>${PageInfo.allRowCount}</b>]条记录,共[<b>${PageInfo.pageCount}</b>]页,当前第[<b>${PageInfo.currentPage}</b>]页
				<c:if test="${PageInfo.currentPage!=1}">
		           
		              [<a href=" <s:url action="Product_listUI" escapeAmp="false">
		                 <s:param name="CurrentPage">${CurrentPage-1}</s:param>
		                 <s:param name="shopkeeperId">${user.ID}</s:param>
		             </s:url>">上一页</a>]
		        </c:if>
				<span>|</span>
				<c:if test="${PageInfo.currentPage!=PageInfo.pageCount}">
				
	               [<a href=" <s:url action="Product_listUI" escapeAmp="false">
		                 <s:param name="CurrentPage">${CurrentPage+1}</s:param>
		                 <s:param name="shopkeeperId">${user.ID}</s:param>
		             </s:url>">下一页</a>]
	              
	            </c:if>
			</div>
		</div>
		<div id="goods_buy">
			<c:forEach items="${Order}" var="order">
			<c:forEach items="${order.orderItems}" var="orderItem">
			<div class="table_show">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>订单号</th>
							<th>订单详情</th>
							<th>数量</th>
							<th>金额</th>
							<th>买家信息</th>
							<th>购买时间</th>
						</tr>
						<tr>
							<td>${orderItem.orderItemID}</td>
							<td>${orderItem.productID.pro_name}</td>
							<td>${orderItem.count}</td>
							<td>${orderItem.sum}</td>
							<td>张三</td>
							<td>${order.createTime}</td>
						</tr>
					</tbody>
				</table>
			</div>
			</c:forEach>
			</c:forEach>
			<div style="clear: both;"></div>
			<div class="select_main_page_numb">
				[<a href="#">上一页</a>]
				<span>1</span>
				[<a href="#">下一页</a>]
			</div>
		</div>
				<div id="goods_like">
			
			<div class="table_show">
				<table class="table table-bordered" id="shopping_cart_table">
				<c:forEach items="${Items}" var="orderItem">
					<tbody>
						<tr>
							<th>勾选</th>
							<th>商品名</th>
							<th>单价</th>
							<th>数量</th>
							<th>小结金额</th>
							<th>编辑</th>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="all_select" style="height: 50px;width: 25px" name="shopping_cart_checkbox">
							</td>
							<td>${orderItem.productID.pro_name}</td>
							<td>${orderItem.productID.pro_price}</td>
							<td>
								<a href="javascript:void(0);" name="sub">-</a>
								<input type="text" value="${orderItem.count}" name="num" style="width: 30px;">
								<a href="javascript:void(0);" name="add">+</a>
								<div class="clear"></div>
							</td>
							<td>${orderItem.sum}</td>
							<td>
								<button type="button" class="btn btn-danger" name="delete_cart">删除</button>
							</td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
				<div class="show_sum_money">
					<input type="checkbox" id="shopping_cart_checkbox_all">
					<a href="javascript:void(0);" class="checkbox_dele">删除勾选</a>
					<div style="float: right">

						<div class="show_sum_money_text" style="float: left;">
							<span>总金额为：</span>
							<span style="color: red;font-size: 2em;line-height: 50px;">￥</span>
							<span style="margin-right: 10px;color: red;font-size: 1.2em;line-height: 50px;" id="cart_all_money_sum">0</span>
						</div>
						<div class="show_sum_money_button" style="float: left;" id="my_sum">
							<a href="${pageContext.request.contextPath}/Order_addOrderList.action">结算</a>
						</div>
						<div class="show_sum_money_button show_sum_money_button2" style="float: left;">
							<a href="">清空购物车</a>
						</div>
					</div>		
				</div>
			</div>

			<div style="clear: both;"></div>
			<div class="select_main_page_numb">
				[<a href="#">上一页</a>]
				<span>1</span>
				[<a href="#">下一页</a>]
			</div>
		</div>



		
	</div>
</body>
</html>