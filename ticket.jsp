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

<title>${sessionScope.ticket.sname }</title>
<script>

function count(){
	var ticketnum= $("#ticketnum").val();
	var price= ${sessionScope.ticket.price }
	document.getElementById("cou").value=ticketnum*price;
	
}
function alipay(){
	document.getElementById("payimg").src="imgs/ewm.png";
}
function wechat(){
	document.getElementById("payimg").src="imgs/ewm1.png";
}
</script>
</head>
<body>
<div  align="center" style="margin:0 auto;">
<div align="center"  style="border:6px solid #000;border-radius:25px;width:800px;height:200px;margin:0 auto;margin-top:100px;">
<table>
<tr>
<td style="width:360px;">
<img src="sceneryimg/${sessionScope.ticket.sceneryimg}" style="width:360px;height:175px;border:solid 3px black;border-radius:10px;margin-left:5px;margin-top:5px;"/>
</td>
<td  style="width:10px;"></td>
<td  style="width:440px;">
<div style="font-weight:bold;height:65px;margin-top:5px;font-size:35px;">${sessionScope.ticket.sname}</div>
 <div style="font-weight:bold;height:30px;margin-top:5px;font-size:15px;">地址：${sessionScope.ticket.address }</div>
 <div style="font-weight:bold;height:30px;margin-top:5px;font-size:15px;">使用日期：${sessionScope.ticket.starttime}-${sessionScope.ticket.endtime}</div>
</td>
</tr>
</table>
<table>
<tr>
<td>
<button data-toggle="modal" data-target="#myModal" style=" font-weight:bold;font-size:35px;margin-top:30px;height:100;width:200;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none">
确认购买
</button>
<div class="modal fade"  style="" align="center" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				
				<div class="modal-content" style="height:600px;width:600px;background-color:rgba(255,255,255,1);border:solid 8px black;border-radius:50px;margin-top:20px">
					<div style="height:15px"></div>
					<strong style="height:30px;font-size:25px;margin-top:30px;margin-left:35px;">${sessionScope.ticket.sname }门票</strong>
					<div style="height:15px"></div>
					<form action="visitor/sceneryServlet?action=order" method="post">
					<table>
					<tr>
					<td style="height:60px;"><div style="font-weight:bold;height:30px;font-size:25px;">价格：${sessionScope.ticket.price }</div></td>
					<td>
					<strong style="height:30px;font-size:25px;margin-top:30px;margin-left:35px;">购买数量</strong>
					<input style="border:3px solid #000;border-radius:10px;"type="text" onchange="javascript:count();" name="ticketnum" id="ticketnum"/>
					</td>
					</tr>
					<tr>
					<td style="height:60px;"><div style="font-weight:bold;height:30px;font-size:25px;">剩余：${sessionScope.ticket.overplus }</div></td>
					<td>
					<strong style="height:30px;font-size:25px;margin-top:30px;margin-left:35px;">总价</strong>
					<input style=" margin-left:48px;border:3px solid #000;border-radius:10px;" type="text" id="cou" name="cou"/>
					</td>
					</tr>
					</table>
					<div style="font-weight:bold;height:30px;margin-top:5px;font-size:25px;margin-top:10px;">请选择支付方式</div>
					
					<table>
					<tr>
					<td >
					<table style="margin-top:10px;">
					<tr>
					<td style="height:150px;"><img style="margin-top:10px;width:100px;height:100px;border:3px solid #000;border-radius:10px;" src="imgs/alipay.png"/></td>
					<td><div><input type="radio"  name="pay" value="alipay" onchange="javascript:alipay();"></div></td>
					</tr>
					<tr>
					<td style="height:150px;"><img style="margin-top:10px;width:100px;height:100px;border:3px solid #000;border-radius:10px;" src="imgs/wechat.png"/></td>
					<td><div><input type="radio" name="pay" value="wechat" onchange="javascript:wechat();"></div></td>
					</tr>
					</table>
					</td>
					<td style="width:10px;"></td>
					<td style="width:300px;">
					<img  src="imgs/select.png "id="payimg" style="margin-top:20px;width:300px;height:300px;border:solid 3px black;border-radius:10px;"/>
					</td>
					<td style="width:120;" align="center">
					<input type="submit" style=" font-weight:bold;font-size:20px;margin-top:30px;height:100;width:100;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none"  value="我已支付">
					<button  style=" font-weight:bold;font-size:20px;margin-top:30px;height:100;width:100;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none" >再想想</button>
					</td>
					</tr>
					</table>
					<input type="hidden" value="${sessionScope.ticket.number }" name="number">
					<input type="hidden" value="${sessionScope.ticket.tid }" name="tid">
					<input type="hidden" value="${sessionScope.ticket.sid }" name="sid">
					<input type="hidden" value="${sessionScope.visitor.id }" name="vid">
					<input type="hidden" value="${sessionScope.ticket.price}" name="price">
					</form>
				</div>
			</div>
</div>
</td>
<td>
<button onclick="window.location.href='visitor/scenery.jsp' "style=" font-weight:bold;font-size:35px;margin-top:30px;margin-left:50px;height:100;width:200;background-color:rgba(0,0,0,1);border-radius:15px;color:white;outline:none">
返回
</button>
</td>
</tr>
</table>
</div>
</div>
</body>
</html>