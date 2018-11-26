<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body>
	<form action="User_add.action" method="post">
		学号：<input type="text" name="SNO"/><br/> 
		用户名：<input type="text" name="UserName"/><br/> 
		密码：<input type="text" name="Password"/><br/>
		手机号：<input type="text" name="MobilePhone"/><br/>
		专业：<input type="text" name="Major"/><br/>
		年级：<input type="text" name="Grade"/><br/>
		<input type="submit" value="提交"/>
	</form>
	<a href="${pageContext.request.contextPath}/JSP/login.jsp">立即登录</a>
</body>
</html>