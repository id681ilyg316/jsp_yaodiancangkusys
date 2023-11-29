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
		 
		 <script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		 
        
        <script language="javascript">
             var j=0;    
            function yuangongAll()
           {
               if(j==0)
               {
                   loginService.yuangongAll(callback1);
                   j=1;
               }
               
           }
           function callback1(data)
           {

               DWRUtil.addOptions("jingshouren",data,"name","name");
           }
           function check()
           {
               if(document.formAdd.danjuhao.value=="")
               { 
                   alert("请输入销售单号");
                   return false;
               }
                if(document.formAdd.shijian.value=="")
               { 
                   alert("请输入销售时间");
                   return false;
               }
                if(document.formAdd.zongjiage.value=="")
               { 
                   alert("请输入药品总金额");
                   return false;
               }
               if(document.formAdd.jingshouren.value=="请选择负责人")
               { 
                   alert("请选择负责人");
                   return false;
               }
               document.formAdd.submit();
           }
        </script>
	</head>
<body>

				<form action="<%=path %>/chuku?type=chukuAdd" name="formAdd" method="post">
   <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         销售单号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">

						        <input type="text" name="danjuhao" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
					
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       销售时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input name="shijian" type="text"  style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px" style="width:300px;"value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"/>

						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         药品总价格：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zongjiage" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         销售负责人：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       
						       <select style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;" name="jingshouren" id=jingshouren onclick="yuangongAll()">
									              <option value="请选择负责人">请选择负责人</option>
									          </select>
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
						       <input type="submit" value="提交" onclick="return check();"/> 
						       &nbsp;
						    </td>
						</tr>
					 </table>
</form>

  </body>
  
  

</html>
