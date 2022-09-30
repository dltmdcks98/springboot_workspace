package com.academy.bootspa.restcontroller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.academy.bootspa.model.domain.Board;
import com.academy.bootspa.util.Message;

@RestController
public class RestBoardController {
	
	@PostMapping("/rest/board")
	public ResponseEntity<Message> regist(Board board){
		System.out.println("registBySerial 등록 요청 받음"+board);
		return null;
	}
}
