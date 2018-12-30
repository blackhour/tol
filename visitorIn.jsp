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
<title>主页</title>
</head>
<body>
<div style="border-radius:25px;width:1200;height:650;margin:0 auto;margin-top:5px;background-size:100 100;">
	<table>
	<tr>
	<td>
		
		<div style="height:40px"></div>
		<div  align="center" style="border:solid 10px black;border-radius:20px;background-color:rgba(255,255,255,1);width:500px;height:570px;margin-left:80px;">
		<table>
		<tr>
		<td align="center"style="width:200px;height:250px">
		<button style="background:url(<%=basePath%>${sessionScope.visitor.userimg });border-width:8px;border-color:black;background-size:100% 100%;background-repeat:no-repeat;width:160px;height:220px;border-radius:10px;outline:none;margin-top:40px;margin-bottom:10px;">
		</button>
		</td>
		<td style="width:10px;"></td>
		<td valign="middle"style="width:300px;">
		<table style="margin-top:65px;">
		<tr><td   width="75" style="font-size:25px;color:black;"><strong>姓名</strong></td><td style="font-size:25px;color:black;"><strong>${sessionScope.visitor.name }</strong></td></tr>
		<tr><td height="50px"></td><td></td></tr>
		<tr><td valign="top" style="font-size:25px;color:black;" ><strong>介绍</strong></td>
		<td>
		<div style="font-size:15px; border:6px solid black;border-radius:10px; width:200px;height:100px;background-color:rgba(255,255,255,1);">
		<div style="height:8px;"></div>
		&nbsp;&nbsp;&nbsp;&nbsp;<strong>2333333333</strong>
		</div>
		</td>
		</tr>
		</table>
		</td>
		</tr>
		</table>
		<hr style="padding-top:0px;padding-bottom:0px;color:white;width:470;border-bottom:solid 6px black; "/>
		
		<table style="margin-top:35px;">
		<tr>
		<td></td>
		<td align="center" style="width:240px;">
		<button onclick="window.location.href='visitor/order.jsp'" style="margin-top:-30px;border-radius:20px;border-width:12px;border-color:black;background:url(imgs/ddh.png);background-size:100%; background-repeat:no-repeat;width:200px;height:240px">
		</button>
		</td>
		<td align="center" style="width:240px;">
		<button onclick="window.location.href='visitor/shop.jsp'" style="margin-top:-30px;border-radius:20px;border-width:12px;border-color:black;background:url(imgs/gwch.png);background-size:100%; background-repeat:no-repeat;width:200px;height:240px">
		</button>
		</td>
		<td>
		</td>
		</tr>
		</table>
	</div>
	
	
	
	</td>
	<td style="width:60px;"></td>
	<td >
	<table style="margin-top:50px;">
	<tr>
	<td align="center" style=" height:270;font-size:50px;">
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel"  data-interval="2000">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators" data-interval="true">
		<li data-target="#myCarousel" data-slide-to="0" class="active" data-interval="true"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
		<li data-target="#myCarousel" data-slide-to="4"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner" style="width:450px;height:250px;border:solid 6px black;border-radius:20px;">
		<div class="item active" >
			<img width="210" src="sceneryimg/taishan.jpg" alt="First slide" style="width:450px;height:250px;margin:0 auto;">
			<div class="carousel-caption" style="color:white;font-size:25px;top:185px">泰山</div>
		</div>
		<div class="item" >
			<img width="210px" src="sceneryimg/baimaiquan.jpg" alt="Second slide" style="width:450px;height:250px;margin:0 auto;">
			<div class="carousel-caption" style="color:white;font-size:25px;top:185px">百脉泉</div>
		</div>
		<div class="item" >
			<img width="210px" src="sceneryimg/daminghu.jpg" alt="Third slide" style="width:450px;height:250px;margin:0 auto;">
			<div class="carousel-caption" style="color:white;font-size:25px;top:185px">大明湖</div>	
		</div>
		<div class="item" >
			<img width="210px" src="sceneryimg/huashan.jpg" alt="Forth slide" style="width:450px;height:250px;margin:0 auto;">
			<div class="carousel-caption" style="color:white;font-size:25px;top:185px">华山</div>	
		</div>
		<div class="item" >
			<img width="210px" src="sceneryimg/gugong.jpg" alt="fifth slide" style="width:450px;height:250px;margin:0 auto;">
			<div class="carousel-caption" style="color:white;font-size:25px;top:185px">故宫</div>	
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<div >
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"  style="border-radius:20px;background-color:rbga(0,0,0,0);">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"  style="border-radius:20px;background-color:rbga(0,0,0,0);" >
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" ></span>
	    <span class="sr-only" id="lb">Next</span>
	</a>
	</div>
	</div>
	</td>
	</tr>
	<tr>
	<td> <hr style="padding-bottom:0;margin-top:25px;border-bottom:solid 6px black;"/></td>
	</tr>
	<tr>
	<td align="center" valign="middle" style="width:450px;"> 
	<button  onclick="window.location.href='visitor/scenery.jsp'" style="padding-top:0;margin-bottom:0;border-radius:30px;width:450px;outline:none;height:250px;background-color:rgba(0,0,0,1)">
	<div style="font-size:85px;color:white;">旅游景点</div>
	</button>
	</td>
	</tr>
	</table>	
	
	</td>
	</tr>
	</table>
	
	
	
	
		
</div>
</body>
</html>