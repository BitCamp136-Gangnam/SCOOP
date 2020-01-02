package kr.or.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ncontroller {
	
	@RequestMapping("/app-calender")
	public String calender(ModelMap modelMap) {
		
		return "sidebar/calender";
	}
}
