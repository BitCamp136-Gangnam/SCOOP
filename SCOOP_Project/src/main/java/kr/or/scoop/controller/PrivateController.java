package kr.or.scoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/private/")
public class PrivateController {
	
	@RequestMapping(value="private.do" , method = {RequestMethod.GET , RequestMethod.POST})
	public String privateIn() {
		System.out.println("프라이빗");
		String viewpage = "private-place";
		return viewpage;
		
	}
}
