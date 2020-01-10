package kr.or.scoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	// 마이이슈 작성
		@RequestMapping(value = "/myissue.do", method = RequestMethod.GET)
		public String myissue() {
			return "sidebar/app-myissue";
		}

		/*
		 * @RequestMapping(value = "/myissue.do", method = RequestMethod.POST) public
		 * String myissuecheck() { return null;
		 * 
		 * }
		 */

		// 캘린더
		@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
		public String calendar() {
			return "sidebar/app-calender";
		}

		/*
		 * @RequestMapping(value = "/calendar.do", method = RequestMethod.POST) public
		 * String calendarcheck() { return null;
		 * 
		 * }
		 */
}
