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
        
        <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<%=path %>/css/select.css" rel="stylesheet" type="text/css" />
        
        <script language="javascript">
          function check()
           {
               if(document.formAdd.mingcheng.value=="")
               { 
                   alert("请输入单位名称");
                   return false;
               }
               if(document.formAdd.dizhi.value=="")
               { 
                   alert("请输入地址");
                   return false;
               }
               if(document.formAdd.lianxiren.value=="")
               { 
                   alert("请输入联系人");
                   return false;
               }
               if(document.formAdd.dianhua.value=="")
               { 
                   alert("请输入联系电话");
                   return false;
               }
               if(document.formAdd.youbian.value=="")
               { 
                   alert("请输入邮编");
                   return false;
               }
                if(document.formAdd.chuanzhen.value=="")
               { 
                   alert("请输入传真");
                   return false;
               }
                if(document.formAdd.youxiang.value=="")
               { 
                   alert("请输入电子邮箱");
                   return false;
               }
               return true;
           }
        </script>
	</head>
<body>

		<form action="<%=path %>/gongyingshang?type=gongyingshangAdd" name="form1" method="post">
   <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			
	
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         供应商名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">

						        <input type="text" name="mingcheng" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
		
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         供应商地址：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="dizhi" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						联系人姓名：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="lianxiren" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        联系电话：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="dianhua" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         传真：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="chuanzhen" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
							<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         邮编：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="youbian" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
							<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         电子邮箱：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="youxiang" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
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
