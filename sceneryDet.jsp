<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%     
	String path = request.getContextPath();     
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<%@ page isELIgnored="false"%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${sessionScope.scenery.sname }</title>
</head>
<body>
	<div align="center"  style="border:6px solid #000;border-radius:25px;width:550px;height:600px;margin:0 auto;margin-top:20px;">
	<div style="font-weight:bold;margin-top:5px;font-size:25px;">${sessionScope.scenery.sname }</div>
	<img src="sceneryimg/${sessionScope.scenery.sceneryimg}" style="width:500;height:250;border:solid 3px black;border-radius:10px;margin-top:5px;"  />
	<table style="margin-top:10px;">
	<tr>
	<td style="width:500px;"> <div style="font-weight:bold;margin-top:5px;font-size:18px;">地址：${sessionScope.scenery.address }</div></td>
	</tr>
	<tr>
	<td style="width:500px;"> <div style="font-weight:bold;margin-top:5px;font-size:18px;">简介：${sessionScope.scenery.describe }</div></td>
	</tr>
	</table>
	<table  >
	<tr>
	<td valign="middle">
	<form style="margin-bottom:1px;" action="visitor/sceneryServlet?action=ticket" method="post">
	<input type="hidden" name="sid" value="${sessionScope.scenery.sid }"/>
	<input type="submit" value="订票"  style="margin-bottom:0;width:200px;height:50px;margin-top:15px;border:solid 6px black;border-radius:10px;background:black;color:white;font-size:28px;"/>
	</form>
	</td>
	<td style="width:30px;"></td>
	<td valign="middle">
	<button  style="width:200px;height:50px;margin-top:15px;border:solid 6px black;border-radius:10px;background:black;color:white;font-size:28px;">评论</button>
	</td>
	</tr>
	</table>
	</div>
</body>
</html>