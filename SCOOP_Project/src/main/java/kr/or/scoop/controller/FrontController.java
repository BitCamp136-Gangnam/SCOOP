package kr.or.scoop.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

@Controller
public class FrontController {

	/*
	 * // Index.do 서블릿
	 * 
	 * @RequestMapping(value="/index.do") public String index(HttpSession session) {
	 * session.invalidate(); return "index"; }
	 */
	@Autowired
	private LocaleResolver localeResolver;
	
	@RequestMapping("/index.do")
	public String change(@RequestParam(required = false, name="lang") String language, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		if(language == null && session.getAttribute("language") != null) {
			language = (String)session.getAttribute("language");
		}else if(language == null) {
			language = "ko";
		}
		
		Locale locale  = new Locale(language);
		localeResolver.setLocale(request, response, locale);
		session.setAttribute("language", language);
		return "index";
	}
	

	
}
