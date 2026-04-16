package com.lgdx.myapp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lgdx.entity.Member;
import com.lgdx.mapper.MemberMapper;

@Controller
public class MemberController {
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping("/update.do")
	public String update(Member vo,HttpSession session) {
		System.out.println("update is called" + vo.toString());
		mapper.update(vo);
		session.setAttribute("info",vo);
		return "redirect:/boardList.do";
	}
	

	@RequestMapping("/updateForm.do")
	public String updateForm() {
		return "updateForm";
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println("logout.do is called");
		session.removeAttribute("info");
		return "redirect:/boardList.do";
	}
	@RequestMapping("/login.do")
	public String login(Member vo, HttpSession session) {
		System.out.println("login.do called");
		Member info = mapper.login(vo);
		if (info != null) {
			System.out.println(info.toString());
			session.setAttribute("info", info);
		}
		return "redirect:/boardList.do";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "loginForm";
	}

	@RequestMapping("/join.do")
	public String join(Member vo) {
		System.out.println("join.do is called");
		System.out.println(vo.toString());
		mapper.join(vo);
		return "redirect:/boardList.do";
	}

	@RequestMapping("/joinForm.do")
	public String joinFor() {
		return "joinForm";
	}

}
