package kr.or.ddit.message.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.message.service.IMessageService;
import kr.or.ddit.message.vo.MesrecVO;
import kr.or.ddit.message.vo.MessageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/message")
public class MessageController {

	@Inject
	private IMessageService messageService;

	// 받은 쪽지함
	@GetMapping("/home")
	public String MessageRecieve(HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
		
		List<MessageVO> receiveList = messageService.selectReceiveList(empVO.getEmpNo());
		model.addAttribute("receiveList", receiveList);
		return "message/home";

	}
	//쪽지 보관함
	@GetMapping("/store")
	public String store(HttpServletRequest req, Model model) {
		
	//	HttpSession session = req.getSession();
	//	EmployeeVO empVO = (EmployeeVO) session.getAttribute("SeesionInfo");
		
		List<MessageVO> updateMsgList = messageService.getStoreList();
		model.addAttribute("updateMsgList",updateMsgList);
		
		List<EmployeeVO> empList = messageService.getEmpByStoreList(updateMsgList);
		model.addAttribute("empList",empList);
		return "message/store";
	}

	// 보낸 쪽지함
	@GetMapping("/list2")
	public String MessageSend(HttpServletRequest req, String empNo, Model model) {
		log.debug("no>>" + empNo);
		
		
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");

		List<MessageVO> messageList = messageService.selectSendList(empNo);
		model.addAttribute("messageList", messageList);
		log.info("보낸messageList"+messageList);

//		List<EmployeeVO> empList = messageService.getEmpByMsgList(messageList);
//		model.addAttribute("empList", empList);
//		log.info("보낸empList"+empList);

		return "message/list2";
	}

	//쪽지보내기 주소록
	@GetMapping("/write")
	public String MessageWriteGet(@Validated MessageVO msgVO, Model model) {

		List<ContactVO> contactList = messageService.getContactList();
		model.addAttribute("contactList", contactList);

		return "message/write";
	}

	//쪽지보내기
	@PostMapping("/write") // List<String> mesList
	public String MessageWrite(
			String popup,
			@Validated MessageVO msgVO,
			HttpServletRequest req, Model model) {
				
		  String sendEmpNo = ((EmployeeVO)req.getSession().getAttribute("SessionInfo")).getEmpNo();
		  String[] recvEmpNos = req.getParameterValues("empNo");
		  
		  int count= messageService.write(sendEmpNo,recvEmpNos,msgVO);
		  
		  /*
		  String[] recvEmpNos = req.getParameterValues("empNo");
			log.debug("msgVO: " + msgVO);
			log.debug("empNos " + recvEmpNos);
		  
		  int count=0;
		  for (String empNo : recvEmpNos) {
			  msgVO.setEmpNo(empNo);
			  count += messageService.write(empNo, msgVO);
		  }
		  
		  */
		  if(recvEmpNos.length == count) {
				model.addAttribute("msg", "ok");			  
		  }
		  
		  
		   
		/*   
		String empNo = ((EmployeeVO)req.getSession().getAttribute("SessionInfo")).getEmpNo();
		int count = messageService.write(empNo, msgVO);
		
		log.info("cnt"+count);
		if(count > 0) {
			model.addAttribute("msg", "ok");
		}
        */
		// 쪽지수신 테이블 인서트

		List<ContactVO> contactList = messageService.getContactList();
		model.addAttribute("contactList", contactList);
		/*
		 * model.addAttribute("popup", "pop");
		 * 
		 * String goPage = "message/write"; if(popup.equals("1")) { goPage =
		 * "message/write_popup"; }
		 */
		
		return "message/write";
	}
	
	//받은 쪽지 detail
	@GetMapping("/sendDetail")
	public String sendDetail(String mesCode, Model model) {
		
		MessageVO messageVO = messageService.getMSG(mesCode);
		
		EmployeeVO empVO = messageService.getEmpByMessage(messageVO);
		model.addAttribute("empVO", empVO);
		
		model.addAttribute("messageVO", messageVO);
		
		return "message/sendDetail";
		
	}
	


	// 쪽지 detail
	@GetMapping("/detail")
	public String detail(String popup, String mesCode, Model model) {

		MessageVO messageVO = messageService.getMessage(mesCode);

		// 작성자 empVO 구하기
		EmployeeVO empVO = messageService.getEmpByMessage(messageVO);
		model.addAttribute("empVO", empVO);

		// emp의 profile 구하기
		AttFileVO afVO = new AttFileVO();
		afVO.setAfType("PROFILE");
		afVO.setAfTcode(empVO.getEmpNo());
		
		afVO = messageService.getAf(afVO);
		model.addAttribute("afVO", afVO);

		// 사원 목록의 프로필 가져오기
		// List<AttFileVO> afList = messageService.getAfByEmpList(empList);
		// model.addAttribute("afList", afList);

		model.addAttribute("messageVO", messageVO);

		return "message/detail";
	}
	
	@PostMapping(value = "/remove", produces = "text/plain")
	@ResponseBody
	public String deleteMsg(@RequestBody MessageVO msgVO){
		messageService.deleteMsg(msgVO);
		return "success";
	}
	
	
	@PostMapping(value = "/update", produces = "text/plain")
	@ResponseBody
	public String updateMsg(@RequestBody MesrecVO mesVO){
		
		log.info("code >> "+mesVO.getMesCode());
		messageService.updateMsg(mesVO);
		return "success";
	}
}
