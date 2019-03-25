package egovframework.example.contact.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactController {

	@RequestMapping(value = "/CONTACT.do")
	public String Contact() throws Exception {
		
		return "contact/contact.tiles";
	}
}
