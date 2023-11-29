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
           <LINK href="<%=path %>/CSS.css" type=text/css rel=stylesheet>
        <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script language="javascript">
           var i=0;
           var j=0;
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
            function gongyingshangAll()
           {
               if(j==0)
               {
                   loginService.gongyingshangAll(callback1);
                   j=1;
               }
               
           }
           function callback1(data)
           {
               DWRUtil.addOptions("chandi",data,"mingcheng","mingcheng");
           }
           function check()
           {
               if(document.formAdd.catelog_id.value==0)
               { 
                   alert("请选择药品类别");
                   return false;
               }
               if(document.formAdd.name.value=="")
               { 
                   alert("请输入药品名称");
                   return false;
               }
               if(document.formAdd.danwei.value=="")
               { 
                   alert("单位");
                   return false;
               }
                if(document.formAdd.xinghao.value=="")
               { 
                   alert("型号");
                   return false;
               }
               return true;
           }
        </script>
	</head>
 <body>

		<form action="<%=path %>/goods?type=goodsAdd" name="form1" method="post">
   <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			
					<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         药品类别：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						      <select style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;" name="catelog_id" id="catelog_id" onclick="catelogAll()">
									              <option value="0">请选择类别</option>
									          </select>
									         
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         药品名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">

						        <input type="text" name="name" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						      供应商：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <select style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;" name="chandi" id="chandi" onclick="gongyingshangAll()">
									              <option value="请选择类别">请选择供应商</option>
									          </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         单位：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="danwei" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         保质期：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="baozhiqi" size="20" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"/>
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
