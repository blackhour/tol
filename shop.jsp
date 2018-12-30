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
<title>购物车</title>

<script>



$(function(){
	getshop();
})



	function getshop(){
	var vid = ${sessionScope.visitor.id };
		$.ajax({
			url : "visitor/visitorServlet",//请求地址
			type : "POST",//请求类型
			async : "true",//是否异步执行
			data : {"action":"selectshop","vid":vid},//给请求的地址传递参数
			dataType : "json",
			success : function(data){	
			var	html="";
				
				$.each(data,function(index,item){
				html +=	"<tr><td>"+
						"<div align='center'  style='border:8px solid #000;border-radius:25px;width:620px;height:250px;margin-top:5px;'>"+
				 		"<div style='border:6px solid #000;border-radius:25px;width:600px;height:150px;margin-top:5px;'>"+
				 		"<table >"+
						"<tr>"+
						"<td style='width:280px;'>"+
						"<img src='sceneryimg/"+item.sceneryimg+"' style='width:270px;height:125px;border:solid 3px black;border-radius:10px;margin-left:5px;margin-top:5px;'/>"+
						"</td>"+
						"<td  style='width:10px;'></td>"+
						"<td valign='top' style=''>"+
						"<div style='font-weight:bold;margin-top:10px;font-size:25px;'>"+item.sname+"</div>"+
						"<div style='font-weight:bold;margin-top:10px;font-size:10px;'>"+item.address+"</div>"+
						"<div style='font-weight:bold;margin-top:5px;font-size:10px;'>使用日期<br />"+item.starttime+"-"+item.endtime+"</div>"+
 						"</td></tr>"+
						"</table>"+
						"<table><tr><td>"+
						"<form action='visitor/sceneryServlet?action=flag' method='post'>"+
						"<input type='hidden' name='sid' value='"+item.sid+"'/>"+
						"<input type='submit' value='景点详情' style='margin-top:25px;font-weight:bold;margin-left:20px;font-size:35px;height:55;width:180;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none'/>"+
						"</form>"+
						"</td>"+
						"<td>"+
						"<form action='visitor/sceneryServlet?action=ticket' method='post'>"+
						"<input type='hidden' name='sid' value='"+item.sid+"'/>"+
						"<input type='submit' value='点击支付' style='margin-top:25px;font-weight:bold;margin-left:20px;font-size:35px;height:55;width:180;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none'/>"+
						"</form>"+
						"<td>"+
						"<form action='visitor/visitorServlet?action=delectshop' method='post'>"+
						"<input type='hidden' name='shid' value='"+item.shid+"'/>"+
						"<input type='submit' value='删除' style='margin-top:25px;font-weight:bold;margin-left:20px;font-size:35px;height:55;width:100;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none'/>"+
						"</form>"+
						"</td>"+
						"</td></tr>"+
						"</table>"+
						"</div></div>"+
						"</td></tr>";
				})
				$("#big").html(html);
			}
		})
	}
</script>
</head>
<style>

.scroll-son{
	padding: 0px;
	top:25px;
	bottom: 85px;
	
}
</style>

<body>



<div align="center" style="border-radius:25px;height:600;margin-top:40px;background-size:100 100;">
<table >
<tr>
<td valign="middle" align="right" style="width:700px;">

<div data-spy="scroll" class="scroll-son" data-target="#navbar-example" data-offset="0" style="margin-top:13px;width:660;height:575;overflow:auto;border:solid 10px black; border-radius:20px;">

<table id="big" >


</table>
</div>
</td>
<td style="width:30px;"></td>
<td align="center" >
<table>
<tr>
<td></td>
</tr>
<tr>
<td>

		<div  align="center" style="border:solid 10px black;border-radius:20px;background-color:rgba(255,255,255,1);width:500px;height:570px;margin-left:50px;">
		<table>
		<tr>
		<td align="center"style="width:200px;height:250px">
		<button style="background:url(<%=basePath%>${sessionScope.visitor.userimg });border-width:8px;border-color:black;background-size:100% ;background-repeat:no-repeat;width:160px;height:220px;border-radius:10px;outline:none;margin-top:40px;margin-bottom:10px;">
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
</tr>
</table>
</td>
</tr>
</table>
</div>

</body>
</html>