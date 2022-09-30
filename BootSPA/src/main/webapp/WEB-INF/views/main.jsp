<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin></script>
<script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

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
		overflow: scroll;
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

<script type="text/babel">
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
				getList();
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
 				getList();
 			},
 			error:function(xhr,status,error){
 				alert(error.msg);
 			}
 		});
 	}
 	
 	/*--------------------------------------------------------------------
 	 *비동기 방식으로 목록 가져오기
 	 ---------------------------------------------------------------------*/
 	 function getList(){
 		$.ajax({
 			url:"/rest/board",
 			type:"get",
 			success:function(result, status, xhr){
 				console.log("서버로부터 받은 json 목록",result);

				printList(result);//json 배열을 넘겨주자
 			},
 			error:function(xhr,status,error){
 				console.log(error);
 			}
 			
 		});
 	}
  
	//비동기 방식으로 한건의 데이터 가져오기	
  	function getDetail(board_id){
		console.log("넘겨받은 board_id " +board_id);

		$.ajax({
			url:"/rest/board/"+board_id,
			type:"get",
			success:function(result,status,xhr){
				console.log(result);
				printBoard(result);
			},
			error:function(xhr, status, error){
				console.log(error);
			}
		});
	}
	//우측 영역에 한건 출력
	function printBoard(board){
		$("#detail-form input[name='board_id']").val(board.board_id);
		$("#detail-form input[name='title']").val(board.title);
		$("#detail-form input[name='writer']").val(board.writer);
		$("#detail-form textarea[name='content']").val(board.content);

	}
 	/*--------------------------------------------------------------------
  	 *React를 이용한 UI처리
  	 ---------------------------------------------------------------------*/

	 function Row(props){
		var link = "javascript:getDetail("+props.board_id+")";
 		return(
			<tr align="center">
				<td>{props.board_id}</td>
				<td><a href={link}>{props.title}</a></td>
				<td>{props.writer}</td>
				<td>{props.regdate}</td>
				<td>{props.hit}</td>
			</tr>
 		);
 	}
 	
  	 function BoardTable(props){
		var list = props.boardList;
		//tr을 반복한 컨테츠를 구성 
		var tag =[];//여기에 tr을 모아둘것임

		for(var i=0; i<list.length; i++){
			var obj = list[i];//게시물 한건 꺼내기
			tag.push(<Row board_id={obj.board_id} title={obj.title} writer={obj.writer} regdate={obj.regdate} hit={obj.regdate} />); //arrayList.add()와 동일
		}
		return(
 			<table width="100%" border="1px">
 				<thead>
 					<tr>
 						<th>No</th>
 						<th>제목</th>
 						<th>작성자</th>
 						<th>등록일</th>
 						<th>조회수</th>
 					</tr>
 				</thead>
 				<tbody>
					{tag}
 				</tbody>
 			</table>		
 		);
 	}
  	 //화면에 테이블 출력함수
  	 function printList(jsonArray){
 		
 		var root = ReactDOM.createRoot(document.getElementById("list-area"));
 		root.render(<BoardTable boardList={jsonArray} />);
 	}
  	 
	//수정 요청
	function edit(){
		//비동기 요청시 기존 폼을 이용하는 법(파라미터,json)
		var params = $("#detail-form").serialize();
		
		
		if(confirm("수정하시겠어요")){
			$.ajax({
				url:"/rest/board",
				type:"PUT",
				data:params,
				contentType:"application/x-www-form-urlencoded;charset=utf-8",
				success:function(result,status,xhr){
					console.log(result);
				}

			});
		}
	

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
		
		//상세보기 폼의 버튼 이벤트 처리
		$($("#detail-area button")[0]).click(function(){
			edit();
		});

		$($("#detail-area button")[1]).click(function(){
			del();
		});

		getList();
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
				<input type="hidden" name="board_id">
				<input type="text" name="title" placeholder="제목">
				<input type="text" name="writer" placeholder="작성자">
				<textarea style="width: 95%;height:150px;" placeholder="내용" name="content"></textarea>
				<button type="button">수정</button>
				<button type="button">삭제</button>
			</form>
		</div>
	</div>
</body>
</html>