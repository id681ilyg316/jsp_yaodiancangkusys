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
        <script language="javascript">
        </script>
	</head>

	<body>

<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">

					<td width="33%">药品名称</td>
					<td width="33%">库存数量</td>
					<td width="33%">库存报警(<50)</td>
		        </tr>	
				<c:forEach items="${requestScope.kucunList}" var="kucun">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${kucun.goods_name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${kucun.kucun}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${kucun.kucun<50}">
						    <font color="red">报警</font>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>

	</body>
</html>
