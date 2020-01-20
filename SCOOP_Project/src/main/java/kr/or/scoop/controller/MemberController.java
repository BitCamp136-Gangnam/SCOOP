package kr.or.scoop.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.velocity.exception.VelocityException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.scoop.dao.AlarmDao;
import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dto.Alarm;
import kr.or.scoop.dto.Member;
import kr.or.scoop.dto.Role;
import kr.or.scoop.dto.Tpmember;
import kr.or.scoop.service.MemberService;
import kr.or.scoop.utils.Mail;

@Controller
public class MemberController {
	
	
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
			messageHelper.setFrom("leeyong1321@gmail.com");
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
		member.setPwd((String)session.getAttribute("checkpwd"));
		member.setEmail((String)session.getAttribute("checkemail"));
		member.setName((String)session.getAttribute("checkname"));
		System.out.println(session.getAttribute("checkpwd"));
		result = service.insertMember(member);

		if (result > 0) {
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
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		
		int result = 0;
		String viewpage = "";
		result = service.loginMember(email, pwd);
		if (result > 0) {
			viewpage = "redirect:/userindex.do";
			session.setAttribute("email", email);
			session.setAttribute("kind", "normal");
		} else {
			viewpage = "redirect:/index.do";
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
			viewpage = "redirect:/userindex.do";
			session.setAttribute("email", email);
			session.setAttribute("kind", "google");
		} else {
			viewpage = "redirect:/index.do";
		}

		return viewpage;
	}
	

	// 로그인 성공
	@RequestMapping(value = "/userindex.do", method = RequestMethod.GET)
	public String userindex(HttpSession session,Model model) {
		String email = "";
		
		email = (String)session.getAttribute("email");
		ProjectDao noticeDao = sqlsession.getMapper(ProjectDao.class);
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		Role role = memberdao.getRole(email);
		int count = memberdao.getCount(email);	
		String img = memberdao.getProfile(email); 
		
		session.setAttribute("img",img); 
		session.setAttribute("role", role.getRname());
		session.setAttribute("count", count);
		List<Tpmember> pjtlist = noticeDao.getPJT(email);
		if(pjtlist!=null) {
			session.setAttribute("pjtlist", pjtlist);
			AlarmDao dao = sqlsession.getMapper(AlarmDao.class);
			List<Alarm> alarm = dao.getAlarm((String)session.getAttribute("email"));
			
			if(alarm == null) {
				
			} else {
				model.addAttribute("alarm", alarm);
			}
		}
		/* System.out.println(pjtlist.get(0)); */
		return "user/userindex";
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, HttpServletResponse response) {
		String viewpage = "";
		System.out.println("로그아웃 함수");
		viewpage = "redirect:/index.do";
		session.invalidate();
		return viewpage;

	}

	/*
	 * //이슈작성
	 * 
	 * @RequestMapping(value="issue.do",method = RequestMethod.POST) public String
	 * issue(HttpSession session,Issue issue,String selectpro) { return null; }
	 */
	
	

	// 네이버회원 로그인
	@RequestMapping(value = "naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(String email, String name, HttpSession session) {

		int result = 0;
		String viewpage = "";
		result = service.naverIdCheck(email, name);
		if (result > 0) {
			System.out.println("성공");
			viewpage = "redirect:/userindex.do";
			session.setAttribute("email", email);
			session.setAttribute("kind", "naver");
			System.out.println(session.getAttribute("kind"));
		} else {
			System.out.println("실패");
			viewpage = "redirect:/index.do";
		}

		return viewpage;
	}

	// 본인 인증 메일 발송
	@RequestMapping(value="/forgotpwd.do")
	public String forgotPwd(Mail mail, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setContentType("text/html; charset=UTF-8");
		String email = request.getParameter("emailcheck");
		session.setAttribute("email", email);
		System.out.println("이메일 받아 오니? : " + email);
		System.out.println("세션 이메일 : " + session.getAttribute("email"));
		String viewpage = "";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			Map model = new HashMap();
			model.put("title", "협업공간 SCOOP 본인 인증 이메일입니다");
			// model.put("password", temp);
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngineFactoryBean.createVelocityEngine(), "forgotPwd.vm", "UTF-8", model);
			messageHelper.setFrom("leeyong1321@gmail.com");
			messageHelper.setTo(email);
			messageHelper.setSubject("회원님의 SCOOP 계정의 본인 인증 이메일입니다");
			messageHelper.setText(mailBody, true);
			mailSender.send(message);
			PrintWriter out = response.getWriter();
			out.println("<script>Swal.fire({" + 
					"title: \"비밀번호 변경 인증 메일 전송\"," + 
					"text: \"본인인증 이메일을 발송했습니다.\"," + 
					"icon: \"info\"," + 
					"button: \"확인\"" + 
					"})</script>");
			out.flush(); 
			viewpage = "index";
			
			
		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println("인증 메일 발송 에러");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>Swal.fire({\r\n" + 
						"title: \"인증 메일 전송 실패\",\r\n" + 
						"text: \"인증 이메일 발송 도중 에러가 발생했습니다 이메일을 확인해주세요\",\r\n" + 
						"icon: \"error\",\r\n" + 
						"button: \"확인\"\r\n" + 
						"})</script>");
				out.flush(); 
			viewpage = "index";
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}
		return viewpage;
	}
	
	// 이메일 인증 확인
	@RequestMapping(value="/emailCertified.do")
	public String emailCertified() {
		System.out.println("return certified");
		return "certified/emailCertified";
	}
	
	// 비밀번효 변경 페이지
	@RequestMapping(value="/changePwd.do")
	public String ChangePwd() {
		return "user/forgotPwd";
	}
	
	// 비밀번호 변경 완료
	@RequestMapping("changePwdOk.do")
	public String changePwdOk(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String pwd = this.bCryptPasswordEncoder.encode(request.getParameter("pwd"));
		String email = (String)session.getAttribute("email");
		
		System.out.println("Email : " + email);
		System.out.println("Password : " + pwd);
		
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		int result = dao.changePassword(pwd, email);
		System.out.println("비밀번호 인서트");
		
		String viewpage = "";
		if(result > 0) {
			System.out.println("인서트 성공");
			viewpage = "index";
		}else {
			System.out.println("인서트 실패");
			viewpage = "index";
		}
		return viewpage;
	}
	
	// 캘린더 // 이게 왜 캘린더야?
	@RequestMapping(value = "/certified.do")
	public String certified() {
		return "certified/Certified";
	}
	
	@RequestMapping(value = "inviteTeam.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String inviteTeam(HttpServletRequest request, HttpSession session) throws MessagingException, VelocityException, IOException {
		try {
			ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
			String mailFrom = (String)session.getAttribute("email");
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			request.setCharacterEncoding("UTF-8");
			String tseq = request.getParameter("tseq");
			int cnt = Integer.parseInt(request.getParameter("invitecnt"));
			System.out.println("cnt:"+cnt);
			String[] invitemem = new String[cnt];
			for(int i=0;i<cnt;i++) {
				invitemem[i] = request.getParameter("email"+i);
				int rank = dao.searchRank(Integer.parseInt(tseq), invitemem[i]);
				if(rank>0) {
					return "ajax/emailSwal";
				}
			}
			for(int i=0;i<cnt;i++) {
				if(request.getParameter("email"+i)!=null) {
					invitemem[i] = request.getParameter("email"+i);
					System.out.println(invitemem[i]);
					messageHelper.setFrom("leeyong1321@gmail.com");
					messageHelper.setTo(invitemem[i]);
					messageHelper.setSubject("협업공간 SCOOP 팀 멤버 초대 인증 이메일입니다");
					Map model = new HashMap();
					model.put("mailTo", invitemem[i]);
					model.put("mailFrom", mailFrom);
					model.put("tseq", tseq);
					String mailBody = VelocityEngineUtils.mergeTemplateIntoString(velocityEngineFactoryBean.createVelocityEngine(), "invite_email.vm","UTF-8", model);
					messageHelper.setText(mailBody,true);
					mailSender.send(message);
				}
			}
			
		} catch (Exception e) {
			String mailFrom = (String)session.getAttribute("email");
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			request.setCharacterEncoding("UTF-8");
			String tseq = request.getParameter("tseq");
			int cnt = Integer.parseInt(request.getParameter("invitecnt"));
			System.out.println("cnt:"+cnt);
			String[] invitemem = new String[cnt];
			for(int i=0;i<cnt;i++) {
				if(request.getParameter("email"+i)!=null) {
					invitemem[i] = request.getParameter("email"+i);
					System.out.println(invitemem[i]);
					messageHelper.setFrom("leeyong1321@gmail.com");
					messageHelper.setTo(invitemem[i]);
					messageHelper.setSubject("협업공간 SCOOP 팀 멤버 초대 인증 이메일입니다");
					Map model = new HashMap();
					model.put("mailTo", invitemem[i]);
					model.put("mailFrom", mailFrom);
					model.put("tseq", tseq);
					String mailBody = VelocityEngineUtils.mergeTemplateIntoString(velocityEngineFactoryBean.createVelocityEngine(), "invite_email.vm","UTF-8", model);
					messageHelper.setText(mailBody,true);
					mailSender.send(message);
				}
			}
			
		} 
		return "redirect:userindex.do";
	}
	
	//회원수정 페이지 이동
	@RequestMapping(value="memberEdit.do" , method = RequestMethod.GET)
	public String EditProfile(Model model,HttpSession session) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		Member member = dao.getMember((String)session.getAttribute("email"));
		
		model.addAttribute("member",member);
		session.setAttribute("img", member.getProfile());
		
		return "user/app-profile";
		
	}
	
	//회원수정 체크
	@RequestMapping(value="editCheck.do" , method = RequestMethod.POST)
	public String UpdateProfile(Member member,HttpServletRequest request,HttpSession session) {
		    System.out.println(member);
		
				
			CommonsMultipartFile multifile = member.getFilesrc();
			String filename = multifile.getOriginalFilename();
			member.setProfile(filename);
			String path = request.getServletContext().getRealPath("/user/upload");
			
			String fpath = path + "\\"+ filename; 
				
				if(!filename.equals("")) { //실 파일 업로드
					FileOutputStream fs = null;
					try {
						fs = new FileOutputStream(fpath);
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						
					}finally {
						try {
							fs.write(multifile.getBytes());
							fs.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				
				
		
		
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		dao.updateMember(member);
		
		return "redirect:/userindex.do";
	}
	
	// 결재페이지
	@RequestMapping(value = "/paymentPage.do")
	public String paymentPage() {
		return "user/Payment";
	}
	
	//알림 페이지 
	@RequestMapping(value="app-alram.do", method=RequestMethod.GET)
	public String alarmpage() {
		return "user/app-alram";
	}
	
	@RequestMapping(value="app-external.do", method=RequestMethod.GET)
	public String externalpage() {
		return "user/app-external";
	}
	
	@RequestMapping(value="updateRole.do", method=RequestMethod.POST)
	public String updateRole(HttpSession session) {
		int result = 0;
		String viewpage;
		result = service.updateRole((String)session.getAttribute("email"));
		if(result > 0) {
			viewpage = "redirect:/paymentPage.do";
		}else {
			viewpage = "user/userindex";
		}
		return viewpage;
		
	}
	
	
}
