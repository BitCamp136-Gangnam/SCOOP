package kr.or.scoop.controller;

import java.sql.SQLException;

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
	
	@RequestMapping(value = "InviteOk.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String normalInsert(Member member, HttpSession session) throws ClassNotFoundException, SQLException {
		int result = 0;
		String viewpage = "";
		System.out.println("인바이트인서트 들어오니" + member);
		String mailTo = (String)session.getAttribute("mailTo");
		String tseq = (String)session.getAttribute("tseq");
		result = service.insertTeamPjt2(mailTo, tseq);
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
	
	@RequestMapping(value = "projectDetail.do" , method = RequestMethod.GET)
	public String JoinProject(int tseq, Model model) {
		System.out.println(tseq);
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		TeamPjt pjt = dao.detailPJT(tseq);
		System.out.println(pjt);
		model.addAttribute("tpj",pjt);
		
		return "user/ProjectDetail";
		
	}
	
	
}
