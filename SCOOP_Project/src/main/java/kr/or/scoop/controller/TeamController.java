package kr.or.scoop.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dto.Member;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.service.BoardService;

@Controller
public class TeamController {
	
	
	  @Autowired
	  private SqlSession sqlsession;
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "team.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String CreateProject(TeamPjt team) {
		System.out.println("팀컨 와?" + team);
		int result = 0;
		String viewpage;
		
		System.out.println("팀컨 와?" + team);
		result = service.insertTeamPjt(team);
		
		if(result > 0) {
			System.out.println("프로젝트 생성성공");
			viewpage = "redirect:/userindex.do";
		}else {
			System.out.println("프로젝트 생성실패");
			viewpage = "redirect:/userindex.do";
		}
		return viewpage;
		
	}
	
	@RequestMapping(value = "inviteOk.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String normalInsert(HttpSession session) throws ClassNotFoundException, SQLException {
		int result = 0;
		String viewpage = "";
		String email = (String)session.getAttribute("mailTo");
		String temptseq = (String)session.getAttribute("tseq");
		int tseq = Integer.parseInt(temptseq);
		System.out.println("메일투"+email);
		System.out.println("티에스이큐"+tseq);
		result = service.insertTeamPjt2(email, tseq);
		if (result > 0) {
			System.out.println("협업공간 초대 성공");
			viewpage = "redirect:/userindex.do";
		} else {
			System.out.println("가입실패");
			viewpage = "index";
		}

		return viewpage; // 주의 (website/index.htm

	}
	
	@RequestMapping(value = "/invitecertified.do")
	public String certified() {
		System.out.println("인바이트서티파이드");
		return "certified/InviteCertified";
	}
	
	//팀 디테일 
	@RequestMapping(value = "projectDetail.do" , method = RequestMethod.GET)
	public String JoinProject(int tseq, Model model) {
		System.out.println(tseq);
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		TeamPjt pjt = dao.detailPJT(tseq);
		List<TeamPjt> tp = dao.getTissue(tseq);
		System.out.println(pjt);
		model.addAttribute("tpj",pjt); //프로젝트 이름 , 설명
		model.addAttribute("tp",tp); //프로젝트 글 목록
		
		return "user/ProjectDetail";
		
	}
	
	// 이슈 작성
	@RequestMapping(value = "writeIssue.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String writeIssue(String issuetitle, String fileclick, String issuecontent, String selectTeam, Model model,
			HttpSession session, String mention) {
		String path = "";
		if (selectTeam.equals((String) session.getAttribute("email"))) {
			path = "writeMyIssue.do";
		} else {
			path = "writeTissue.do"; // 주석주석
		}
		return path;

	}
	
	
	// 마이이슈 작성
	@RequestMapping(value = "writeTissue.do", method = RequestMethod.POST)
	public String writeTissue(String issuetitle, String fileclick, String issuecontent, String selectTeam, Model model,
			HttpSession session) {
		

		return "user/ProjectDetail";

	}

	// 팀 이슈 작성
	@RequestMapping(value = "writeMyIssue.do", method = RequestMethod.POST)
	public String writeMyIssue(String issuetitle, String fileclick, String issuecontent, String selectTeam, Model model,
			HttpSession session) {


		return "user/ProjectDetail";

	}
	

	
}
