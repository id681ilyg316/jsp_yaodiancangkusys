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
           function pancunDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/pancun?type=pancunDel&id="+id;
               }
           }

       </script>
	</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">库存管理</a></li>
    <li><a href="#">库存盘存记录</a></li>
    </ul>
    </div>
		 <div class="rightinfo">
		    <table class="tablelist">		
		    <tr align="center"  bgcolor="#417EB5"    height="22">
					<td width="10%"><span style="color: #fff;">商品名称</span></td>
					<td width="10%"><span style="color: #fff;">盘存时间</span></td>
					<td width="15%"><span style="color: #fff;">实际数量</span></td>
					<td width="15%"><span style="color: #fff;">系统数量</span></td>
					<td width="15%"><span style="color: #fff;">盘盈（盘亏）</span></td>
					<td width="15%"><span style="color: #fff;">备注</span></td>
					<td width="10%"><span style="color: #fff;">操作</span></td>
		        </tr>	
				<c:forEach items="${requestScope.pancunList}" var="pancun">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${pancun.goods_name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${pancun.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${pancun.shijishuliang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${pancun.xitongshuliang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${pancun.type1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${pancun.beizhu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<form action="" name="formAdd" method="post">
						   <input type="button" value="删除" onclick="pancunDel(${pancun.id})"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
			
		</div>
	</body>
</html>
