<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/comm/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    
%>  
<!-- 对应session的user -->
<c:set var="user" value="${User}"></c:set>
<!-- 头部登录栏  -->
    <ul class="nav nav-pills bg-danger justify-content-end nav_height" role="tablist">
    <c:if test="${empty user}">
      <li class="nav-item">
        <a class="nav-link tologin_and_register" id="login-bills" role="tab" href="javascript:void(0);">
            <span class="glyphicon glyphicon-log-in"></span>&nbsp;
            登录
        </a>
      </li>
      <li>&nbsp;&nbsp;</li>
      <li class="nav-item" style="margin-right:3%;">
        <a class="nav-link tologin_and_register" id="register-pills" href="javascript:void(0);">
            注册&nbsp;
            <span class="glyphicon glyphicon-log-out"></span>
          </a>
      </li>
      </c:if>
      
      <!-- 头部 差获取名字参数 整合得到用户名  -->
	   <c:if test="${not empty user}">
	   	   <li class="nav-item" style="margin-right:2%;font-size:1rem;">
                   <i style="color:white;">
                       	亲爱的
                   </i>
                   <a href="#" style="text-decoration:none;">${user.userName}</a>
                   <i style="color:white;">
                      	 ，欢迎您&nbsp;
                       <span class="glyphicon glyphicon-flag"></span>&nbsp;
                       <span class="glyphicon glyphicon-flag"></span>&nbsp;
                       <span class="glyphicon glyphicon-flag"></span>&nbsp;
                    </i>
               </li>
               <li class="nav-item" style="margin-right:3%;">
                   <a href="${pageContext.request.contextPath}/User_loginOut.action" class="nav-link" style='background:white;height:70%;line-height:70%;margin-top:8%;padding-top:10%;color:#505252;font-size:0.8rem;' >
	                   <span class="glyphicon glyphicon-off" style="color:red"></span>
	                   &nbsp;退出
                   </a>
               </li>
	   </c:if>
    </ul>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="col-md-4 text-right">
            <img src="<%=basePath%>JSP/lib/bootstrap/img/logo.jpg" class="nav_logo" width="190px" height="80px" alt="易书网">
        </div>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav col-md-8">
               <li class="nav-item active text-center col-md-3">
                    <a class="nav-link" style="font-weight:bolder;color:#f15b28;" href="${pageContext.request.contextPath}/Product_homePage"><span class="glyphicon glyphicon-home"></span>&nbsp;首页&nbsp;<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active text-center col-md-3">
                    <a class="nav-link" style="font-weight:bolder;color:#f15b28;" href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=1"><span class="glyphicon glyphicon-road"></span>&nbsp;二手市场<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active text-center col-md-3">
                    <a class="nav-link" style="font-weight:bolder;color:#f15b28;" href="${pageContext.request.contextPath}/Product_allProduct.action?CurrentPage=1"><span class="glyphicon glyphicon-book"></span>&nbsp;所有商品<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item text-center col-md-3">
                    <a class="nav-link" style="font-weight:bolder;color:#f15b28;" href="${pageContext.request.contextPath}/Product_listUI.action?shopkeeperId=${user.ID}"><span class="glyphicon glyphicon-user"></span>&nbsp;个人中心</a>
                </li>
            </ul>
        </div>
    </nav>
<div class="modal fade" style="top:30%;" id="toLogin" tabindex="-1" role="dialog" aria-labelledby="login_title" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger">
                    <div class="modal-title tolog_reg_mod_title" id="login_title">
                        <span class="glyphicon glyphicon-log-in"></span>
                        &nbsp;&nbsp;用户登录
                    </div>
                    <button type="button" class="close" id="close_login">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-flush">
                          <form role="form" method="post" action="User_login.action">
                            <div class="form-group has-feedback input-group input-group-sm col-md-12">
                                <span class="input-group-text rounded-left clear_right-radius">
                                    <span class=" glyphicon glyphicon-user form-control-feedback"></span>
                                </span>  
                                <input type="text" class="form-control col-md-6" placeholder="请输入用户名" id="username" name="SNO" required> 
                            </div>

                            <div class="form-group has-feedback input-group input-group-sm col-md-12">
                                <span class="input-group-text rounded-left clear_right-radius">
                                    <span class=" glyphicon glyphicon-lock form-control-feedback"></span>
                                </span>
                                <input type="password" class="form-control col-md-6" placeholder="请输入密码" id="password" name="Password" required> 
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-7 text-right">
                                    <a class="tologin_a" id="toRegister_a" href="javascript:void(0);">还没有账号，去注册>>></a>
                                </div>
                            </div>
<!--                            <div class="col-md-12">-->
								<br>
                                <div class="col-md-8 text-left ">
                                    <button type="submit" id="getLogin" class="btn btn-danger col-md-11 btn-sm">登录</button>
                                </div>
<!--                            </div>-->
                        </form>
                     </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        
//         $(function(){
//             $("#toLogin").modal();
//         });  
        $(function(){
            $("#login-bills").on('click',function(){
                $("#toLogin").modal();
            });

            $("#close_login").on('click',function(){
                $("#toLogin").modal("hide");
            });

            $("#register-pills").on('click',function(){
                if($("#toLogin")){
                    $("#close_login").trigger("click");
                }
                $("#toRegister").modal();
            });

            $("#toRegister_a").on('click',function(){
                $("#close_login").trigger("click");
                $("#toRegister").modal();
            });
        });
//        $.validator.setDefaults({
//            submitHandler:function(){
//                alert('提交事件');
//            }
//        });
        //表单验证
        $().ready(function(){
            $("#loginform").validate({
                    errorElement:"span",
                    errorPlacement:function(error,element){
                    					if(element.attr('name')=='SNO')
                    						 error.insertAfter("#username");
                    						
                    					if(element.attr('name')=='Password')
                    						 error.insertAfter('#password');
                                    },
                    errorClass:"error",
                    success:function(span){
                        span.addClass("valid").insertAfter("#errorinfo")
                    },
                    rules:{
                    		SNO:{
                                    required:true,
                                    minlength:12
                                },
                                Password:{
                                    required:true,
                                    minlength:8,
                                    maxlength:15
                                }
                            },
                    messages:{
                                SNO:{
                                    required:"请输入学号",
                                    minlength:"<span class='glyphicon glyphicon-remove-sign'></span>请输入正确的学号",
                                },
                                Password:{
                                    required:"请输入密码",
                                    minlength:"<span class='glyphicon glyphicon-remove-sign'></span>密码须包含8-15个字符",
                                    maxlength:"<span class='glyphicon glyphicon-remove-sign'></span>密码须包含8-15个字符"
                                }
                            },
//                     debug:true
//                    submitHandler:function(form){
//                                form.submit();
//                                alert($("#password").html());
//                            }
                });
            });
    </script>
    
    <div class="modal fade" style="top:30%;" id="toRegister" tabindex="-1" role="dialog" aria-labelledby="register_title" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger">
                    <div class="modal-title tolog_reg_mod_title" id="register_title">
                        <span class="glyphicon glyphicon-log-out"></span>
                        &nbsp;&nbsp;用户注册
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span arid-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" >
                    <div class="container-flush">
                        <form role="form" action="User_add.action" method="post">
                        	
                        	<div class="form-group has-feedback input-group input-group-sm col-md-8">
                                <span class="input-group-text rounded-left clear_right-radius">
                                    <span class=" glyphicon glyphicon-user form-control-feedback"></span>
                                </span>  
                                <input name="SNO" type="text" class="form-control" placeholder="输入学号" required> 
                            </div>
                        	
                            <div class="form-group has-feedback input-group input-group-sm col-md-8">
                                <span class="input-group-text rounded-left clear_right-radius">
                                    <span class=" glyphicon glyphicon-user form-control-feedback"></span>
                                </span>  
                                <input name="UserName" type="text" class="form-control" placeholder="输入用户名..." required> 
                            </div>

                            <div class="form-group has-feedback input-group input-group-sm col-md-8">
                                <span class="input-group-text rounded-left clear_right-radius">
                                    <span class=" glyphicon glyphicon-lock form-control-feedback"></span>
                                </span>
                                <input name="Password" type="password" class="form-control" placeholder="输入密码..." required> 
                            </div>

                           <div class="form-group has-feedback input-group input-group-sm col-md-8">
                                <span class="input-group-text rounded-left clear_right-radius">
                                    <span class=" glyphicon glyphicon-lock form-control-feedback"></span>
                                </span>
                                <input type="password" class="form-control" placeholder="再次输入密码..." required> 
                            </div>

                           <div class="form-group has-feedback input-group input-group-sm col-md-8">
                                <span class="input-group-text rounded-left clear_right-radius">
                                    <span class=" glyphicon glyphicon-phone form-control-feedback"></span>
                                </span>
                                <input name="MobilePhone" type="text" class="form-control" placeholder="请输入手机号码..." required> 
                            </div>

                           
                            <div class="text-right col-md-8">
<!--                                 <a class="btn btn-danger btn-sm col-md-12" href="#">注册</a> -->
                                <input class="btn btn-danger btn-sm col-md-12" type="submit" value="注册" />
                            </div>
                        </form>
                     </div>
                </div>
            </div>
        </div>
    </div>