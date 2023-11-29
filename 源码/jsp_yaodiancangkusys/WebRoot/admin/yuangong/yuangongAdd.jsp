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
        
        <script language="javascript">
         function check()
           {
               if(document.formAdd.name.value=="")
               { 
                   alert("请输入姓名");
                   return false;
               }
               if(document.formAdd.age.value=="")
               { 
                   alert("请输入年龄");
                   return false;
               }
               if(document.formAdd.tel.value=="")
               { 
                   alert("请输入联系电话");
                   return false;
               }
               if(document.formAdd.address.value=="")
               { 
                   alert("请输入地址");
                   return false;
               }
                if(document.formAdd.zhiwei.value=="")
               { 
                   alert("请输入职位");
                   return false;
               }
               return true;
           }
        </script>
	</head>
<body>

	<form action="<%=path %>/yuangong?type=yuangongAdd" name="formAdd" method="post">
   <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         姓名：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">

						        <input type="text" name="name" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
					
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       性别：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						             <input type="radio" name="sex"   value="男" checked="checked"/>男
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <input type="radio" name="sex"  value="女"/>女
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        年龄：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="age" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        联系电话：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="tel" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						      家庭地址：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">

						        <input type="text" name="address" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
							<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						      职位：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">

						        <input type="text" name="zhiwei" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
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
