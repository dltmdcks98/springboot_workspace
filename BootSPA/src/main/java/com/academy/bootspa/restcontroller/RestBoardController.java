package com.academy.bootspa.restcontroller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.academy.bootspa.model.domain.Board;
import com.academy.bootspa.util.Message;

@RestController
public class RestBoardController {
	
	//기존 폼을 시리얼화하여 전송 파라미터로 만든 후 전송된 요청받음
	@PostMapping("/rest/serial/board")
	public ResponseEntity<Message> registByParam(Board board){
		System.out.println("registBySerial 등록 요청 받음"+board);
		return null;
	}
	
	//기존 폼을 시리얼화하여 전송 json문자열로 변환한 후 전송된 요청받기
	@PostMapping("/rest/json/board")
	public ResponseEntity<Message> registByJson(@RequestBody Board board){
		System.out.println("registByJson 등록 요청 받음"+board);
		return null;
	}
}
