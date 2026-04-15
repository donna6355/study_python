package com.lgdx.myapp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lgdx.entity.Board;
import com.lgdx.mapper.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
		System.out.println("boardUpdate.do called");
		System.out.println(vo.toString());
		mapper.boardUpdate(vo);
		return "redirect:/boardList.do";
	}

	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int idx, Model model) {
		Board vo = mapper.boardContent(idx);
		System.out.println(vo.toString());
		model.addAttribute("vo", vo);
		return "boardUpdateForm";
	} 
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(int idx) {
		System.out.println("boardDelete.do called #"+idx);
		mapper.deleteContent(idx);
		return "redirect:/boardList.do";
	}
	
	
	@RequestMapping("/boardContent.do")
	public String boardContent(int idx, Model model) {
		System.out.println("boardContent.do called #"+idx);
		Board vo = mapper.boardContent(idx);
		System.out.println(vo.toString());
		model.addAttribute("vo", vo);
		return "boardContent";
	}
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		System.out.println(vo.toString());
		mapper.boardInsert(vo);
		
		return "redirect:/boardList.do";
	}

	@RequestMapping("/boardInesrtForm.do")
	public String boardInsertForm(Model model) {
		return "boardInsertForm";
	}

	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
//		System.out.println("Somebody is comming");
//		Board vo1 = new Board(1, "wanna join our yoga class?", "This is very special class for chubby cat.","Mir", "2025.12.31", 12314);
//		Board vo2 = new Board(1, "Welcome to my show?", "Huh Huh Merry Christmas.","Moomin", "2025.12.24", 14);
//		Board vo3 = new Board(1, "Headache", "it was super busy week last week.","Moomin", "2025.12.01", 14);
//		Board vo4 = new Board(1, "Ultra Sound story", "I lost my hair.. my hait!!!! damn human!!","Kkomi", "2025.07.31", 314);
//		Board vo5 = new Board(1, "be smart", "Read more book","Mir", "2025.05.05", 1225);
//		
//		ArrayList<Board> list = new ArrayList<Board>();
//		list.add(vo1);
//		list.add(vo2);
//		list.add(vo3);
//		list.add(vo4);
//		list.add(vo5);

		ArrayList<Board> list = mapper.boardList();

		// keep ArrayList in model
		model.addAttribute("list", list);
		return "boardList";
	}

}
