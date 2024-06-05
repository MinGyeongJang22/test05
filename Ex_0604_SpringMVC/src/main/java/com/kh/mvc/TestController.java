package com.kh.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import utill.Commons;

@Controller
public class TestController {
	
	// *중요* @RequestMapping에서 생성한 메서드의 반환형은 String, ModelAndView 두 가지 뿐이다.
	@RequestMapping("/test2.do")
	public ModelAndView test2( HttpServletRequest request ) {
		String[] sido = {"서울", "경기", "제주"};
		String ip = request.getRemoteAddr();
		
		// 데이터(sido, ip)와 뷰(test2.jsp) 정보를 하나로 묶어서 저장
		ModelAndView mv = new ModelAndView();
		mv.addObject("sido", sido);
		mv.addObject("ip", ip);
		mv.setViewName(Commons.Dept.VIEW_PATH + "test2.jsp");

		return mv;
	}
	
	@RequestMapping("/test.do")
	public String test( HttpServletRequest request ) {
		// util 패키지에 있는|Commons 클래스에 있는|내부 클래스 Dept가 가지고 있는|VIEW_PATH
		
		String[] fruit = {"사과", "오렌지", "바나나"};
		
		String ip = request.getRemoteAddr();
		request.setAttribute("msg", fruit);
		request.setAttribute("ip", ip);
		// model.addAttribute("msg", fruit);	// 바인딩

		return Commons.Dept.VIEW_PATH + "test.jsp";	  // 포워딩
	}
}
