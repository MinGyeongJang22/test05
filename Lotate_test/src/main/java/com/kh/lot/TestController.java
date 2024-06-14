package com.kh.lot;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.BankDAO;
import service.BankService;
import vo.BankVO;
@Controller
public class TestController {
	BankDAO bank_dao;
	
	public TestController(BankDAO bank_dao) {
		this.bank_dao = bank_dao;
	}
	
	@RequestMapping(value = {"/", "list.do"})
	public String list(Model model) throws IOException {
		return Common.Bank.VIEW_PATH + "window.jsp"; 
	}
	
}
