package com.lgdx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lgdx.entity.WebBoard;
import com.lgdx.repository.WebBoardRepository;

@Controller
public class BoardController {
	
	@Autowired
	private WebBoardRepository repository;
	
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(WebBoard vo) {
		// primary key exist, then update table
		System.out.println(vo.toString());
		repository.save(vo);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(Long idx, Model model) {
		WebBoard vo = repository.findById(idx).get();
		model.addAttribute("vo",vo);
		return "boardUpdateForm";
	}
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(Long idx) {
		System.out.println("delete idx is "+idx);
		repository.deleteById(idx);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardContent.do")
	public String boardContent(Long idx, Model model) {
		WebBoard vo = repository.findById(idx).get();
		repository.count(idx);
		System.out.println(vo.toString());
		model.addAttribute("vo",vo);
		return "boardContent";
	}
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(WebBoard vo) {
		repository.save(vo);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardInesrtForm.do")
	public String boardInesrtForm() {
		return "boardInesrtForm";
	}
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		List<WebBoard> list = repository.findAll();
		System.out.println(list.toString());
		model.addAttribute("list",list);
		return "boardList";
	}
	
	@RequestMapping("/test")
	public @ResponseBody String test() {
		return "Hello Springg Boot!";
	}
}