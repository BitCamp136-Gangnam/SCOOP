package kr.or.scoop.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dto.Member;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.service.BoardService;
import kr.or.scoop.service.PrivateService;
import kr.or.scoop.service.TeamService;

@Controller
public class TeamController {
	
	
	  @Autowired
	  private SqlSession sqlsession;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private TeamService teamservice;
	@Autowired
	private PrivateService privateservice;
	
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
		System.out.println(pjt);
		List<Tissue> tp = dao.getTissue(tseq);
		System.out.println(tp);
		model.addAttribute("tpj",pjt); //프로젝트 이름 , 설명
		model.addAttribute("tp",tp); //프로젝트 글 목록
		
		return "user/ProjectDetail";
		
	}
	
	// 이슈 작성
	@RequestMapping(value = "writeIssue.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String writeIssue(String issuetitle, String fileclick, String issuecontent, String selectTeam, Model model,
			HttpSession session, String[] mentions, HttpServletRequest request, String pname) {
		String path = "";
		if (pname.equals((String) session.getAttribute("email")) || pname == null) {
			MyIssue myissue = new MyIssue();
			myissue.setEmail((String) session.getAttribute("email"));
			myissue.setPititle(issuetitle);
			myissue.setPicontent(issuecontent);
			myissue.setIspibook(0);
				myissue.setMymention(mentions);
			int result = privateservice.writeMyissue(myissue);
			if(result >0) {
				path = "redirect:/userindex.do";
				System.out.println("success insert Myissue");
			}else {
				path = "redirect:/userindex.do";
				System.out.println("fail insert Myissue");
			}
			return path;
		} else {
			
			Tissue tissue = new Tissue();
			tissue.setEmail((String)session.getAttribute("email"));
			tissue.setTititle(issuetitle);
			tissue.setFilename(fileclick);
			tissue.setTicontent(issuecontent);
			tissue.setTseq(Integer.parseInt(selectTeam));
			int result = teamservice.writeTissue(tissue);
			if(result >0) {
				path = "user/ProjectDetail";
				System.out.println("success insert tissue");
			}else {
				path = "user/ProjectDetail";
				System.out.println("fail insert tissue");
			}
		}
		return path;

	}
}
