package kr.or.scoop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {

	// Index.do 서블릿
	@RequestMapping(value="/index.do")
	public String index(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	
}
