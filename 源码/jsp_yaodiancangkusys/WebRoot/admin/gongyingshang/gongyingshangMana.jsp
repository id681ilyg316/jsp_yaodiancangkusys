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
           function gongyingshangDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/gongyingshang?type=gongyingshangDel&id="+id;
               }
           }
       function gongyingshangAdd()
           {
            
                   window.location.href="<%=path %>/admin/gongyingshang/gongyingshangAdd.jsp";
           
           }
       </script>
	</head>

	<body>
	<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">单位名称</td>
					<td width="15%">地址</td>
					<td width="15%">联系人</td>
					<td width="15%">电话</td>
					<td width="10%">邮编</td>
					<td width="10%">传真</td>
					<td width="10%">电子邮箱</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.gongyingshangList}" var="gongyingshang">
				<tr>
					<td bgcolor="#FFFFFF" align="center">
						${gongyingshang.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${gongyingshang.dizhi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${gongyingshang.lianxiren}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${gongyingshang.dianhua}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${gongyingshang.youbian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${gongyingshang.chuanzhen}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${gongyingshang.youxiang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
		
						   <input type="button"  value="删除" class="tablelink"  onclick="gongyingshangDel(${gongyingshang.id})"/>
						
					</td>
				</tr>
				</c:forEach>
			</table>
			
				<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" style="margin-top:8px">
				<tr align="center"  height="22">
				<td  align="left">
		
						     <input type="button"  value="添加" class="tablelink"  onclick="gongyingshangAdd()"/>
						
					</td>
			</tr>
			</table>

	</body>
</html>
