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

<script type="text/javascript">
var pageNum=1;

$(function(){
		select(pageNum);
	});




function select(pageNum){
	if(pageNum<=0){
		pageNum=1;
	}
	
	$.ajax({
			url : "visitor/sceneryServlet",//请求地址
			type : "POST",//请求类型
			async : "true",//是否异步执行
			data : {"action":"select","pageNum":pageNum,},//给请求的地址传递参数
			dataType : "json",
			success : function(data){	
				var	html="<tr><td align='center' id='pp'><div id='page'></div></td></tr>";
				
				$.each(data.list,function(index,item){
					
					html += "<tr>"+
							"<td>"+
							"<hr id='hr'/>"+
							"<table>"+
							"<tr id='eachrow'>"+
							"<td ><img name='"+item.sid+"' id='img'  src='sceneryimg/"+item.sceneryimg+"' /></td>"+
							"<td width='25px'>"+
							"</td>"+
							"<td>"+
							"<table>"+
							"<tr><td align='center' id='name'>"+item.sname+"</td></tr>"+
							"<tr><td >"+
							"<form action='visitor/sceneryServlet?action=flag' method='post'>"+
							"<input type='hidden' name='sid' value='"+item.sid+"'/>"+
							"<input type='submit' value='详情' id='xq' />"+
							"</form>"+
							"</td></tr>"+
							"<tr><td >"+
							"<form action='visitor/sceneryServlet?action=ticket' method='post'>"+
							"<input type='hidden' name='sid' value='"+item.sid+"'/>"+
							"<input type='submit' value='订票' id='dp' />"+
							"</form>"+
							"</td></tr>"+
							"<tr><td>"+
							"<button id='jg' onclick='javascript:addshop("+item.sid+")'>加购物车</button>"+
							"</td></tr>"+
							"</table>"+
							"</td>"+
							"</tr>"+
							"</table>"+
							"<hr id='hr'/>"+
							"</td>"+
							"</tr>";			
				});	
				
					$("#big").html(html);
			
				var flag = data.pageNum+1;
				if(flag>=data.pageCount){
					flag=data.pageCount;
				}
				var page="";
		
				page += "<button id='sy' onclick='javascript:select(1)'>首页</button>"
				page += "<button id='syy' onclick='javascript:select("+(data.pageNum-1)+")'>上一页</button>"
				if(data.pageCount==0){
					page +=  "0"
				}else{
					page += "<strong>"+ data.pageNum+ "/" + data.pageCount +"</strong>"
				}
				page += "<button id='xyy' onclick='javascript:select("+flag+")'>下一页</button>"
				page += "<button  id='wy' onclick='javascript:select("+data.pageCount+")'>尾页</button>"		
				
				$("#page").html(page);
			}
		});
	return false;

}
function addshop(sid){
		var vid=${sessionScope.visitor.id }
		
		$.ajax({
			url : "visitor/visitorServlet",//请求地址
			type : "POST",//请求类型
			async : "true",//是否异步执行
			data : {"action":"insertshop","sid":sid,"vid":vid},//给请求的地址传递参数
			dataType : "json",
			success : function(data){	
				if(data.res==1){			
				alert("加购成功");
				}else{
				alert("加购失败");
					}
				}
			
			})
			return false;	
}

</script>
<title>订票</title>

</head>

<style>
#eachrow{
	

}
#pp{
	width:400px;
	height:35px;
}
#img{
	width:200px;
	height:100px;
	size:100% 100%;
	repeat:no-repeat;
	margin-top:16px;
	margin-bottom:8px;
	margin-left:30px;
	border:solid 3px black;
	border-radius:10px;
}
#hr{
	margin-top:0;
	margin-bottom:0;
	border:solid 2px black;
	border-radius:20px;
}
#xq{
	width:100px;
	height:30px;
	border-radius:10px;
	color:white;
	background-color:black;
	border:solid 2px black;
	font-weight:bold;
	margin-top:0px;
	outline:none;
}
#dp{
	width:100px;
	height:30px;
	border-radius:10px;
	color:white;
	background-color:black;
	border:solid 2px black;
	font-weight:bold;
	margin-top:-12px;
	outline:none;
}
#jg{
	width:100px;
	height:30px;
	border-radius:10px;
	color:white;
	background-color:black;
	border:solid 2px black;
	font-weight:bold;
	margin-top:-12px;
	outline:none;
}
#page{
	margin:0 auto;
}
#syy{
	
	width:80px;
	height:30px;
	border-radius:10px;
	color:white;
	background-color:black;
	border:solid 2px black;
	font-weight:bold;
	margin-top:3px;
	outline:none;
	margin-bottom:3px;
	
}
#sy{
	width:70px;
	height:30px;
	border-radius:10px;
	color:white;
	background-color:black;
	border:solid 2px black;
	font-weight:bold;
	margin-top:3px;
	margin-bottom:3px;
	outline:none;
}
#xyy{
	width:80px;
	height:30px;
	border-radius:10px;
	color:white;
	background-color:black;
	border:solid 2px black;
	font-weight:bold;
	margin-top:5px;
	outline:none;
	margin-bottom:3px;
}
#wy{
	width:70px;
	height:30px;
	border-radius:10px;
	color:white;
	background-color:black;
	border:solid 2px black;
	font-weight:bold;
	margin-top:5px;
	outline:none;
	margin-bottom:3px;
}
#name{
	font-weight:bold;
}
</style>
<body>

<div style="border-radius:25px;width:800;height:600;margin:0 auto;margin-top:30px;background-size:100 100;">
<table>
<tr>
<td valign="middle">
<div style="border:solid 10px black;width:400px;height:580;border-radius:25px;">
<table  id="big"></table></div>
</td>
<td align="center" style="width:;">



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
		<button onclick="window.location.href='visitor/shop.jsp'" style="border-radius:20px;border-width:12px;border-color:black;margin-top:-30px;background:url(imgs/gwch.png);background-size:100%; background-repeat:no-repeat;width:200px;height:240px">
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