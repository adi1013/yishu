<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    
%> 
<div class="container bg-light">
           <div class="foot_top"></div>
            <div class="row">
                <div class="col-md-5" style="">
                    <div class="text-center">
                        <h4 style="">联系我们</h4>
                        <div style="border-bottom:1px solid gray;"></div>
                        <div class="col-md-12 text-center">
                            <div class="col-md-10 text-left"> 
                                <div>
                                    <span>电话&nbsp;<span class="glyphicon glyphicon-earphone"></span>：</span>
                                    <span>0754-88888888</span>
                                </div>
                                <div>
                                    <span>邮箱&nbsp;<span class="glyphicon glyphicon-envelope"></span>：</span>
                                    <span>yishu.gcu.edu.cn</span>
                                </div>
                                <div>
                                    <span style=""></span>
                                    <span>地址&nbsp;<span class="glyphicon glyphicon-plane"></span>：</span>
                                    <span>广州市花都区新华街道学府路1号</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="col-md-2">
                   <div class="text-center">
                        <img src="<%=basePath%>JSP/lib/bootstrap/img/font_under_logo.jpg" width='70%;'/>
                    </div>
                </div>
                <div class="col-md-5" style="">
                    <div class="text-center">
                        <h4>用户指南</h4>
                        <div style="border-bottom:1px solid gray;"></div>
                        <div class="container">
                            <div class="col-md-9 text-right">
                                <div style="text-decoration:none;font-size:1rem;">
                                   <div style="height:2rem;line-height:2.4rem;">
                                       <span style="padding-right:10%;"><a href="#" style="color:black;">如何买书</a></span>
                                       <span style="color:#ccc;">|</span>
                                       <span style="padding-left:10%;"><a href="#" style="color:black;">信息修改</a></span>
                                   </div>
                                   <div style="height:2rem;line-height:2.4rem;">
                                       <span style="padding-right:10%;"><a href="#" style="color:black;">关于我们</a></span>
                                       <span style="color:#ccc;">|</span>
                                       <span style="padding-left:10%;"><a href="#" style="color:black;">加入我们</a></span>
                                   </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-12" style="background:#d1cfd0;">
                        <span class="glyphicon glyphicon-paperclip"></span>
                        <span style="margin-right:5%;">友情链接：</span>
                        <span style="margin-right:5%;"><a href="http://jwxt.gcu.edu.cn">华广教务系统</a></span>
                        <span><a href="#">华南理工大学广州学院官网</a></span>
                </div>
            </div>
        </div>
        <br/>