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
<script>
$(function(){
	getscenery();
})

function getscenery(){
	$.ajax({
			url : "admin/sceneryServlet",//请求地址
			type : "POST",//请求类型
			async : "true",//是否异步执行
			data : {"action":"selectscenery"},//给请求的地址传递参数
			dataType : "json",
			success : function(data){	
			var	html="";
				$.each(data,function(index,item){
					html += "<tr><td align='center' width='675px'>"+
							"<div  style='border:6px solid #000;border-radius:25px;width:550px;height:620px;margin-top:10px;'>"+
							"<div style='font-weight:bold;margin-top:5px;font-size:25px;'>"+item.sname+"</div>"+
							"<img src='sceneryimg/"+item.sceneryimg+"' style='width:500;height:250;border:solid 3px black;border-radius:10px;margin-top:5px;'/>"+
							"<table style='margin-top:10px;'>"+
							"<tr>"+
							"<td style='width:500px;'> <div style='font-weight:bold;margin-top:5px;font-size:18px;'>地址："+item.address+"</div></td>"+
							"</tr>"+
							"<tr>"+
							"<td style='width:500px;'> <div style='font-weight:bold;margin-top:5px;font-size:18px;'>简介："+item.describe+"</div></td>"+
							"</tr>"+
							"</table>"+
							"<table><tr>"+
							"<td><button style='margin-top:13px;font-weight:bold;margin-left:20px;font-size:35px;height:55px;width:220;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none'>删除</button></td>"+
							"<td><button style='margin-top:13px;font-weight:bold;margin-left:20px;font-size:35px;height:55px;width:220;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none'>修改</button></td>"+
							"</tr></table>"+
							"</td></tr>";
				})
				$("#big").html(html);
			}
		})
}
</script>
<title>景点管理</title>
</head>
<style>
.scroll-son{
	padding: 0px;
	top:25px;
	bottom: 85px;
	
}

</style>
<body>
<div align="center" style=" margin:0 auto;">
<table>
<tr>
<td>
<div> 
<div data-spy="scroll" class="scroll-son" data-target="#navbar-example" data-offset="0" style="margin-top:25px;width:675;height:590;overflow:auto;border:solid 10px black; border-radius:20px;">
<table id="big">

</table>
</div>
</div>
</td>
<td>

<table>
<tr>
<td align="center">
<div style="margin-top:25px;margin-left:20px;width:155;height:155;overflow:auto;border:solid 10px black; border-radius:20px;">
<div style="font-weight:bold;font-size:40px;margin-top:40px;">${sessionScope.admin.name }</div>
</div>
</td>
</tr>
<tr>
<td>
<input type="text" name="key" style="height:50px;margin-top:10px; margin-left:22px;width:150px;border:solid 6px black;border-radius:10px;">
<div>
<button style="width:150px;height:60px;margin-top:10px;margin-left:22px;border:solid 6px black;border-radius:10px;background:black;color:white;font-size:35px;">搜索</button>
</div>
</td>
</tr>
<tr>
<td>
<button  style="width:150px;height:280px;margin-top:10px;margin-left:22px;border:solid 6px black;border-radius:10px;background:black;color:white;font-size:50px;">增加景点</button>
</td>
</tr>
</table>

</td>
</tr>
</table>

</body>
</html>