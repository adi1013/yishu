<%@ page language="java" pageEncoding="UTF-8"%>
<%
	//取得应用所在的目录
	String path = request.getContextPath();
	//取得文件所在的文件夹，并且取得最后一个 "/" 的部分
	String path1 = request.getServletPath();
	int baseIndex = path1.lastIndexOf("/");
	String path2 = path1.substring(0, baseIndex);
	String rootPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + path2 + "/";
	request.setAttribute("basepath", basePath);
	request.setAttribute("rootpath", rootPath);
%>
<base href="<%=request.getAttribute("basepath")%>"/>