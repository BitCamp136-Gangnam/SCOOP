package kr.or.bit.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.bit.dto.Member;
import kr.or.bit.service.memberService;

@Controller
public class memberController {
	
	@Autowired
	private memberService service;		

	
	@RequestMapping(value="frontpage.do",method=RequestMethod.GET)
	public String register() {
		return "frontpage";
	}
	
	@RequestMapping(value="frontpage.do",method=RequestMethod.POST)
	public String register(Member member) throws ClassNotFoundException, SQLException {
		
		int result = 0;
		String viewpage="";
		System.out.println("인서트 들어오니"+member);
		/* member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd())); */
		result = service.insertMember(member);
		
		if(result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/index.do";
		}else {
			System.out.println("가입실패");
			viewpage = "frontpage.do";
		}
		
		return viewpage; //주의 (website/index.htm

	}
}
