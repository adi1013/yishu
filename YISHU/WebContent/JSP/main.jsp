<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/comm/taglibs.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    
%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易书网</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/mainPage.css">
<base href="<%=basePath%>">

<script src="<%=basePath%>JSP/lib/jquery-3.3.1.js"></script>
<script src="<%=basePath%>JSP/lib/bootstrap/js/bootstrap.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

<script type="text/javascript">     
     function divrefresh(){
        var m1=document.getElementById('movie1');
        var m2=document.getElementById('movie2');
   	   
        if(m1.style.display=='flex'){
            m1.style.display='none';
            m2.style.display='flex';
        }
        	 
        else{
            m2.style.display='none';
            m1.style.display='flex'; 
        }
     }
</script>

</head>
<body>
<div class="container-flush">
    <!-- 头部 -->
    <jsp:include page="/JSP/top.jsp"></jsp:include>
    <div style="background-color:#f8f9fa;"><br/></div>
    <div class="content_back_color">

     
   
    <br/>

    <!-- 滚动图  -->
    <jsp:include page="/JSP/slide.jsp"></jsp:include>
    <br/>

    <div class="container text-center main_pro_show">
        <div>
            <div class="text-center title_container">
                <div>
                    <span class="title_border"></span>
                    <span class="title"><span class="glyphicon glyphicon-send"></span>&nbsp;最新上架</span>
                    <span class="title_border"></span>
                </div>
            </div>
            <img src="<%=basePath%>JSP/lib/bootstrap/img/bord.jpg" style="width:100%;height:30px;">
        </div> 

        <div class="text-right" style=" margin-right:5%;margin-bottom:1%;">
            <a href="#" onclick="javascript:divrefresh();return false;" class="text-right" style="height:1%;line-height:1%;color:#237afb;">
                <span class="glyphicon glyphicon-repeat"></span>
                <span class="change_pro">换一批</span>
            </a>
        </div>
  
        
        <div id="movie1" class="row text-center" style="padding-left:1rem;display:flex;">
	       <c:forEach items="${PageInfo.list}" var="product">
	          <div class="card row_bottom" style="width:17rem;height:26rem;margin-right:0.5rem;">
	                <div style="width:17rem;height:18rem;">
	                   <a href="${pageContext.request.contextPath}/Product_detail.action?Pro_ID=${product.pro_id}">
	                     <img class="card-img-top" style="width:15rem;height:15rem;" src="${product.pic_path}" alt="${product.pro_name}"/>
	                   </a>
	                </div>
	                <div class="card-block" style="width:17rem;height:8rem;padding-top:1rem;">
	                   <div class=" text-center " style="width:17rem;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
	                      <a href="${pageContext.request.contextPath}/Product_detail.action?Pro_ID=${product.pro_id}">
	                          <span class="card-title pro_name">${product.pro_name}</span>
	                      </a>
	                    </div>
	                    <p class="card-text in_one_row "><span class="card-title">${product.pro_author}主编</span></p>
	                    <span class="car-link pro_price">￥ ${product.pro_price}</span>
	                    &nbsp;&nbsp;&nbsp;
	                    <span class="text-right cark-link pro_collected text-muted">15人收藏</span>
	                </div>
	            </div>
	        </c:forEach>             
        </div>
        
        <div id="movie2" class="row text-center" style="padding-left:1rem; display:none;">
	       <c:forEach items="${PageInfo2.list}" var="product">
	          <div class="card row_bottom" style="width:17rem;height:26rem;margin-right:0.5rem;">
	                <div style="width:17rem;height:18rem;">
	                   <a href="${pageContext.request.contextPath}/Product_detail.action?Pro_ID=${product.pro_id}">
	                     <img class="card-img-top" style="width:15rem;height:15rem;" src="${product.pic_path}" alt="${product.pro_name}"/>
	                   </a>
	                </div>
	                <div class="card-block" style="width:17rem;height:8rem;padding-top:1rem;">
	                   <div class=" text-center " style="width:17rem;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
	                      <a href="${pageContext.request.contextPath}/Product_detail.action?Pro_ID=${product.pro_id}">
	                          <span class="card-title pro_name">${product.pro_name}</span>
	                      </a>
	                    </div>
	                    <p class="card-text in_one_row "><span class="card-title">${product.pro_author}主编</span></p>
	                    <span class="car-link pro_price">￥ ${product.pro_price}</span>
	                    &nbsp;&nbsp;&nbsp;
	                    <span class="text-right cark-link pro_collected text-muted">15人收藏</span>
	                </div>
	            </div>
	        </c:forEach>             
        </div>
      </div>
      <br/>
      <!-- 导入尾部 -->
    <jsp:include page="/JSP/foot.jsp"></jsp:include>
    </div>
    <br/>
</div>

</body>
</html>