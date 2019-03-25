package egovframework.example.cmmn;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.example.cmmn.service.CmmnService;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Resource
	private CmmnService cmmnService;
	
 @Override
public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {
	
	 if (!"XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	 
	 List<EgovMap> menuList		= cmmnService.selectMenuList();
	 List<EgovMap> RoomImgList  = cmmnService.selectRoomImgServiceList();
	 List<EgovMap> PageList		= cmmnService.selectPageNameServceList();
	 
		System.out.println("roomList  :" + menuList);
		System.out.println("RoomImgList :  " + RoomImgList);
		System.out.println("PageList :  " + PageList);
		
		
		modelAndView.addObject("roomList",menuList);
		modelAndView.addObject("RoomImgList",RoomImgList);
		modelAndView.addObject("PageList",PageList);
	 }
 }
}
