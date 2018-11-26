<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%  
String path = request.getContextPath();  

String webContentPath =request.getSession().getServletContext().getRealPath("/");
System.out.println(webContentPath);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.css">
 <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/pro_details.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listPage</title>
</head>
<body>
<div class="container">
        <nav aria_label="breadcrumb breadcrumbback">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">我的商品</li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Product_homePage">主页 </a></li>
                <li class="breadcrumb-item"><a href="<s:url action="Product_addUI"/>">上架商品 </a></li>         
                <li class="breadcrumb-item"><a href="<s:url action="#"/>">购物车 </a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=1"> 所有商品 </a></li>
            </ol>
        </nav>  
    <table>
       <tr>
           <td></td>
           <td>商品编号</td>
           <td>商品名</td>
           <td>价格</td>
           <td>出版社</td>
           <td>作者</td>
           <td>出版时间</td>
       </tr> 
       <!-- items 用于接收集合对象，var 定义对象接收从集合里遍历出的每一个元素 -->
       <c:forEach items="${PageInfo.list}" var="product">     
       <tr>
           <td><img src="${product.pic_path}" width="130"height="130"/></td>
           <td><Label>${product.pro_id}</Label></td>
           <td><Label>${product.pro_name}</Label></td>
           <td><Label>${product.pro_price}</Label></td>
           <td><Label>${product.pro_press}</Label></td>
           <td><Label>${product.pro_author}</Label></td>
           <td><Label>${product.pro_pubishTime}</label></td> 
           <td>
               <a href="Product_editUI.action?pro_id=${product.pro_id}">编辑</a>
               <a href="#">删除</a>
           </td>  
       </tr>
       </c:forEach>
    </table>
    
    <div>
                                 共[<b>${PageInfo.allRowCount}</b>]条记录,共[<b>${PageInfo.pageCount}</b>]页,当前第[<b>${PageInfo.currentPage}</b>]页    
           
           <!-- 当前页为不是第一页，有上一页-->
           <c:if test="${PageInfo.currentPage!=1}">
              [<a href="${pageContext.request.contextPath}/Product_listPage.action?CurrentPage=${CurrentPage-1}">上一页</a>]
           </c:if>
           <!-- 当前页为不是最后一页，有下一页 -->
           <c:if test="${PageInfo.currentPage!=PageInfo.pageCount}">
               [<a href="${pageContext.request.contextPath}/Product_listPage.action?CurrentPage=${CurrentPage+1}">下一页</a>]
           </c:if>
    </div>
</div>   
</body>
</html>


