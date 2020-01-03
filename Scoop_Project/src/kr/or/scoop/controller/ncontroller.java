package kr.or.scoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ncontroller {

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

	@RequestMapping("index.do")
	public String main() {
		return "issue";
	}

	@RequestMapping("bookmark.do")
	public String bookmark() {
		return "sidebar/private-bookmark";
	}
}
