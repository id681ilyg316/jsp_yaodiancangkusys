<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 

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
               DWRUtil.addOptions("goods_id",data,"id","name");
           }
           
           
           function check()
           {
               if(document.formAdd.goods_id.value==0)
               { 
                   alert("请选择药品");
                   return false;
               }
               return true;
           }
        </script>
	</head>
	
<form action="<%=path %>/chuku?type=chukuMingxiAdd" name="formAdd" method="post">
   <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         药品类型：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
 <select  style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;"  style="width:300px;" name="catelog_id" id="catelog_id" onclick="catelogAll()" onchange="goodsAll(this.value)">
									              <option value="0">请选择药品类型</option>
									          </select>
						    </td>
						</tr>
					
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       药品：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <select style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:300px;"  name="goods_id" id="goods_id">
									              <option value="0">--请选择药品--</option>
									          </select>

						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         销售数量：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						     
						        <input type="text" name="shuliang" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
		
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         备注：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">

						        <input type="text" name="beizhu" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						           <input type="hidden" name="chuku_id" value="<%=request.getParameter("chuku_id") %>"/>
						       <input type="submit" value="提交" onclick="return check();"/> 
						       &nbsp;
						    </td>
						</tr>
					 </table>
</form>
  </body>
 
</html>

