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

<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


<title>管理员</title>
</head>
<style>

#an{
	width:200px;
	height:200px;
	border-radius:20px;
	color:white;
	background-color:black;
	border:solid 2px black;
	font-weight:bold;
	margin-top:0px;
	outline:none;
	font-size:55px;

}
</style>
<body>
<div align="center" style="margin:0 auto">
<div style="font-weight:bold;font-size:50px;margin-top:40px;">管理员管理操作</div>
<div  style="border:6px solid #000;border-radius:25px;width:800;height:450;margin-top:40px;">
<table style="margin-top:100px;">
<tr>
<td>
<button id="an">用户</button>
</td>
<td width="50px"></td>
<td>
<button onclick="window.location.href='admin/sceneryad.jsp'"  id="an">景点</button>
</td>
<td width="50px"></td>
<td>
<button id="an">门票</button>
</td>

</tr>
</table>
</div>
</div>
</body>
</html>