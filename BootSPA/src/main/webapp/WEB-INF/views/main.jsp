<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	body{margin:0px;}
	#wrapper{
		width:100%;
		height:700px;
		overflow: hidden;
	}
	#input-area{
		width: 20%;
		height:100%;
		float: left;
		background-color:yellow; 
	}

	#list-area{
		width: 60%;
		height:100%;
		float: left;
		background-color:skyblue;
	}
	#detail-area{
		width: 20%;
		height:100%;
		float: left;
		background-color:pink;
	}
	#input-area input,#detail-area input{
		width: 95%;
	}
</style>

<script type="text/javascript">
/*--------------------------------------------------------------------
 *동기방식의 폼 전송
 ---------------------------------------------------------------------*/
 	function regist(){
		$("#input-form").attr({
			action:"/board/regist",
			method:"post"
		});
		$("#input-form").submit();
	}
 	/*--------------------------------------------------------------------
 	 *비동기 방식의 기존폼을 이용한 Parameter 문자열 전송
 		serialize : queryString의 형식으로 넘어감
 		serializeArray : key : value로 나옴
 		contentType은 : post방식에서의 네트워크 header부분에 application/x-www-form-urlencoded 이 나와있다.
 	 ---------------------------------------------------------------------*/
 	function registBySerial(){
		var params = $("#input-form").serialize();
		console.log(params);
		
		//이미 전송할 파라미터화가 완료되었으므로, Json으로 변환하지 말고 그냥 보내보자
		$.ajax({
			url:"/rest/serial/board",
			type:"post",
			data:params,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			success:function(result,status,xhr){
				alert(result.msg);
			},
			error:function(xhr,status,error){
				alert(error.msg);
			}
			
		});
	}
 	
 	/*--------------------------------------------------------------------
 	 *비동기 방식의 기존폼을 이용한 json 문자열 전송
 	 ---------------------------------------------------------------------*/
 	function registByJson(){
 		var formArray = $("#input-form").serializeArray();
 		console.log(formArray);
  		
 		//원하는 형태의 json으로 가공
 		var json = {};
 		for(var i =0; i<formArray.length;i++){
			json[formArray[i].name]=formArray[i].value;	 			
 		}
 		console.log(json);
 		
 		//json 전송시 주의 : json 객체 자체는 전송 불가 즉 json문자열로 반환
 		$.ajax({
 			url:"/rest/json/board",
 			type:"post",
 			data:JSON.stringify(json),
 			contentType:"application/json;charset=utf-8",
			success:function(result,status,xhr){
 				alert(result.msg);
 			},
 			error:function(xhr,status,error){
 				alert(error.msg);
 			}
 		});
 	}
 	
 	
	$(function(){
		$($("#input-area button")[0]).click(function(){
			regist();
		});
		
		$($("#input-area button")[1]).click(function(){
			registBySerial();
		});
		$($("#input-area button")[2]).click(function(){
			registByJson();
		});
		
	});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="input-area">
			<form id="input-form">
				<input type="text" name="title" placeholder="제목">
				<input type="text" name="writer" placeholder="작성자">
				<textarea style="width: 95%;height:150px; " placeholder="내용" name="content"></textarea>
				<button type="button">그냥등록</button>
				<button type="button">폼시리얼 등록</button>
				<button type="button">json 등록</button>
			</form>
		</div>
		<div id="list-area">
			<form id="list-form">
				
			</form>
		</div>
		<div id="detail-area">
			<form id="detail-form">
				<input type="text" name="title" placeholder="제목">
				<input type="text" name="writer" placeholder="작성자">
				<textarea style="width: 95%;height:150px;" placeholder="내용"></textarea>
				<button type="button">수정</button>
				<button type="button">삭제</button>
			</form>
		</div>
	</div>
</body>
</html>