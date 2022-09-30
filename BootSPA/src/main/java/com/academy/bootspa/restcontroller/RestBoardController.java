package com.academy.bootspa.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.academy.bootspa.exception.BoardException;
import com.academy.bootspa.model.board.BoardService;
import com.academy.bootspa.model.domain.Board;
import com.academy.bootspa.util.Message;

@RestController
public class RestBoardController {

	@Autowired
	private BoardService boardService;

	//기존 폼을 시리얼화하여 전송 파라미터로 만든 후 전송된 요청받음
	@PostMapping("/rest/serial/board")
	public ResponseEntity<Message> registByParam(Board board){
		System.out.println("registBySerial 등록 요청 받음"+board);

		boardService.insert(board);

		Message message = new Message(1,"registByParam 등록성공");
		ResponseEntity<Message> entity = new ResponseEntity<>(message,HttpStatus.OK);
 		return entity;
	}

	//기존 폼을 시리얼화하여 전송 json문자열로 변환한 후 전송된 요청받기
	@PostMapping("/rest/json/board")
	public ResponseEntity<Message> registByJson(@RequestBody Board board){
		System.out.println("registByJson 등록 요청 받음"+board);

		boardService.insert(board);

		Message message = new Message(1,"registByJson 등록성공");
		ResponseEntity<Message> entity = new ResponseEntity<>(message,HttpStatus.OK);
 		return entity;
	}





	@ExceptionHandler(BoardException.class)
	public ResponseEntity<Message> handle(BoardException e){

		Message message = new Message(0,e.getMessage());
		ResponseEntity<Message> entity = new ResponseEntity<>(message,HttpStatus.INTERNAL_SERVER_ERROR);
 		return entity;
	}
}
