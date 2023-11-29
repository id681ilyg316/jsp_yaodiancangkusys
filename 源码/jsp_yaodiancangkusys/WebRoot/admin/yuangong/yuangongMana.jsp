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
        <script language="javascript">
           function yuangongDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/yuangong?type=yuangongDel&id="+id;
               }
           }
       </script>
	</head>

<body>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">姓名</td>
					<td width="3%">性别</td>
					<td width="10%">年龄</td>
					<td width="15%">电话</td>
					<td width="10%">住址</td>
					<td width="10%">职位</td>
					<td width="17%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.yuangongList}" var="yuangong">
				<tr>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.sex}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.age}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.tel}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.address}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.zhiwei}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <input type="button" value="删除" onclick="yuangongDel(${yuangong.id})"/>
					   </td>
				</tr>
				</c:forEach>
			</table>
			
	</body>
</html>
