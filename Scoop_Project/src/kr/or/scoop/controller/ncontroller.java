package kr.or.scoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ncontroller {

	@RequestMapping("index.do")
	public String main() {
		return "issue";
	}
	
	@RequestMapping("calender.do")
	public String calender() {
		return "sidebar/app-calender";
	}

	@RequestMapping("myissue.do")
	public String issue() {
		return "sidebar/app-myissue";
	}

	@RequestMapping("private.do")
	public String privateplace() {
		return "sidebar/private-place";
	}

	@RequestMapping("bookmark.do")
	public String bookmark() {
		return "sidebar/private-bookmark";
	}
	
	@RequestMapping("coop-issue.do")
	public String coopIssue() {
		return "cooperation/cooperation-issue";
	}
	
	@RequestMapping("coop-cal.do")
	public String coopCal() {
		return "cooperation/cooperation-cal";
	}
	
	public String kanban() {
		return "cooperation/cooperation-kanban";
	}
	
}
