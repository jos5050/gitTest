package com.db1.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.db1.board.domain.Member;
import com.db1.board.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/join")
	public ModelAndView joinPage() {
		ModelAndView modelAndview = new ModelAndView();
		
		modelAndview.setViewName("join");;
		
		return modelAndview;
		
	}
	@GetMapping("/login")
	public ModelAndView loginPage() {
		ModelAndView modelAndview = new ModelAndView();
		
		modelAndview.setViewName("login");;
		
		return modelAndview;
		
	}
	
	@PostMapping("/accountJoin")
	public String joinAct(HttpServletRequest request) {
		Member member = new Member();
		
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setAddress(request.getParameter("address"));
		member.setPhoneNum(request.getParameter("phoneNum"));
		member.setGender(request.getParameter("gender"));
		System.out.println(member);
		int a = 1;
		
		try {
			memberService.memberInsert(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "index";
	}
	
	@PostMapping("/login")
	public String login(String account, String password, HttpSession session) throws Exception {
		
		Member loginMember = memberService.memberLogin(account, password);
		System.out.println(loginMember);
		
		session.setAttribute("id", loginMember.getId());
		
		
		return "index";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		
		return "redirect:/";
	}
}
