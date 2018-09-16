<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>
     <form name="form1" action="Product_add.action" method="post" enctype="multipart/form-data">
      <table>
      <!-- 该页面需要获取当前用户名字 ，确定后 自动生成产品编号-->
      <tr>
            <td>商品名：</td>  
            <td><input type="text" name="pro_Name"/></td>
      </tr>
  <tr>
            <td>售价：</td>  
            <td><input type="text" name="pro_Price"/></td>
      </tr>
    <tr>
            <td>出版社：</td>  
            <td><input type="text" name="pro_Press"/></td>
      </tr>
       <tr>
            <td>作者：</td>  
            <td><input type="text" name="pro_Author"/></td>
      </tr>
     <tr>
            <td>产品发布时间：(如：2018-10)</td>  
            <td><input type="text" name="pro_PubishTime"/></td>
           
      </tr>  
      <!--  
       <tr>pro_PubishTime
      
            <td>产品详情：</td> 
            <td><input type="text" name="Product.product_Style"/></td>
      </tr>
      -->
       <!-- 缺--获取图样 的路径并保存到数据库里--> 
       <tr>
            <td>图片上传 <input type="file" name="pro_pic"/>
            </td>
       </tr>
      
      <tr>
            <td><input type="submit" value="确定"> </td>   
      </tr>
      </table>                            
   </form>

</body>
</html>