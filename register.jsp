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

<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">


<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		var now = new Date();
		var birthday = (1900+now.getYear()) + "-" + (now.getMonth()+1) + "-" + now.getDate() ;
		
		$(".form_datetime").datetimepicker({
			format: "yyyy-mm-dd",
	        language: 'zh-CN',
	        autoclose: true,
	        todayBtn: true,
	        startDate: birthday,
	        minuteStep: 5
	    });
		
		$("input[name='birthday']").val(birthday);
		$(".form_datetime").datetimepicker({
			format: "yyyy-mm-dd",
	        language: 'zh-CN',
	        autoclose: true,
	        todayBtn: true,
	        startDate: birthday,
	        minuteStep: 5
	    });
})


function setImagePreview() {
var docObj=document.getElementById("userimg");
var imgObjPreview=document.getElementById("preview");
if(docObj.files && docObj.files[0]){
//火狐下，直接设img属性
imgObjPreview.style.display = 'block';
imgObjPreview.style.width = '140px';
imgObjPreview.style.height = '207px';
//imgObjPreview.src = docObj.files[0].getAsDataURL();
//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);

}else{
//IE下，使用滤镜
docObj.select();
var imgSrc = document.selection.createRange().text;
var localImagId = document.getElementById("localImag");
//必须设置初始大小
localImagId.style.width = "140px";
localImagId.style.height = "207px";

//图片异常的捕捉，防止用户修改后缀来伪造图片
try{
localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
}catch(e){
alert("您上传的图片格式不正确，请重新选择!");
return false;
}

imgObjPreview.style.display = 'none';
document.selection.empty();
}

return true;
}

</script>



<title>用户注册</title>
</head>

<style>
		.file {
			position: relative;
			display: inline-block;
			background: black;
			border: 1px solid #99D3F5;
			border-radius: 10px;
			padding: 13px 12px;
			overflow: hidden;
			color: white;
			text-decoration: none;
			
			text-indent: 0;
			line-height: 20px;
			width:150px;
			height:50px;
			border-color: black;
			font-size:25px;
		}
		.file input {
			position: absolute;
			font-size: 100px;
			right: 0;
			top: 0;
			opacity: 0;
			width:100px;
			height:30px;
		}
		.file:hover {
			background: #black;
			border-color: black;
			color: white;
			text-decoration: none;
}

#wbk{
	width:220px;
	height:40px;
	border:solid 6px black;
	border-radius:8px;
}
#bg{
	width:95px;
	height:80px;
	
	font-size:20px;
}
</style>



<body >

<div align="center"  style="border:6px solid #000;border-radius:25px;width:550px;height:600px;margin:0 auto;margin-top:20px;">

<form action="visitor/visitorServlet?action=add" method="post" enctype="multipart/form-data">

<table>
<tr>
<td align="center"style="height:500px;width:155px;">
<div style="font-size:40px;font-weight:bold;margin-bottom:60px;top:0;">用户注册</div>
<div id="localImag" style="width:160px;height:220px;border-radius:20px;border:solid 6px black">
<img id="preview"  style="diplay:none;border-radius:20px;border-color:transparent;background-size:100% 100%;" />
</div>
<div style="margin:20px;" >
<a class="file">
	选择头像
    <input type="file" name="image"  id="userimg" onchange="javascript:setImagePreview();">
</a>
</div>
</td>
<td style="width:10px;">
</td>
<td>

<table >
<tr>
<td style="width:10px;"></td>

<td id="bg" align="right"><strong>昵称:</strong></td>
<td></td>
<td ><input type="text" name="name" id="wbk"></td>
</tr>
<tr>
<td style="width:10px;"></td>

<td id="bg" align="right"><strong>账号:</strong></td>
<td></td>
<td ><input type="text" name="username" id="wbk"></td>
</tr>
<tr>
<td></td>
<td id="bg" align="right"><strong>密码:</strong></td>
<td></td>
<td><input type="text" name="password" id="wbk"></td>
</tr>
<tr>
<td></td>
<td id="bg" align="right"><strong>性别:</strong></td>
<td></td>
<td>
<select name="sex" id="sex" style="font-weight:bold;width:75px;height:40px;border:solid 6px black;border-radius:8px;outline:none;font-size:20px;" >
<option value="男">男</option>
<option value="女">女</option>
</select>

</td>
</tr>

<tr>
<td></td>
<td id="bg" align="right"><strong>出生日期:</strong></td>
<td></td>
<td>

<div class="input-group date form_datetime" data-date-format="dd-MM-yyyy" data-link-field="dtp_input1" style="border-radius:8px;background:white;border:solid 6px black;">
<input class="form-control" size="16" type="text" name="birthday" readonly style=" background:white;">
<span class="input-group-addon"><span class="glyphicon glyphicon-th" style=" background:white;"></span></span>
</div>

</td>
</tr>

<tr>
<td></td>
<td id="bg" align="right"><strong>身份证号:</strong></td>
<td></td>
<td><input type="text" name="idcard" id="wbk"></td>
</tr>
</table>

</td>
</tr>
</table>
<input  type="submit"  style="width:200px;height:50px;margin-top:15px;border:solid 6px black;border-radius:10px;background:black;color:white;font-size:28px;" value="注册">
</form>


</div>
</body>
</html>