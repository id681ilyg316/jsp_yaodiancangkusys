<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<script type="text/javascript" src="<%=path %>/js/public.js"></script>
		<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function rukuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/ruku?type=rukuDel&id="+id;
               }
           }
           function rukuMingxiAdd(ruku_id)
           {
                var url="<%=path %>/admin/ruku/rukuMingxiAdd.jsp?ruku_id="+ruku_id;
              	 window.location.href=url;
           }
           
           function rukuMingxiMana(ruku_id)
           {
                var url="<%=path %>/ruku?type=rukuMingxiMana&ruku_id="+ruku_id;
                   	 window.location.href=url;
           }
       </script>
	</head>
	<body>

<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">采购单据号</td>
					<td width="15%">入库时间</td>
					<td width="10%">总金额</td>
					<td width="10%">负责人</td>
					<td width="10%">备注</td>
					<td width="20%">明细</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.rukuList}" var="ruku">
				<tr>
					<td bgcolor="#FFFFFF" align="center">
						${ruku.danjuhao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${ruku.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ruku.zongjiage}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ruku.jingshouren}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${ruku.beizhu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a style="color: red" href="#" onclick="rukuMingxiMana(${ruku.id})">采购明细</a>
					    &nbsp;&nbsp;&nbsp;      
					    <a style="color: red" href="#" onclick="rukuMingxiAdd(${ruku.id})">添加采购明细</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						   <input type="button" value="删除" onclick="rukuDel(${ruku.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>

	
			  
	</body>
</html>
