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
        <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
		
		
        <script language="javascript">
           function goodsDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/goods?type=goodsDel&id="+id;
               }
           }
              function goodsAdd()
           {
            
                   window.location.href="<%=path %>/admin/goods/goodsAdd.jsp";
           
           }
       </script>
	</head>

<body>			
	<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
				<td width="15%">药品类别</td>
					<td width="15%">药品名称</td>
					<td width="15%">供应商</td>
					<td width="15%">单位</td>
					<td width="15%">保质期</td>
					<td width="10%">备注</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.goodsList}" var="goods">
				<tr align='center' bgcolor="#FFFFFF"  onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td bgcolor="#FFFFFF" align="center">
						${goods.catelog_name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${goods.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${goods.chandi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${goods.danwei}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${goods.baozhiqi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${goods.beizhu}
					</td>
					<td  align="center">
		
						     <input type="button"  value="删除" class="tablelink"  onclick="goodsDel(${goods.id})"/>
						
					</td>
				</tr>
				</c:forEach>
			
			</table>
	<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" style="margin-top:8px">
				<tr align="center"  height="22">
				<td  align="left">
		
						     <input type="button"  value="添加" class="tablelink"  onclick="goodsAdd()"/>
						
					</td>
			</tr>
			</table>
	</body>




</html>
