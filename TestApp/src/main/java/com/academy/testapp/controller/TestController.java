package com.academy.testapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@GetMapping("/test")
	@ResponseBody
	public String getMsg() {
		return "hi this is message from springboot";
	}
}
