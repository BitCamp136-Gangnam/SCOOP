package kr.or.scoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ncontroller {

	@RequestMapping("index.htm")
	public String main() {
		return "issue";
	}
	
	@RequestMapping("calender.htm")
	public String calender() {
		return "sidebar/app-calender";
	}

	@RequestMapping("myissue.htm")
	public String issue() {
		return "sidebar/app-myissue";
	}

	@RequestMapping("private.htm")
	public String privateplace() {
		return "sidebar/private-place";
	}

	@RequestMapping("bookmark.htm")
	public String bookmark() {
		return "sidebar/private-bookmark";
	}
	
	@RequestMapping("coop-issue.htm")
	public String coopIssue() {
		return "cooperation/cooperation-issue";
	}
	
	@RequestMapping("coop-cal.htm")
	public String coopCal() {
		return "cooperation/cooperation-cal";
	}
	
	@RequestMapping("kanban.htm")
	public String kanban() {
		return "cooperation/cooperation-kanban";
	}
	
}
