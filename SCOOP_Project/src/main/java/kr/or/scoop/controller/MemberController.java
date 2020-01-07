package kr.or.scoop.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dto.Issue;
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

	// Front page 서블릿
	@RequestMapping(value = "frontpage.do", method = RequestMethod.GET)
	public String register() {
		return "frontpage";
	}

	// 일반 회원가입
	@RequestMapping(value = "frontpage.do", method = RequestMethod.POST)
	public String register(Member member) throws ClassNotFoundException, SQLException {

		int result = 0;
		String viewpage = "";
		System.out.println("인서트 들어오니" + member);
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		result = service.insertMember(member);

		if (result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/index.do";
		} else {
			System.out.println("가입실패");
			viewpage = "index";
		}

		return viewpage; // 주의 (website/index.htm

	}

	// 일반회원 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(String email, String pwd, HttpSession session) {

		int result = 0;
		String viewpage = "";
		result = service.loginMember(email, pwd);
		if (result > 0) {
			viewpage = "user/userindex";
			session.setAttribute("email", email);
			session.setAttribute("kind", "normal");
		} else {
			viewpage = "index";
		}

		return viewpage;
	}

	// 구글회원 로그인
	@RequestMapping(value = "googleLogin.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String googleLogin(String email, String name, HttpSession session) {

		int result = 0;
		String viewpage = "";
		result = service.googleIdCheck(email, name);
		if (result > 0) {
			System.out.println("성공");
			viewpage = "user/userindex";
			session.setAttribute("email", email);
			session.setAttribute("kind", "google");
			System.out.println(session.getAttribute("kind"));
		} else {
			System.out.println("실패");
			viewpage = "index";
		}

		return viewpage;
	}

	// 로그인 성공
	@RequestMapping(value = "/userindex.do",method = RequestMethod.GET)
	public String userindex() {
		return "user/userindex";
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, HttpServletResponse response) {
		String viewpage = "";
		System.out.println("로그아웃 함수");
		viewpage = "index";
		session.invalidate();
		return viewpage;

	}
	
	//이슈작성 
	@RequestMapping(value="issue.do",method = RequestMethod.POST)

	public String issue(HttpSession session,Issue issue,String selectpro) {
		return null;
		
	}
	//마이이슈 작성
	@RequestMapping(value = "/myissue.do",method = RequestMethod.GET) 
	public String myissue() {
		return "sidebar/app-myissue";
	}
	
	@RequestMapping(value = "/myissue.do",method = RequestMethod.POST) 
	public String myissuecheck() {
		return null;
		
	}
	
	//캘린더
	@RequestMapping(value = "/calendar.do",method = RequestMethod.GET)
	public String calendar() {
		return "sidebar/app-calender";
	}
	
	@RequestMapping(value = "/calendar.do",method = RequestMethod.POST) 
	public String calendarcheck() {
		return null;
		
	}
	//북마크
	@RequestMapping(value = "/bookmark.do",method = RequestMethod.GET)
	public String bookmark() {
		return "sidebar/private-bookmark";
	}
	
	@RequestMapping(value = "/bookmark.do",method = RequestMethod.POST) 
	public String bookmarkcheck() {
		return null;
		
	}
	
	// 네이버회원 로그인
	@RequestMapping(value = "naverLogin.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String naverLogin(String email, String name, HttpSession session) {

		int result = 0;
		String viewpage = "";
		result = service.naverIdCheck(email, name);
		if (result > 0) {
			System.out.println("성공");
			viewpage = "user/userindex";
			session.setAttribute("email", email);
			session.setAttribute("kind", "naver");
			System.out.println(session.getAttribute("kind"));
		} else {
			System.out.println("실패");
			viewpage = "index";
		}

		return viewpage;
	}

}
