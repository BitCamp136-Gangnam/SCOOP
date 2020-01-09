package kr.or.scoop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dto.Member;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.service.BoardService;
import kr.or.scoop.service.MemberService;
import kr.or.scoop.utils.Mail;

@Controller
public class MemberController {
	
	@Autowired
	private BoardService bservice;
	
	@Autowired
	private MemberService service;

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;

	// Front page 서블릿
	@RequestMapping(value = "frontpage.do", method = RequestMethod.GET)
	public String register() {
		return "frontpage";
	}

	// 일반 회원가입 인증
	@RequestMapping(value = "frontpage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String register(Member member, HttpSession session, Mail mail, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		response.setContentType("text/html; charset=UTF-8");
		int result = 0;
		String viewpage = "";
		session.setAttribute("checkemail", member.getEmail());
		session.setAttribute("checkpwd", this.bCryptPasswordEncoder.encode(member.getPwd()));
		session.setAttribute("checkname", member.getName());
		System.out.println("인서트 들어오니" + member);
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		int number = (int) ((Math.random() * 99999) + 100000);
		String temp = String.valueOf(number);
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			Map model = new HashMap();
			model.put("title", "협업공간 SCOOP 회원가입 인증 이메일입니다");
			// model.put("password", temp);
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngineFactoryBean.createVelocityEngine(), "emailTemplate.vm", "UTF-8", model);
			messageHelper.setFrom("bnbn1318@gmail.com");
			messageHelper.setTo(member.getEmail());
			messageHelper.setSubject("협업공간 SCOOP 회원가입 인증 이메일입니다");
			messageHelper.setText(mailBody, true);
			mailSender.send(message);
			PrintWriter out = response.getWriter();
			out.println("<script>Swal.fire({" + 
					"							        	    		  title: \"인증 이메일 발송\"," + 
					"							        	    		  text: \"이메일로 인증 이메일을 발송했습니다. 30분 이내에 인증해주세요\"," + 
					"							        	    		  icon: \"info\"," + 
					"							        	    		  button: \"확인\"" + 
					"							        	    		})</script>");
			out.flush(); 
			viewpage = "index";
		} catch (Exception e) {
			System.out.println("모시모시" + e.getMessage());
			viewpage = "index";
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>Swal.fire({\r\n" + 
						"							        	    		  title: \"인증 이메일 발송 중 에러\",\r\n" + 
						"							        	    		  text: \"이메일로 인증 이메일을 발송하던 도중 에러가 발생했습니다 이메일을 확인해주세요\",\r\n" + 
						"							        	    		  icon: \"error\",\r\n" + 
						"							        	    		  button: \"확인\"\r\n" + 
						"							        	    		})</script>");
				out.flush(); 
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		return viewpage; // 주의 (website/index.htm

	}

	// 일반 회원가입 인증 후 가입
	@RequestMapping(value = "registerOk.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String normalInsert(Member member, HttpSession session) throws ClassNotFoundException, SQLException {

		int result = 0;
		String viewpage = "";
		System.out.println("인서트 들어오니" + member);
		member.setPwd((String)session.getAttribute("checkpwd"));
		member.setEmail((String)session.getAttribute("checkemail"));
		member.setName((String)session.getAttribute("checkname"));
		System.out.println(session.getAttribute("checkpwd"));
		result = service.insertMember(member);

		if (result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/index.do";
			session.removeAttribute("checkpwd");
			session.removeAttribute("checkemail");
			session.removeAttribute("checkname");
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
	@RequestMapping(value = "googleLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
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
	@RequestMapping(value = "/userindex.do", method = RequestMethod.GET)
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
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script>Swal.fire({\r\n" + 
					"							        	    		  title: \"로그아웃\",\r\n" + 
					"							        	    		  text: \"로그아웃 성공\",\r\n" + 
					"							        	    		  icon: \"success\",\r\n" + 
					"							        	    		  button: \"확인\"\r\n" + 
					"							        	    		})</script>");
			out.flush(); 
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return viewpage;

	}

	/*
	 * //이슈작성
	 * 
	 * @RequestMapping(value="issue.do",method = RequestMethod.POST) public String
	 * issue(HttpSession session,Issue issue,String selectpro) { return null; }
	 */
	
	// 마이이슈 작성
	@RequestMapping(value = "/myissue.do", method = RequestMethod.GET)
	public String myissue() {
		return "sidebar/app-myissue";
	}

	/*
	 * @RequestMapping(value = "/myissue.do", method = RequestMethod.POST) public
	 * String myissuecheck() { return null;
	 * 
	 * }
	 */

	// 캘린더
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public String calendar() {
		return "sidebar/app-calender";
	}

	/*
	 * @RequestMapping(value = "/calendar.do", method = RequestMethod.POST) public
	 * String calendarcheck() { return null;
	 * 
	 * }
	 */

	// 네이버회원 로그인
	@RequestMapping(value = "naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
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

	// 캘린더
	@RequestMapping(value = "/certified.do")
	public String certified() {
		return "certified/Certified";
	}
	
	

}
