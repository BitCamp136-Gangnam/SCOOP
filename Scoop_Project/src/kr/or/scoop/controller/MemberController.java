package kr.or.scoop.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.scoop.service.MemberService;
import kr.or.scoop.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="register.do",method=RequestMethod.POST)
	public String join(String email,String pwd,String name) throws ClassNotFoundException, SQLException {
		
		Member member;
		
		int result = 0;
		String viewpage="";
		
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		result = service.insertMember(email,pwd,name);
		
		if(result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/index.do";
		}else {
			System.out.println("가입실패");
			viewpage = "index.do";
		}
		
		return viewpage; //주의 (website/index.htm
		
	}
	
	@RequestMapping(value="register.do",method=RequestMethod.POST)
	public String memberConfirm(
				String email,String pwd,String name
			) {
		String viewpage="";
		
		//�쉶�썝�젙蹂�
		Member member = service.getMember(Principal.getName());
		
		//DB�뿉�꽌 媛��졇�삩 �븫�샇�솕�맂 臾몄옄�뿴
		String encodedPassword = member.getPwd();
		
		System.out.println("encodepassword : " + encodedPassword); //DB�뿉 ���옣�맂 �븫�샇�솕�맂 媛�
		
		//�엯�젰媛믨낵 �븫�샇�쉶�맂  媛� 留ㅼ묶�떆�궎�뒗 怨쇱젙(matches �븿�닔)
		boolean result = bCryptPasswordEncoder.matches(pwd, encodedPassword);
		
		if(result){
			viewpage="redirect:memberupdate.do";
		}else{
			viewpage="redirect:memberconfirm.do";
		}
		
		return viewpage;
	}
}
