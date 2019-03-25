package egovframework.example.restaurant.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestaurantController {

	@RequestMapping(value = "/RESTAURANT.do")
	public String restaurant() throws Exception {
		
		return "restaurant/restaurant.tiles";
	}
}
