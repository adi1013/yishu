<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>
<div>请登录!</div>
	<form method="post" action="User_login.action">
		学号：<input type="text" name="SNO"/><br/>
		密码：<input type="text" name="Password"/><br/>
		<input type="submit" value="登录"/><br/>
	</form>
	<a href="${pageContext.request.contextPath}/JSP/register.jsp">立即注册</a>
</body>
</html>