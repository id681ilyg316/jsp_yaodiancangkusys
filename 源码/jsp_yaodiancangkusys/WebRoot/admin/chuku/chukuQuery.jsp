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
		  <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
<script language="javascript">
           var i=0;
           function catelogAll()
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           
           function goodsAll(catelog_id)
           {
                loginService.goodsAll1(catelog_id,callback1);
           }
           function callback1(data)
           {
               DWRUtil.removeAllOptions("goods_id");
               DWRUtil.addOptions("goods_id",{0:'--请选择药品-'});
               DWRUtil.addOptions("goods_id",data,"id","name");
           }
        </script>
	</head>
	<body>
         <form action="<%=path %>/chuku?type=chukuQuery1" name="formAdd" method="post">
<select style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:150px;"  name="catelog_id" id="catelog_id" onclick="catelogAll()" onchange="goodsAll(this.value)">
									              <option value="0">请选择药品分类</option>
									          </select>
									          <select style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:300px;"  name="goods_id" id="goods_id">
									              <option value="0">--请选择药品--</option>
									          </select>  <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
</a>
	   	<i>出库日期</i><a>       <input class="dfinput"  onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" style="border: 1px solid #C3AB7D;padding:7px 10px 7px 10px;width:200px"  name="shijian" type="text"/></a>	 
   	    <input type="submit" value="查询" />&nbsp; 
	   </form>

<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="20%">药品名称</td>
					<td width="20%">出库数量</td>
					<td width="20%">出库时间</td>
					<td width="20%">负责人</td>
					<td width="20%">单据号</td>

		        </tr>	
				<c:forEach items="${requestScope.chukuList}" var="chuku">
				<tr>
					<td bgcolor="#FFFFFF" align="center">
						${chuku.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${chuku.shuliang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chuku.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chuku.jingshouren}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${chuku.danjuhao}
					</td>
					
				</tr>
				</c:forEach>
			</table>

			  </div>
			  
	</body>
</html>
