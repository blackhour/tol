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

<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>景区门票预订系统</title>

<style>

</style>

</head>
<body>
	<div align="center" style="font-weight:bold;margin:0 auto;">
	<div style="font-weight:bold;font-size:50px;margin-top:40px;">景区门票预订系统</div>
	<div  style="border:6px solid #000;border-radius:25px;width:400;height:450;margin-top:40px;">
	
	<div style="margin-top:60px;font-size:50px;color:#eee9e9">
		<button style="height:100;width:150;background-color:rgba(0,0,0,1);border-color:white;border-radius:15px;border-width:1px;outline:none" data-toggle="modal" data-target="#myModal">
		Login
		</button>
	
		<div class="modal fade"  style="" align="center" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				
				<div class="modal-content" style="height:300px;width:400px;background-color:rgba(255,255,255,1);border:solid 8px black;border-radius:50px;margin-top:150px">
					<div style="height:15px"></div>
					<form action="visitor/visitorServlet?action=login"  method="post" >
					<div class="modal-body" >
					<input type="text" name="username" style="border:solid 5px black;font-size:25px;color:black;height:60px;width:260px;border-radius:20px;margin-top:20px"  placeholder="  账号"required="required">
					</div>
			
					<div class="modal-body">
					<input type="password" name="password" style="border:solid 5px black;font-size:25px;color:black;height:60px;width:260px;padding-bottom:0px;border-radius:20px;"  placeholder="  密码"required="required">
					</div>
			
					<div style="padding-top:10px">
						<input type="submit" value="登录" class="btn btn-default" align="center" style="border:solid 5px black;margin-top:0px;font-size:25px;width:150px;height:50px;border-radius:20px;color:black;background-color:rgba(255,255,255,1)">		
					</div>
			
					</form>
			</div>
		</div>
	</div>
	
	</div>
	<div >
	
	<button onclick="window.location.href='visitor/register.jsp'" style="margin-top:15px;color:white;font-size:50px;height:100;width:210;background-color:rgba(0,0,0,1);border-color:white;border-radius:15px;border-width:1px;outline:none">
	Register
	</button>
	<div>
	<button style="margin-top:15px;color:white;font-size:40px;height:80;width:130;background-color:rgba(0,0,0,1);border-color:white;border-radius:15px;border-width:1px;outline:none">
	About
	</button>
	</div>
	
	</div>

	</div>
	</div>
</body>
</html>