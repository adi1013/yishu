<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product_detail</title>

<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/pro_main_info.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/mainPage.css">
<script src="<%=basePath%>JSP/lib/jquery-3.3.1.js"></script>
<script src="<%=basePath%>JSP/lib/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#linkToCart").click(function(){
			var buyNum = $("#sum").val();
			$("#linkToCart").attr("href","Cart_addToCart.action?count="+buyNum);
		});
	});
</script>
</head>
<body style="height:1000px;">

<div class="container-flush" >
       <jsp:include page="/JSP/top.jsp"></jsp:include>
    <div style="background-color:#f8f9fa;"><br/></div>
    <div class="content_back_color">    
</div>   
<br/>

<div class="container" style="height:45%;">
   <div class="row">
        <nav aria_label="breadcrumb breadcrumbback" style="height:2.2rem;">
             <ol class="breadcrumb bread_sty">
                 <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Product_homePage" id="a1" style="color:black;">主页</a></li>
                 <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=1" id="a2" style="color:black;">所有商品</a></li>
                 <li class="breadcrumb-item active"><a style="color:black;">商品详情</a></li>
              </ol>
        </nav>
    </div>
    <br>
    <div class="row" style="height:80%;">
        <div class="col-md-6 text-center">
            <div class="col-md-4 text-center d_left_c">
                <div class="l_content" id="lcontent">
                    <ul class="list-group" id="imgul">
                        <li class="li_sty">
                            <img src="${product.pic_path}" class="img-thumbnail select"/>
                        </li>
                        <li class="li_sty">
                            <img src="<%=basePath%>JSP/lib/bootstrap/img/3.jpg" class="img-thumbnail unselect"/>
                        </li>
                        <li class="li_sty">
                            <img src="<%=basePath%>JSP/lib/bootstrap/img/2.jpg" class="img-thumbnail unselect"/>
                        </li>
                        <li class="li_sty">
                            <img src="<%=basePath%>JSP/lib/bootstrap/img/4.jpg" class="img-thumbnail unselect"/>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-8" style="height:100%;float:right;">
                <div class="" style="width:100%;height:100%;">
                    <img class="img-thumbnail" src="<%=basePath%>JSP/lib/bootstrap/img/1.jpg" style="width:100%;height:100%;" id="mainshow"/>
                </div>
            </div>
            <script>
                function unselect(){
                    var _this=$(this);
                    if(!$("#lcontent").mouseout()){
                        _this.removeClass("select");
                        _this.addClass("unselect");
                    };
                }
                function selected(){
                    $("#imgul img.img-thumbnail")
                        .each(
                        function(){
                            $(this).removeClass("select");
                            $(this).addClass("unselect");
                        });
                    $(this).addClass("select");
                    $("#mainshow")[0].src=this.src;
                }
                $(function(){
                    $("#mainshow")[0].src=$("#imgul img.img-thumbnail")[0].src;
                    $("#imgul img.img-thumbnail")
                        .each(
                            function(){
                                $(this).hover(selected,unselect);
                            }
                        );
                });
            </script>
            <div style="clear:both;"></div>
        </div>

        <div class="col-md-6" style="height:80%;">
            <div class="col-md-6 text-center">
                <h4 style="padding-top:1%;">${product.pro_name}</h4>
            </div>
            <table class="table" style="font-size:1em;">
                <tr>
                    <td class="text-right left_td">作者</td>
                    <td class="right_td">${product.pro_author}</td>
                </tr>
                <tr>
                    <td class="text-right left_td">现价</td>
                    <td class="pro_price"><span class="glyphicon glyphicon-jpy"></span><b>${product.pro_price}</b></td>
                </tr>
                <tr>
                    <td class="text-right left_td">出版社</td>
                    <td class="right_td">${product.pro_press}出版社</td>
                </tr>
                <tr>
                    <td class="text-right left_td">发布时间</td>
                    <td class="right_td">${product.pro_pubishTime}</td>
                </tr>
                <tr>
                    <td class="text-right left_td">简介</td>
                    <td class="right_td"><p style="height: 1em; line-height:1em;overflow:;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem nihil sed modi quisquam expedita eligendi illum nulla, minima ea totam! Non assumenda consequatur quam, officia magnam minus, doloribus nisi beatae?<a href="#">展开更多</a></p></td>
                </tr>
                <tr>
                    <td class="text-right left_td">数量</td>
                    <td>
                       <div class="btn-group">
                          <a class="btn btn-light btn-sm border border-dark" id="dev">&#45;</a>
                          <input type="text" class="btn-sm border border-dark border-left-0 border-right-0" style="border-radius:0;width:2em;" value=1 id="sum"/>
                          <a class="btn btn-light btn-sm border border-dark" id="add">&#43;</a>
                        </div>
                        <span style="margin-left:2em;color:red;">(仅剩<span id="account">${product.pro_num}</span>件)</span>
                    </td>
                </tr>
                <tr>
                    <td><a class="btn btn-md border border-danger shop_now" href="#">现在购买</a></td>
                    <td>
                        <a id="linkToCart" class="btn btn-md shop_car" href=""><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;加入购物车</a>
                        <a class="btn btn-lg border border-danger shop_now" href="#" style="opacity:0.8;">
                            <span class="glyphicon glyphicon-star-empty" style="color:red;"></span>
                        </a>
                    </td>
                </tr>
            </table>
            <script>
                $(function(){
                    $('#add').on('click',function(){
                            var _value=parseInt($('#sum')[0].value);
                            if(_value<parseInt($('#account').html())){
                                _value+=1;
                                $('#sum')[0].value=_value;
                            }
                        });
                    $('#dev').on('click',function(){
                            var _value=parseInt($('#sum')[0].value);
                            if(_value>1){
                                _value-=1;
                                $('#sum')[0].value=_value;
                            }
                        });
                    
                });
            </script>
        </div>
    </div>
    <br>
  </div>
<!--  相关推荐-->

    <div class="tuijian_con">
            <div style="height:20%;">
                <div style="width:25%;">
                    <div class="text-center tuijian_title">相关推荐</div>
                </div>
                <img src="<%=basePath%>JSP/lib/bootstrap/img/bord.jpg"  class="tuijian_border"/>
            </div>

            <div id="tuijian">
               <!--左箭头-->
                <div class="chevron-hide" id="left_c">
                    <div class="fill"></div>
                    <div id="left">
                        <span class="glyphicon glyphicon-chevron-left icon"></span>
                    </div>
                    <div class="fill"></div>
                </div>
                <div id="parent">
                    <div id="pro_c">
                        
                        <div class="card tuijian_pro_img_con" id="pro">
                           <a href="#"><img class="card-img-top img-thumbnail tuijian_pro_img" src="<%=basePath%>JSP/lib/bootstrap/img/3.jpg" alt="图片加载中..."/></a>
                           <h5 class="card-title text-center pro_name"><a href="#">高等数学</a></h5>
                        </div>
                        <div class="card tuijian_pro_img_con" id="pro">
                           <a href="#"><img class="card-img-top img-thumbnail tuijian_pro_img" src="<%=basePath%>JSP/lib/bootstrap/img/2.jpg" alt="图片加载中..."/></a>
                           <h5 class="card-title text-center pro_name"><a href="#">高等数学</a></h5>
                        </div>
                        <div class="card tuijian_pro_img_con" id="pro">
                           <a href="#"><img class="card-img-top img-thumbnail tuijian_pro_img" src="<%=basePath%>JSP/lib/bootstrap/img/2.jpg" alt="图片加载中..."/></a>
                           <h5 class="card-title text-center pro_name"><a href="#">高等数学</a></h5>
                        </div>
                        <div class="card tuijian_pro_img_con" id="pro">
                           <a href="#"><img class="card-img-top img-thumbnail tuijian_pro_img" src="<%=basePath%>JSP/lib/bootstrap/img/2.jpg" alt="图片加载中..."/></a>
                           <h5 class="card-title text-center pro_name"><a href="#">高等数学</a></h5>
                        </div>
                        <div class="card tuijian_pro_img_con" id="pro">
                           <a href="#"><img class="card-img-top img-thumbnail tuijian_pro_img" src="<%=basePath%>JSP/lib/bootstrap/img/2.jpg" alt="图片加载中..."/></a>
                           <h5 class="card-title text-center pro_name"><a href="#">高等数学</a></h5>
                        </div>
                        <div class="card tuijian_pro_img_con" id="pro">
                           <a href="#"><img class="card-img-top img-thumbnail tuijian_pro_img" src="<%=basePath%>JSP/lib/bootstrap/img/4.jpg" alt="图片加载中..."/></a>
                           <h5 class="card-title text-center pro_name"><a href="#">高等数学</a></h5>
                        </div>
                    </div>
                </div>
                <div class="chevron-hide" id="right_c">
                    <div class="fill"></div>
                    <div id="right">
                        <span class="glyphicon glyphicon-chevron-right icon" ></span>
                    </div>
                    <div class="fill"></div>
                </div>
            </div>
  
     </div>
        <script>
               function over(obj){
                   obj.removeClass("chevron-hide");
                   obj.addClass("chevron-show");
                   
               }
               function out(obj){
                    obj.removeClass("chevron-show");
                    obj.addClass("chevron-hide");
               }
               $(function(){
                    $("#right_c").mouseover(function(){
                        var _this = $(this);
                        over(_this);
                        _this.click(
                            function(){
                                temp = $("#pro_c").scrollLeft()+20;
                                if(temp<Math.floor($("#pro_c").get(0).scrollWidth-$("#parent").innerWidth())){
                                    $("#pro_c").scrollLeft(temp);
                                }else{
                                    $("#pro_c").scrollLeft(Math.floor($("#pro_c").get(0).scrollWidth-$("#parent").innerWidth()));
                                }
                            }
                        );
                    });  
                   $("#right_c").mouseout(function(){
                        out($(this));
                   });
               });
               $(function(){
                        $("#left_c").mouseover(function(){
                            var _this = $(this);
                            over(_this);
                            _this.click(
                                function(){
                                    temp = $("#pro_c").scrollLeft()-20;
                                    if(temp>0){
                                        $("#pro_c").scrollLeft(temp);
                                    }else{
                                        $("#pro_c").scrollLeft(0);
                                    }
                                }
                            );
                        });  
                       $("#left_c").mouseout(function(){
                            out($(this));
                       });
                   });

           </script>
     <br/>
	<!-- 导入尾部 -->
    <jsp:include page="/JSP/foot.jsp"></jsp:include>
 
</div>
</body>
</html>