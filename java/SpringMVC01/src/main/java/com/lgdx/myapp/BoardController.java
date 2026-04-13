package com.lgdx.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/boardList.do")
	public String boardList() {
		System.out.println("Somebody is comming");
		return "boardList";
	}

}
