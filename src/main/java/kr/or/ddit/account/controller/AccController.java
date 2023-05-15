package kr.or.ddit.account.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.account.service.IAccService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/acc")
public class AccController {
	
	@Inject
	private IAccService accService;
	
	@GetMapping("/home")
	public String account() {
		return "acc/home";
	}
}
