package kr.or.scoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/private/")
public class PrivateController {
	
	@RequestMapping(value="private.do" , method = RequestMethod.GET)
	public String privateIn() {
		return "private-place";
		
	}
}
