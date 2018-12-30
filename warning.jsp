<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%     
	String path = request.getContextPath();     
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>您买太多了</title>
</head>
<body>
<div align="center" style="margin:0 auto;">
<div style="border:6px solid #000;border-radius:25px;width:500px;height:280px;margin:0 auto;margin-top:100px;">
<div style="font-weight:bold;height:30px;margin-top:20px;font-size:50px;">哎呀</div>
<br />
<div style="font-weight:bold;height:30px;margin-top:20px;font-size:50px;">您买太多了</div>
<button onclick="window.location.href='visitor/scenery.jsp'" style=" font-weight:bold;font-size:35px;margin-top:60px;height:75;width:150;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none">返回</button>
</div>
</div>
</body>
</html>