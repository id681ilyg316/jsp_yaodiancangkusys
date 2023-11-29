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
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function catelogDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/catelog?type=catelogDel&id="+id;
               }
           }
           
           function catelogAdd()
           {
                 var url="<%=path %>/admin/catelog/catelogAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body>
		<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">基本信息管理</a></li>
    <li><a href="#">商品分类管理</a></li>
    </ul>
    </div>
        <div class="rightinfo">
			<table class="tablelist">
		
				    <tr align="center"  bgcolor="#417EB5"    height="22">
					<td width="50%"><span style="color: #fff;">名称</span></td>
					<td width="50%"><span style="color: #fff;">操作</span></td>
		        </tr>	
				<c:forEach items="${requestScope.catelogList}" var="catelog">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${catelog.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="catelogDel(${catelog.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
	 <ul class="toolbar" style="margin-bottom: 10px;">
			    	    <li><a href="<%=path %>/admin/catelog/catelogAdd.jsp" class="tablelink"><span><img src="<%=path %>/images/t01.png" /></span>新增</a></li>
			  </ul>
		        </div>
	</body>
</html>
