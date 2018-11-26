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
    <meta charset="UTF-8">
    <title>商品编辑页</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>JSP/lib/bootstrap/css/mainPage.css"/>
    <script src="<%=basePath%>JSP/lib/jquery-3.3.1.js"></script>
    <script src="<%=basePath%>JSP/lib/bootstrap/js/popper.js"></script>
    <script src="<%=basePath%>JSP/lib/bootstrap/js/bootstrap.js"></script>
    <script src="<%=basePath%>JSP/lib/bootstrap/js/bootstrapValidator.min.js"></script>
	
</head>
<body style="height:950px;">
    <c:set var="user" value="${User}"></c:set> 
    <!-- 头部 -->
    <jsp:include page="/JSP/top.jsp"></jsp:include>
    <div style="background-color:#f8f9fa;"><br/></div>
    <div class="content_back_color">
        <!--导航栏区-->
            <div class="container" style="height:2%;">
               <nav aria_label="breadcrumb breadcrumbback" style="height:2.2rem;">
                    <ol class="breadcrumb pro_det_bre">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Product_homePage" style="color:black;">主页</a></li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Product_listUI.action?shopkeeperId=${user.ID}" style="color:black;">个人中心</a></li>
                        <li class="breadcrumb-item active"><a>商品编辑(带  *必填)</a></li>
                    </ol>
                </nav>
                <img src="<%=basePath%>JSP/lib/bootstrap/img/bord2.jpg"  style="width:100%;height:20px;"/>
            </div>

        <div class="container-flush content_back_color" style="height:85%;">
        <form id = "Pro_details" class="form-horizontal" action="Product_edit?shopkeeperId=${user.ID}&picPath=${product.pic_path}" method="post" enctype="multipart/form-data">
            <div class="container" style="height:80%;margin-top:2%;">
                <div class="row" style="height:52%;">
                    <div class="col-md-6" style="height:100%;">
                      <div class="form_content">

                      <!--表单部分-->
                      
                           <fieldset>
                                <legend class="text-center">*图片修改</legend>
                            <!--图片文件选择-->
                                <div class="col-md-7 float-left" id='upload'>
                                    <div class="form-group input-group pro_details_txt">
                                        <label class="col-md-3 input-group-prepend">*封面</label>
                                        <input type="file" name="pro_pic" class="form-control-file col-md-9" id="file1" style="height:1.8rem;">
                                    </div>
                                    <div class="form-group input-group pro_details_txt">
                                        <label class="col-md-3 input-group-prepend">细节图</label>
                                        <input type="file" class="form-control-file col-md-9" style="height:1.8rem;">
                                    </div>
                                    <div class="form-group input-group pro_details_txt">
                                        <label class="col-md-3 input-group-prepend">细节图</label>
                                        <input type="file" class="form-control-file col-md-9" style="height:1.8rem;">
                                    </div>
                                    <div class="form-group input-group pro_details_txt">
                                        <label class="col-md-3 input-group-prepend">细节图</label>
                                        <input type="file" class="form-control-file col-md-9" style="height:1.8rem;">
                                    </div>
                                </div>
                            <!-- 图片显示-->
                                <div class="col-md-5 float-right" style="height:100%;" id="img-thumb">
                                    <div class="col-md-12 img-thum_out_con" >
                                        <img src="${product.pic_path}" id="view0" class="img-thumbnail img-thum_con" data-toggle="tooltip" data-placement="bottom" title="点击查看大图">
                                        <img src="<%=basePath%>JSP/lib/bootstrap/img/init.jpg" id="view1" class="img-thumbnail img-thum_con" data-toggle="tooltip" data-placement="bottom" title="点击查看大图">
                                    </div>
                                    <div class="col-md-12 img-thum_out_con">
                                        <img src="<%=basePath%>JSP/lib/bootstrap/img/init.jpg" id="view2" class="img-thumbnail img-thum_con" data-toggle="tooltip" data-placement="bottom" title="点击查看大图">
                                        <img src="<%=basePath%>JSP/lib/bootstrap/img/init.jpg" id="view3" class="img-thumbnail img-thum_con" data-toggle="tooltip" data-placement="bottom" title="点击查看大图"/>
                                    </div>
                                </div>
                                <div style="clear:both;"></div>
                            </fieldset>
                            
                            </div>
                        </div>

                       <div class="modal fade bd-example-modal-sm" id="imgModal" aria-hidden="true" style="top:20%;">
                            <div class="modal-dialog">
                                <div class="modal-content" >
                                    <div class="modal-header">
                                        <h5 style="font-weight:bolder;">图片预览</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <img src="" class="modalImg" id="bigImg">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6" style="height:100%;margin-top:5%;">
                            <div class="form_content">
                               <fieldset>
                                    <legend class="text-center optional">*书本信息修改</legend>

                                       <!--文本信息录入--->
                                       <!-- 主键 -->
									   <div><input type="hidden" value="${product.pro_id}" name="Pro_id"/>
									   </div>
                                       <div><input type="hidden" value="${product.pro_pubishTime}" name="Pro_pubishTime"/>
									   </div>
                                        <div class="form-group pro_details_txt">
                                            <label class="col-md-2 control-label">*书本名</label>
                                            
                                            <input type="text" onfocus=this.blur()  value="${product.pro_name}" class="form-control col-md-2" name="Pro_name">
                                            
                                        </div>
                                        <div class="form-group pro_details_txt">
                                            <label class="col-md-2 control-label">出版社</label>
                                            <input type="text" value="${product.pro_press}" class="form-control col-md-2" name="Pro_press">
                                        </div>
                                        <div class="form-group pro_details_txt">
                                            <label class="col-md-2 control-label">作者</label>
                                            <input type="text" value="${product.pro_author}" class="form-control col-md-2" name="Pro_author">
                                        </div>
                                        <!--isbn与版本可能数据库未配-->
                                        <div class="form-group pro_details_txt">
                                            <label class="col-md-2 control-label">ISBN</label>
                                            <input type="text" ${product.pro_isbn} class="form-control col-md-8"  name="Pro_isbn">
                                        </div>
                                        <div class="form-group pro_details_txt">
                                            <label class="col-md-2 control-label">版本</label>
                                            <input type="text" ${product.pro_version} class="form-control col-md-8"  name="Pro_version">
                                        </div>
                                        <div class="form-group pro_details_txt">
                                            <label class="col-md-2 control-label">适合专业</label>
<%--                                             <input type="text" value="${product.major}" class="form-control col-md-2" name="major"> --%>
                                            <select name="major" class="form-control col-md-8">
											    <option value="0" selected="selected">${product.major}</option>
												<option value="计算机">计算机</option>
												<option value="外国语">外国语</option>
												<option value="经济管理">经济管理</option>
												<option value="机械">机械</option>
												<option value="其他">其他</option>
												<option value="其他">通用</option>
											</select>
                                        </div>
                                        <div class="form-group input-group text-right pro_details_txt">
                                             <label class="col-md-2 input-group-prepend">*价格</label>
                                             <input type="text" value="${product.pro_price}" class="form-control col-md-2"  name="Pro_price">
                                             <span class="col-md-1"></span>
                                             <label class="col-md-2 input-group-prepend">*数量</label>
                                             <input type="text" value="${product.pro_num }" class="form-control col-md-2"  name="Pro_num">
                                        </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <script>
                            //图片实时校检拦截与显示
                            $(function(){
                                $('#upload input.form-control-file').each(function(){
                                    var _this = $(this);
                                    _this.bind('input propertychange change',function(event){
                                        if(_this.val().length>0){
                                           var oSuffix = _this.val().substring(_this.val().lastIndexOf('.'),_this.val().length);
                                            if(oSuffix != '.jpg' && oSuffix != '.png' && oSuffix != '.gif'){
                                                _this.val('');
                                            }
                                            else{
                                                var oView='#view';
                                                var temp = oView+_this.index('#upload input.form-control-file');//id
                                                var oFr = new FileReader();
                                                oFr.readAsDataURL(_this[0].files[0]);
                                                oFr.onloadend = function(event){
                                                    var oEvent = event||ev;
                                                    $(temp)[0].src = oEvent.target.result;
                                                    $("[data-toggle='tooltip']").tooltip();
                                                }
                                            }
                                        }
                                    });
                                }); 
                            });
                            //图片放大显示
                            $(function(){
                                $("#img-thumb img.img-thumbnail").each(function(){
                                    var _this = $(this);
                                    _this.on("click",function(){
                                        var oImgsrc=_this[0].src;
                                        oName = oImgsrc.substring(oImgsrc.lastIndexOf('/'),oImgsrc.lastIndexOf('.'));
                                        if(oName != '/init'){
                                            $("#bigImg")[0].src=_this[0].src;
                                            $("#imgModal").modal({
                                                backdrop: true,
                                                keyboard: false,
                                                show:true
                                            });
                                        }
                                    });
                                });
                            });
                        </script>
                        <div class="row" style="height:38%;">
                            <div class="col-md-7" style="height:100%;">
                                <div class="form_content" style="padding-right:30px;">
                                   <fieldset>
                                        <legend class="text-center optional2">*书本简介</legend>
                                        <div class="form-group" style="font-size:0.8rem;height:6rem;">
                                            <label class="col-md-2">简介</label>
                                            <textarea class="col-md-9" style="height:6rem;" placeholder="请输入少于200个字符"></textarea>
                                        </div>
                                        <div class="form-group input-group" style="height:2rem;line-height:2rem;">
                                            <span class="col-md-3"></span>
                                            <input class="btn btn-sm col-md-2 border border-danger pro_submit" type="submit" value="提交商品"/>
                                            <span class="col-md-2"></span>
                                            <input class="btn btn-sm col-md-2 border border-info pro_reset" type="reset" value="重置商品"/>
                                        </div>
                                    </fieldset>
                               

                            <script>
                                //文本框信息校检

                            </script>
                            </div>
                        </div>
                    </div>
                    
            </div>
        </form>       
        </div>
        <br/>
         <!-- 导入尾部 -->
         <jsp:include page="/JSP/foot.jsp"></jsp:include>
    </div>
</body>
</html>