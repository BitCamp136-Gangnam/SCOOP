package kr.or.scoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {

	// Index.do 서블릿
	@RequestMapping(value="/index.do")
	public String index() {
		return "index";
	}
	
	
}
