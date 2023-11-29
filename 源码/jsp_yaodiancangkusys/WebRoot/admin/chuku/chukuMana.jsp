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
           function chukuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/chuku?type=chukuDel&id="+id;
               }
           }
           
           function chukuAdd()
           {
                 var url="<%=path %>/admin/chuku/chukuAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
           
           function chukuMingxiAdd(chuku_id)
           {
                var url="<%=path %>/admin/chuku/chukuMingxiAdd.jsp?chuku_id="+chuku_id;
              window.location.href=url;
           }
           
           function chukuMingxiMana(chuku_id)
           {
                var url="<%=path %>/chuku?type=chukuMingxiMana&chuku_id="+chuku_id;
                 window.location.href=url;
           }
       </script>
	</head>
	<body>

<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">销售单据号</td>
					<td width="15%">销售时间</td>
					<td width="10%">总金额</td>
					<td width="10%">负责人</td>
					<td width="10%">备注</td>
					<td width="20%">明细</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.chukuList}" var="chuku">
				<tr>
					<td bgcolor="#FFFFFF" align="center">
						${chuku.danjuhao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${chuku.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chuku.zongjiage}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chuku.jingshouren}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chuku.beizhu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a style="color: red" href="#" onclick="chukuMingxiMana(${chuku.id})">销售明细</a>
					    &nbsp;&nbsp;&nbsp;      
					    <a style="color: red" href="#" onclick="chukuMingxiAdd(${chuku.id})">添加销售明细</a>
					</td>
						<td bgcolor="#FFFFFF" align="center">
				
						   <input type="button" value="删除" onclick="chukuDel(${chuku.id})"/>
				
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
	</body>
</html>
