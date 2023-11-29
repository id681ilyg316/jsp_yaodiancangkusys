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
		<script type="text/javascript" src="<%=path %>/js/public.js"></script>
		<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function chukuMingxiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/chuku?type=chukuMingxiDel&id="+id;
               }
           }
           
       </script>
	</head>

	<body>

<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">药品名称></td>
					<td width="15%">数量</td>
					<td width="10%">备注</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.chukuMingxiList}" var="chukuMingxi">
				<tr>
					<td bgcolor="#FFFFFF" align="center">
						${chukuMingxi.goods_name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${chukuMingxi.shuliang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chukuMingxi.beizhu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<form action="" name="formAdd" method="post">
						   <input type="button" value="删除" onclick="chukuMingxiDel(${chukuMingxi.id})"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
	</body>
</html>
