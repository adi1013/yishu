<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
</head>
<body>
  <!-- <f:view> --> 
   <form action="${pageContext.request.contextPath}/addUser.action" method="post">
      <table>
      <tr>
            <td>姓名：</td>  
            <td><input type="text" name="user.name"/></td>
      </tr>
      <tr>                 
            <td>密码：</td>
            <td><input type="password" name="user.pwd"/></td>        
      </tr> 
      <tr>
            <td><input type="submit" value="我要上架"> </td>   
      </tr>
      </table>                            
   </form>
 <!-- </f:view> -->  
</body>
</html>