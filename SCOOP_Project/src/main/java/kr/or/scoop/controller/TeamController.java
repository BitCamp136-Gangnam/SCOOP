package kr.or.scoop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.service.BoardService;

@Controller
public class TeamController {
	
	/*
	 * @Autowired private SqlSession sqlsession;
	 */
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
			viewpage = "user/userindex";
		}else {
			System.out.println("프로젝트 생성실패");
			viewpage = "user/userindex";
		}
		return viewpage;
		
	}
}
