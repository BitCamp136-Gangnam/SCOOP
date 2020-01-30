package kr.or.scoop.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String change(@RequestParam(required = false, name="lang") String language, HttpServletRequest request, HttpServletResponse response) {
		if(language == null) {
			language = "ko";
		}
		
		Locale locale  = new Locale(language);
		System.out.println(" locale : " + locale + "\n language : " + language);
		localeResolver.setLocale(request, response, locale);
		
		return "index";
	}
	

	
}
