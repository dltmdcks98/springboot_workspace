package com.academy.bootspa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.academy.bootspa.model.domain.Board;

@Controller
public class BoardController {
	@GetMapping("/board/main")
	public ModelAndView getMain() {
		System.out.println("메인 요청");

		return new ModelAndView("main");
	}

	//등록요청 처리
	@PostMapping("/board/regist")
	public ModelAndView regist(Board board) {
		System.out.println("동기방식의 등록 요청을 받음"+board);
		return null;
	}
}
