package egovframework.example.main.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.utils.JsonUtil;
import egovframework.example.cmmn.service.CmmnService;
import egovframework.example.main.service.MainService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MainController {

	@Resource
	private MainService mainService;
	
	@RequestMapping(value = "/HOME.do")
	public String Main(@RequestParam Map<String,Object> param,ModelMap model) throws Exception {
		System.out.println(param);
		
		
		return "main/main.main";
	}
	
	@RequestMapping(value = "/selectRoom.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectRoom(@RequestBody String req) throws Exception {
		
		System.out.println("req  :  " + req);
		
		Map<String,Object> param 			= JsonUtil.JsonToMap(req);
		Map<String, Object> SelectRoomList  = new HashMap<String, Object>();
		
		SelectRoomList 						= mainService.selectRoomServiceList(param);
		
		String map 							= JsonUtil.MapToJson(SelectRoomList);
		
		System.out.println("map :  " + map);
		
		return map;
	}
	
	
}
