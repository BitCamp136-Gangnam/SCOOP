package kr.or.scoop.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.service.MemberService;
import kr.or.scoop.vo.Member;

@Controller
@RequestMapping("//")
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="register.do",method=RequestMethod.POST)
	public String register(String email,String pwd,String name) throws ClassNotFoundException, SQLException {
		
		System.out.println("여기옴?");
		Member member = null;
		
		int result = 0;
		String viewpage="";
		
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		result = service.insertMember(email,pwd,name);
		
		if(result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/index.jsp";
		}else {
			System.out.println("가입실패");
			viewpage = "index.do";
		}
		
		return viewpage; //주의 (website/index.htm
		
	}
	

}
