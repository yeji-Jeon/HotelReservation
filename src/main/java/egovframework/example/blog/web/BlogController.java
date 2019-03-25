package egovframework.example.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogController {

	@RequestMapping(value = "/BLOG.do")
	public String blog() throws Exception {
		
		return "blog/blog.tiles";
	}
}
