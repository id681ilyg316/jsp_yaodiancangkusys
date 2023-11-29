<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<jsp:directive.page import="java.text.SimpleDateFormat"/> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
        <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script language="javascript">
           var i=0;
           function catelogAll()
           {
               if(i==0)
               {
                   loginService.catelogAll(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           
           function goodsAll(catelog_id)
           {
                loginService.goodsAll1(catelog_id,callback1);
           }
           function callback1(data)
           {
               DWRUtil.removeAllOptions("goods_id");
               DWRUtil.addOptions("goods_id",{0:'--请选择商品-'});
               DWRUtil.addOptions("goods_id",data,"id","name");
           }
           
           
           function check()
           {
               if(document.formAdd.goods_id.value==0)
               { 
                   alert("请选择商品");
                   return false;
               }
               if(document.formAdd.shijishuliang.value=="")
               { 
                   alert("请输入实际数量");
                   return false;
               }
               if(document.formAdd.xitongshuliang.value=="")
               { 
                   alert("请输入系统数量");
                   return false;
               }
               return true;
           }
        </script>
	</head>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">库存管理</a></li>
    <li><a href="#">库存盘存</a></li>
    </ul>
    </div>
			<form action="<%=path %>/pancun?type=pancunAdd" name="formAdd" method="post">
  <div id="usual1" class="usual"> 
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">
    <li><label>盘存时间<b>*</b></label>
						        <input class="dfinput" style="width:300px;" name="shijian" type="text" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"/>
						</li>
 <li><label>盘存商品<b>*</b></label> 
							                  <select style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:150px;"  name="catelog_id" id="catelog_id" onclick="catelogAll()" onchange="goodsAll(this.value)">
									              <option value="0">请选择商品分类</option>
									          </select>
									          <select style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:300px;"  name="goods_id" id="goods_id">
									              <option value="0">--请选择商品--</option>
									          </select>
							          
							                
			</li>
 <li><label>实际数量<b>*</b></label> 
						        <input value="0" type="text"  class="dfinput" style="width:300px;" name="shijishuliang" size="20" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
</li>
 <li><label>系统数量<b>*</b></label> 
						        <input value="0" type="text"  class="dfinput" style="width:300px;" name="xitongshuliang" size="20" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
</li>
 <li><label>盘存盈亏<b>*</b></label> 
						        <select name="type1" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:150px;" >
						            <option value="盘盈">盘盈</option>
						            <option value="盘亏">盘亏</option>
						        </select>
</li>
<li><label>备注<b></b></label> 
						        <input type="text"  class="dfinput" style="width:300px;" name="beizhu" size="50"/>
</li>
<li><label><b></b></label> 
						       <input type="submit" class="btn" value="提交" onclick="return check()"/>&nbsp; 
						   
			</form>
			 </ul>
    
    </div> 
	</div> 
			   </body>
</html>
