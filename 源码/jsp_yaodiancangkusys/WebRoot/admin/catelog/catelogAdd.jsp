<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
          function check()
           {
               if(document.formAdd.name.value=="")
               { 
                   alert("请输入分类名称");
                   return false;
               }
               return true;
           }
        </script>
	</head>

		<body>
	<form action="<%=path %>/catelog?type=catelogAdd" name="formAdd" method="post">
			<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">基本信息管理</a></li>
    <li><a href="#">商品分类添加</a></li>
    </ul>
    </div>
			 <div id="usual1" class="usual"> 
    
    
  	<div id="tab1" class="tabson">
    
    <ul class="forminfo">
    <li><label>分类名称<b>*</b></label> 
						
						        <input type="text" name="name" class="dfinput"   style="width:300px;"/>
</li>
	<li><label><b></b></label> 					       <input type="submit"  class="btn" onclick="return check()" value="提交"/>&nbsp; 
						      
	</li>
    </ul>
    
    </div> 
	</div> 
			</form>
   </body>
</html>
