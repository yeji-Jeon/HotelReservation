package egovframework.example.room.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.room.service.RoomService;

@Controller
public class RoomController {

	@Resource
	private RoomService roomService;
	
	@RequestMapping(value = "/ROOMS.do")
	public String room(ModelMap model) throws Exception {
		
		
		return "room/room.tiles";
	}
}
