package com.kh.vs;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import dao.VisitDAO;
import util.Page;
import util.Paging;
import vo.VisitVO;

@Controller
public class VisitController {
	
	@Autowired
	ServletContext app;
	
	@Autowired
	HttpServletRequest request;
	
	VisitDAO visit_dao;
	
	public void setVisit_dao(VisitDAO visit_dao) {
		this.visit_dao = visit_dao;
	}
	
	//전채 목록 보기
	@RequestMapping(value = {"/", "list.do"})
	public String list(Model model, String page) {
		//페이징---------------------------------------------------------- 
		int nowPage = 1;
		//page 파라미터가 있을 경우
		if(page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		int start = (nowPage - 1) * Page.Visit_Page.BLOCKLIST + 1;
		int end = start + Page.Visit_Page.BLOCKLIST - 1;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		// 전체 방면록 수
		int row_total = visit_dao.visit_count();
		//하단 페이지 바 생성
		String pageMenu = Paging.getPaging("list.do", nowPage, row_total, Page.Visit_Page.BLOCKLIST, Page.Visit_Page.BLOCKPAGE);
		model.addAttribute("pageMenu", pageMenu);
		//페이징 끝 -------------------------------------------------
		
		List<VisitVO> list = visit_dao.selectVisit(map);
		model.addAttribute("list", list);
		return Common.Visit.VIEW_PATH + "visit_list.jsp";
	}
	
	//새글 입력 폼
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return Common.Visit.VIEW_PATH + "visit_insert_form.jsp";
	}
	
	//새글 추가
	@RequestMapping("/insert.do")
	public String update(VisitVO vo) {
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		// 비밀번호 암호화를 위한 클래스 호출
		String encodePwd = Common.SecurePwd.encodePwd(vo.getPwd());
		vo.setPwd(encodePwd); //암호화된 비밀번호로 vo객체 갱신
		
		String webPath = "/resources/upload/";
		//upload까지의 절대 경로를 가져온다.
		String savePath = app.getRealPath(webPath);
		System.out.println(savePath);
		
		//업로드된 파일 정보
		MultipartFile photo = vo.getPhoto();
		
		String filename = "no_file";
		if(!photo.isEmpty()) {
			//업로드 된 실제 파일명
			filename = photo.getOriginalFilename();
			
			//파일을 저장할 경로 생성 
			File savefile = new File(savePath); //절대 경로
			
			if(!savefile.exists()) {
				savefile.mkdirs();
			}
		}
		
		
		visit_dao.insert(vo);
		return "redirect:list.do";
	}
	
	//글 삭제 요청
	@RequestMapping("/delete.do")
	@ResponseBody // Ajax로 요청받은 메서드
	public String delete( VisitVO vo ) {
		boolean isvalid = Common.SecurePwd.decodePwd(vo, visit_dao);

		if(isvalid) {
			//실제 삭제 DB 코드
			int res_del = visit_dao.delete(vo.getIdx());	
			
			if(res_del > 0) {
				//삭제 성공
				return "[{'result':'clear'}]";
			}else {
				//삭제 실패
				return "[{'result':'fail'}]"; 
			}
			
		}else {
			//비밀번호가 일치하지 않는다면
//			String str = String.format("[{'result':'%s'}]", res);
			return "[{'result':'no'}]";
		}
	}
	
	//수정을 위한 비밀번호 확인
		@RequestMapping("/modify_pwd_chk.do")
		@ResponseBody
		public String modify_chk( VisitVO vo ) {
			
			boolean isValid = Common.SecurePwd.decodePwd(vo, visit_dao);
			
			if(isValid) {
				//비밀번호가 일치하므로, 수정 form으로 이동
				String resIdx = 
						String.format("[{'result':'clear', 'idx':'%d'}]", vo.getIdx());
				return resIdx;
				
			}else {
				//비밀번호 불일치
				return "[{'result':'no'}]";
			}
			
		}
		
		@RequestMapping("/modify_form.do")
		public String modify_form( int idx, Model model) {
			
			//수정을 위한 게시글 한 건 조회
			VisitVO vo = visit_dao.selectOne(idx);
			model.addAttribute("vo",vo);
			return Common.Visit.VIEW_PATH + "modify_form.jsp";
			
		}
		
		//글 수정
		@RequestMapping("/modify_fin.do")
		@ResponseBody
		public String modify(VisitVO vo) {
			String ip = request.getRemoteAddr();
			vo.setIp(ip);
			
			//비밀번호 암호화
			String encodePwd = Common.SecurePwd.encodePwd(vo.getPwd());
			vo.setPwd(encodePwd);
			
			int res = visit_dao.update(vo);
			
			if(res > 0) {
				return "[{'result':'clear'}]";
			}else {
				return "[{'result':'fail'}]";
			}
		}
		
	}