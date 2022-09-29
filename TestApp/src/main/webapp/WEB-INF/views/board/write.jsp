<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function regist(){
	var formArray = $("form").serializeArray();
	var json ={};//empty
	
	for(var i=0; i<formArray.length;i++){
		json[formArray[i].name]=formArray[i].value;
	}
	console.log("전송전 json 구성:",json);

	$.ajax({
		url:"/board/regist",
		type:"post",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(json),//json=>String
		success:function(result, status, xhr){
			alert(result);
		},
		error:function(xhr, status, error){
			alert(error);
		}
	});
}
$(function(){
	
});
</script>
</head>
<body>
<form>
	<table width="70%" boarder="1px" align="center">
		<tr>
			<td>제묵</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onClick="regist()">등록</button>
				<button type="button">목록</button>
			</td>
		</tr>
	</table>	
</form>
</body>
</html>