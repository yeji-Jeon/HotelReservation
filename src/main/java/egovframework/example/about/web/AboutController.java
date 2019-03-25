package egovframework.example.about.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {

	@RequestMapping(value = "/ABOUT.do")
	public String about() throws Exception {
		
		return "about/about.tiles";
	}
}
