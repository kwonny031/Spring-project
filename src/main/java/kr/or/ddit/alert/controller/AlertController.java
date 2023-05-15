package kr.or.ddit.alert.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.alert.service.IAlertService;
import kr.or.ddit.alert.vo.AlertVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.service.IGoodService;
import kr.or.ddit.good.vo.GoodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/alert")
public class AlertController {

	@Inject
	private IAlertService aleService;
	
	
	// alert update
	@PostMapping(value = "/update")
	@ResponseBody
	public void update(@RequestBody AlertVO aleVO, HttpServletRequest req) {
		
		log.info("aleVO >>"+aleVO);
		
		// session에서 empNo 추가
//		HttpSession session = req.getSession();
//		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
//		goodVO.setEmpNo(empVO .getEmpNo());
		
		aleService.update(aleVO);
		
	}
	
	
	
}





	