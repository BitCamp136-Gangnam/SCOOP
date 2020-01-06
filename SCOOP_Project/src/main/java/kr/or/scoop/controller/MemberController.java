package kr.or.scoop.controller;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dto.Member;
import kr.or.scoop.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;		
	
	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	
	@RequestMapping(value="frontpage.do",method=RequestMethod.GET)
	public String register() {
		return "frontpage";
	}
	
	@RequestMapping(value="frontpage.do",method=RequestMethod.POST)
	public String register(Member member) throws ClassNotFoundException, SQLException {
		
		int result = 0;
		String viewpage="";
		System.out.println("인서트 들어오니"+member);
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
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
