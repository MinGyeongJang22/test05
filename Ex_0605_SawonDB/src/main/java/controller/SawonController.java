package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.SawonDAO;
import vo.SawonVO;
@Controller
public class SawonController {

	public static final String VIEW_PATH = "/WEB-INF/views/sawon/";

	SawonDAO sawon_dao;
	
	public SawonController( SawonDAO sawon_dao ) {
		this.sawon_dao = sawon_dao;
	}
	
	@RequestMapping( value = {"/", "/list.do"} )
	public String selectlist(Model model) {
		List<SawonVO> list = sawon_dao.selectList();
		model.addAttribute("list", list);
		return VIEW_PATH + "sawon_list.jsp";
	}
	
	@RequestMapping("/insert_form.do")
	public String insertForm() {
		return VIEW_PATH + "insert_form.jsp";
	}
	
	@RequestMapping("/insert.do")
	public String insert(SawonVO vo) {
		int res = sawon_dao.insert(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping("/delete.do")
	public String delete(int sabun) {
		int res = sawon_dao.delete(sabun);
		return "redirect:list.do";
	}
	
	@RequestMapping("/modify_form.do")
	public String selectOne(int sabun, Model model) {
		SawonVO vo = sawon_dao.selectOne(sabun);
		model.addAttribute("vo", vo);
		
		return VIEW_PATH + "modify_form.jsp";
	}
	
	@RequestMapping("/update.do")
	public String update(SawonVO vo, int before_sabun) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("before_sabun", before_sabun);
		int res = sawon_dao.update(map);
		
		return "redirect:list.do";
	}
}
