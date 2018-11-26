<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>testBootstrap</title>
    <meta charset="UTF-8" content="width=device-width,initial-scale=1,maximum-scale=1.0,minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/pro_main_info.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/mainPage.css">   

    <script src="<%=basePath%>JSP/lib/jquery-3.3.1.js"></script>
    <script src="<%=basePath%>JSP/lib/bootstrap/js/popper.js"></script>
    <script src="<%=basePath%>JSP/lib/bootstrap/js/bootstrap.min.js"></script>

</head>

<body style="min-width:994px;">
  
   <div class="container-flush" >

       <jsp:include page="/JSP/top.jsp"></jsp:include>
       <div style="background-color:#f8f9fa;"><br/></div>
       <div class="content_back_color">    
   </div>   
<br/>
        <!--页面导航-->
        <div class="container">
            <nav aria_label="breadcrumb breadcrumbback" style="height:2.2rem;">
                <ol class="breadcrumb bread_sty">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Product_homePage" id="a1" style="color:black;">主页</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=1" id="a2" style="color:black;">所有商品</a></li>
                </ol>
            </nav>
            <script>
                $(document).ready(function(){
                    $("#a1").hover(function(){
                        $("#a1").css("color","red");
                    },function(){
                        $("#a1").css("color","black");
                    });
                });
            </script>
        </div>
        <!--搜索与条件筛选-->
        <div class="container">
               <nav class="navbar navbar-expand-lg row">
                   <div class="collapse navbar-collapse" style="align:bottom;">
                       <ul class="navbar-nav mr-auto col-md-12" style="background:white;font-size:0.8em;" >
                           <li class="nav-item  col-md-2" style="height:1em;" id="searchbymajor">
                               <div class="text-right col-md-6">
                                <div class="dropdown">
                                    <div class="btn dropdown-toggle solid_border" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span style="font-size:0.8em;padding-bottom:0.5em;">按专业筛选</span>                      
                                    </div>

                                    <div class="dropdown-menu text-right drop_menu_style" id='menu' aria-labelledby="dropdownMenu">
                                       <div class="dropdown-header text-center" style="background:red;">
                                           <span style="color:white;" class="glyphicon glyphicon-th-list"></span>&nbsp;&nbsp;<h7 style="color:white;">所有</h7>
                                        </div>
                                        
                                       <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">经济学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                       <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">管理学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">珠宝学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">建筑学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">国际商学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                       <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">外国语学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown-item text-center dropdown_item_style" >
                                            <div class="text-center xueyuan"> 通信工程学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div> 
                                        
                                        <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">计算机工程学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                       <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">机械工程学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">电子信息工程学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">电气工程学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown-item text-center dropdown_item_style" id="qichexueyuan" >
                                            <div class="text-center xueyuan">汽车与交通工程学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown-item text-center dropdown_item_style">
                                            <div class="text-center xueyuan">土木工程学院</div>
                                            <div class="text-right dropdown_right_icon">
                                                <span class="glyphicon glyphicon-menu-right"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           </li>
                           <script>
                                //级联菜单
                               $(function(){
                                    var child='#child-menu';
                                    var _timeout;
                                    function over(){
                                        var _this=$(this);
                                        
                                        child2=child+(_this.index('#menu div.dropdown-item')+1);
                                        h=_this.outerHeight()*(_this.index('#menu div.dropdown-item')+2.2);
                                        $(child2)
                                            .css('left',
                                                     ($('#searchbymajor').outerWidth()-$('#dropdownMenu').outerWidth())/2-                                                                                  8+$('#qichexueyuan').outerWidth()+'px');
                                        $(child2).css('top',h+'px');
                                        $(child2).show();
                                        $(child2).hover(
                                            function(){
                                                var _child2=$(child2);
                                                var _childItems=$(child2+" div.dropdown-item");
                                                _child2.show();
                                                _childItems.each(
                                                    function(){
                                                        $(this).click(
                                                            function(){
                                                                $(child2).hide();
                                                            }
                                                        );
                                                    }
                                                );
                                                
                                                
                                            },
                                            function(){
                                                $(child2).hide();
                                            }
                                        );
                                    }
                                    function out(){
                                         $(child2).hide();
                                    }
                                    $("#menu div.dropdown-item").each(function(){
                                        var _this=$(this);
                                        _this.hover(over,out);
                                    });
                               });
                           </script>
                          
                           <!--汽车与交通学院-->
                           <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu12">
                                <div class="dropdown-item text-center dropdown_item_style">
                                    <a href="${pageContext.request.contextPath}/Product_major.action?Maj=车辆工程" style="color:black;">
                                        <div class="text-center">车辆工程</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=物流工程" style="color:black;">
                                      <div class="text-center">物流工程</div>
                                   </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=交通工程" style="color:black;">
                                    <div class="text-center">交通工程</div>
                                   </a>
                                </div>
                           </div>
                           <!--机械工程学院-->
                           <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;color:black;" id="child-menu9">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=机械工程" style="color:black;">
                                    <div class="text-center">机械工程</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=机械电子工程" style="color:black;">
                                    <div class="text-center">机械电子工程</div>
                                   </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=工业设计" style="color:black;">
                                    <div class="text-center">工业设计</div>
                                   </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=机器人工程" style="color:black;">
                                    <div class="text-center">机器人工程</div>
                                   </a>
                                </div>
                           </div>
                           <!--电子信息工程学院-->
                           <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;color:black;" id="child-menu10">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=电子信息工程" style="color:black;">
                                    <div class="text-center">电子信息工程</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=自动化" style="color:black;">
                                    <div class="text-center">自动化</div>
                                   </a>
                                </div>
                                
                           </div>
                           <!--通信工程学院-->
                           <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu7">
                                <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=通信工程" style="color:black;">
                                    <div class="text-center">通信工程</div>
                                    </a>
                                </div>
                                
                           </div>
                           <!--电气工程学院-->
                           <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu11">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=电气工程及其自动化" style="color:black;">
                                    <div class="text-center">电气工程及其自动化</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=新能源科学与工程" style="color:black;">
                                    <div class="text-center">新能源科学与工程</div>
                                   </a>
                                </div>
                                
                           </div>
                           <!--计算机工程学院-->
                            <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu8">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=网络工程" style="color:black;">
                                    <div class="text-center">网络工程</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=软件工程" style="color:black;">
                                    <div class="text-center">软件工程</div>
                                   </a>
                                </div>
                                
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=信息与计算科学" style="color:black;">
                                    <div class="text-center">信息与计算科学</div>
                                    </a>
                                </div>
                                
                                <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=计算机科学与技术" style="color:black;">
                                    <div class="text-center">计算机科学与技术</div>
                                    </a>
                                </div>
                           </div>
                           <!--建筑学院-->
                            <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu4">
                                <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=建筑学" style="color:black;">
                                    <div class="text-center">建筑学</div>
                                    </a>
                                </div>
                                
                           </div>
                           <!--土木工程学院-->
                            <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu13">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=土木工程" style="color:black;">
                                    <div class="text-center">土木工程</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=新能源科学与工程" style="color:black;">
                                    <div class="text-center">新能源科学与工程</div>
                                   </a>
                                </div>
                                
                           </div>
                           <!--管理学院-->
                            <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu2">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=会计学" style="color:black;">
                                    <div class="text-center">会计学</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=财务管理" style="color:black;">
                                    <div class="text-center">财务管理</div>
                                    </a>
                                </div>
                                
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=市场营销" style="color:black;">
                                    <div class="text-center">市场营销</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=电子商务" style="color:black;">
                                    <div class="text-center">电子商务</div>
                                    </a>
                                </div>
                                
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=工商管理" style="color:black;">
                                    <div class="text-center">工商管理</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=人力资源管理" style="color:black;">
                                    <div class="text-center">人力资源管理</div>
                                    </a>
                                </div>
                                
                           </div>
                           <!--经济学院-->
                            <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu1">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=税收学" style="color:black;">
                                    <div class="text-center">税收学</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=经济学" style="color:black;">
                                    <div class="text-center">经济学</div>
                                    </a>
                                </div>
                                
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=金融工程" style="color:black;">
                                    <div class="text-center">金融工程</div>
                                    </a>
                                </div>
                                
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=经济统计学" style="color:black;">
                                    <div class="text-center">经济统计学</div>
                                    </a>
                                </div>
                                
                                <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=国际经济与贸易" style="color:black;">
                                    <div class="text-center">国际经济与贸易</div>
                                    </a>
                                </div>
                           </div>
                           <!--外国语学院-->
                           <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu6">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=英语" style="color:black;">
                                    <div class="text-center">英语</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=日语" style="color:black;">
                                    <div class="text-center">日语</div>
                                    </a>
                                </div>
                                
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=商务英语" style="color:black;">
                                    <div class="text-center">商务英语</div>
                                    </a>
                                </div>
                                
                           </div>
                           <!--珠宝学院-->
                           <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu3">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=产品设计" style="color:black;">
                                    <div class="text-center">产品设计</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=服装与服饰设计" style="color:black;">
                                    <div class="text-center">服装与服饰设计</div>
                                    </a>
                                </div>
                                
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=宝石及材料工艺学" style="color:black;">
                                    <div class="text-center">宝石及材料工艺学</div>
                                    </a>
                                </div>
                           </div>
                           <!--国际商学院-->
                           <div class="dropdown-menu text-center drop_menu_style" style="display:none;position:absolute;top:0px;left:0px;" id="child-menu5">
                                <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=会计学" style="color:black;">
                                    <div class="text-center">会计学</div>
                                    </a>
                                </div>
                                
                               <div class="dropdown-item text-center dropdown_item_style">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=投资学" style="color:black;">
                                    <div class="text-center">投资学</div>
                                    </a>
                                </div>
                                
                                
                               <div class="dropdown-item text-center dropdown_item_style dropdown_lastrow">
                                   <a href="${pageContext.request.contextPath}/Product_major.action?Maj=国际经济与贸易" style="color:black;">
                                    <div class="text-center">国际经济与贸易</div>
                                    </a>
                                </div>
                           </div>
                           <li class="nav-item col-md-4" style="align:bottom;margin-top:0.5em;">
                               <div class="col-md-6 border-light text-right" style="display:inline;margin-top:0.3em;">
                                   按价格升序：<a class="btn btn-sm btn-light" href="javascript:void(0)" id="asc" style="text-decoration:none;color:black;border:1px solid black;"><span class="glyphicon glyphicon-sort-by-attributes"></span></a>
                               </div>
                               <div class="col-md-6 text-left" style="display:inline;">
                                   按价格降序：<a class="btn btn-sm btn-light" href="javascript:void(0)" id="desc" style="text-decoration:none;color:black;border:1px solid black;"><span class="glyphicon glyphicon-sort-by-attributes-alt"></span></a>
                               </div>
                        
                               <script>
                                    //升降序按钮样式控制
                                    $(function(){
                                       var temp1=false,temp2=false;
                                       function over(obj){
                                           obj.css("background","linear-gradient(#89eefa,white)");
                                       }
                                       function out(obj){
                                           obj.css("background","white");
                                       }
                                       $('#asc').hover(
                                           function(){over($('#asc'));},
                                           function(){if(temp1==false){out($('#asc'));}}
                                       );
                                        $('#desc').hover(
                                            function(){over($('#desc'));},
                                            function(){if(temp2==false){out($('#desc'));}}
                                        );
                                        //转jsp时<div class="row text-center" style="padding-left:1rem;" id="products">加上products
                                        //商品排序回调函数
                                        var asc = function(a , b){
                                            return  parseFloat($(a).find("span.pro_price").html().substring(1,$(a).find("span.pro_price").html().length) )-  parseFloat($(b).find("span.pro_price").html().substring(1,$(b).find("span.pro_price").html().length)) ;
                                        }
                                        
                                        var desc = function(a,b){
                                            return parseFloat($(b).find("span.pro_price").html().substring(1,$(b).find("span.pro_price").html().length) )- parseFloat($(a).find("span.pro_price").html().substring(1,$(a).find("span.pro_price").html().length) );
                                        }
                                        
                                        var sortByPrice = function(sortBy){
                                            results = $('#products div.card').sort(sortBy);
                                            $('#products').empty().append(results);
                                        }
                                        
                                       $('#asc').click(function(){
                                            temp1=true;
                                            temp2=false;
                                            $('#desc').css("background","white");
                                            $('#asc').css("background","linear-gradient(#89eefa,white)");
                                            sortByPrice(asc);
                                       });
                                       $('#desc').click(function(){
                                            temp2=true;
                                            temp1=false;
                                            $('#asc').css("background","white");
                                            $('#desc').css("background","linear-gradient(#89eefa,white)");
                                           sortByPrice(desc);
                                       });
                                    });
                               </script>
                           </li>
                           <li class="nav-item col-md-6 text-right" style="height:2em;line-height:2em;">
                               <div class="col-md-12" style="margin-left:15em;">
                                    <form action="${pageContext.request.contextPath}/Product_search.action" method="post" enctype="multipart/form-data">
                                        <div class="form-group has-feedback input-group input-group col-md-12">
                                            <input type="text" class="form-control col-md-6" placeholder="请输入书名" name="Condition" required> 
                                            <button type="submit" class="input-group-text rounded-right text-center" style="background:#f9074d;width:3em;">
                                                <span class=" glyphicon glyphicon-search form-control-feedback" style="color:white;"></span>
                                            </button>
                                        </div>
                                    </form>
                                </span>
                               </div>
                           </li>
                       </ul>
                   </div>
               </nav>

              <img src="<%=basePath%>JSP/lib/bootstrap/img/bord.jpg"  style="width:100%;height:20px;"/>

              <div style="height:1em;"></div>

              <div class="row text-center" style="padding-left:1rem;" id="products">
    	
                <c:forEach items="${PageInfo.list}" var="product">
               
                    <div class="card row_bottom" style="width:17rem;height:26rem;margin-right:0.5rem;">
                        <div style="width:17rem;height:18rem;">
                           <a href="${pageContext.request.contextPath}/Product_detail.action?Pro_ID=${product.pro_id}">
                             <img src="${product.pic_path}" class="card-img-top" style="width:15rem;height:18rem;"  alt="${product.pro_name}">
                           </a>
                        </div>

                        <div class="card-block" style="width:17rem;height:8rem;padding-top:1rem;">
                           <div class=" text-center " style="width:17rem;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                              <a href="${pageContext.request.contextPath}/Product_detail.action?Pro_ID=${product.pro_id}">
                                  <span class="card-title pro_name">${product.pro_name}</span>
                              </a>
                           </div>
                           <p class="card-text in_one_row "><span class="card-title">作者： ${product.pro_author}</span></p>
                           <span class="car-link pro_price">￥${product.pro_price}</span>
                           &nbsp;&nbsp;&nbsp;
                           <span class="text-right cark-link pro_collected text-muted">15人收藏</span>
                        </div>
                    </div>   
                            
                 </c:forEach>
                 
              </div>

            </div>
            <br/>

            <!--分页导航栏-->
        <div class="container">
            <div class="row">
<!--            <div class="col-md-3"></div>-->
                <div class="col-md-6" style="margin:0 auto;">
                    <nav aria-label="pagination" class="col-md-12">
                        <ul class="pagination col-md-6" style="margin:0 auto;">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=${CurrentPage-1}" aria-label="previous">
                                    <span>&laquo;</span>
                                    <span class="sr-only">previous;</span>
                                </a>
                            </li>
                            <li class="page-item"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">...</a></li>
                            <li class="page-item">
                                <a href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=${CurrentPage+1}" class="page-link" aria-label="next">
                                    <span>&raquo;</span>
                                    <span class="sr-only">next;</span>
                                </a>
                            </li>
                        </ul>		                        
                    </nav>
                </div>
            </div>
        </div>
        
<!--         <br/> -->
<!--              <div class="container"> -->
<%-- 	                                 共[<b>${PageInfo.allRowCount}</b>]条记录,共[<b>${PageInfo.pageCount}</b>]页,当前第[<b>${PageInfo.currentPage}</b>]页     --%>
	           
<!-- 	           当前页为不是第一页，有上一页 -->
<%-- 	           <c:if test="${PageInfo.currentPage!=1}"> --%>
<%-- 	              [<a href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=${CurrentPage-1}">上一页</a>] --%>
<%-- 	           </c:if> --%>
<!-- 	           当前页为不是最后一页，有下一页 -->
<%-- 	           <c:if test="${PageInfo.currentPage!=PageInfo.pageCount}"> --%>
<%-- 	               [<a href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=${CurrentPage+1}">下一页</a>] --%>
<%-- 	           </c:if> --%>
<!--            </div> -->
        <br/>
         
        <!--脚部-->
        <jsp:include page="/JSP/foot.jsp"></jsp:include>
        <br/>
   </div>
    
</body>
</html>