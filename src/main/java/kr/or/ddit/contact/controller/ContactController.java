package kr.or.ddit.contact.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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

import kr.or.ddit.contact.service.IContactService;
import kr.or.ddit.contact.vo.ContactVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@Inject
	private IContactService contactService;
	

	@GetMapping("/list")
	public String ContactList(Model model) {
		
		List<ContactVO> contactList = contactService.getContactList();
		model.addAttribute("contactList", contactList);
		
		
		return "contact/list";
	}
	
	@PostMapping("/list")
	public String ContactRegister(@Validated ContactVO conVO, Model model) {
		
		// 일단은 주소록코드 'AB1'로 입력
		conVO.setAbCode("AB1");
		contactService.register(conVO);
		
		List<ContactVO> contactList = contactService.getContactList();
		model.addAttribute("contactList", contactList);
		
		model.addAttribute("msg","주소록 등록 완료");
		
		return "contact/list";
	}
	
	//기술지원본부 List start
	@GetMapping("/tehDetail")
	public String ContactTeh(Model model) {
		
		List<ContactVO> contactList = contactService.getTehList();
		model.addAttribute("contactList", contactList);
		
		
		return "contact/tehDetail";
	}
	
	@PostMapping("/tehDetail")
	public String ContactBookmark(@Validated ContactVO conVO, Model model) {
		
		// 일단은 주소록코드 'AB1'로 입력
		conVO.setAbCode("AB1");
		contactService.register(conVO);
		
		List<ContactVO> contactList = contactService.getContactList();
		model.addAttribute("contactList", contactList);
		
		model.addAttribute("msg","주소록 등록 완료");
		
		return "contact/tehDetail";
	}
	
	//영업부 List start
	@GetMapping("/salesDetail")
	public String ContactSales(Model model) {
		
		List<ContactVO> contactList = contactService.getSalesList();
		model.addAttribute("contactList", contactList);
		
		
		return "contact/salesDetail";
	}
	
	@PostMapping("/salesDetail")
	public String ContactSales(@Validated ContactVO conVO, Model model) {
		
		// 일단은 주소록코드 'AB1'로 입력
		conVO.setAbCode("AB1");
		contactService.register(conVO);
		
		List<ContactVO> contactList = contactService.getContactList();
		model.addAttribute("contactList", contactList);
		
		model.addAttribute("msg","주소록 등록 완료");
		
		return "contact/salesDetail";
	}
	//관리본부 List start
	@GetMapping("/mnDetail")
	public String ContactMn(Model model) {
		
		List<ContactVO> contactList = contactService.getMnList();
		model.addAttribute("contactList", contactList);
		
		
		return "contact/mnDetail";
	}
	
	@PostMapping("/mnDetail")
	public String ContactMn(@Validated ContactVO conVO, Model model) {
		
		// 일단은 주소록코드 'AB1'로 입력
		conVO.setAbCode("AB1");
		contactService.register(conVO);
		
		List<ContactVO> contactList = contactService.getContactList();
		model.addAttribute("contactList", contactList);
		
		model.addAttribute("msg","주소록 등록 완료");
		
		return "contact/mnDetail";
	}
	//관리본부 List finish
	
	
	//네트워크기술부
	@GetMapping("/networkDetail")
	public String ContactNt(Model model) {
		
		List<ContactVO> contactList = contactService.getNtList();
		model.addAttribute("contactList", contactList);
		
		
		return "contact/networkDetail";
	}
	
	@PostMapping("/networkDetail")
	public String ContactNt(@Validated ContactVO conVO, Model model) {
		
		// 일단은 주소록코드 'AB1'로 입력
		conVO.setAbCode("AB1");
		contactService.register(conVO);
		
		List<ContactVO> contactList = contactService.getContactList();
		model.addAttribute("contactList", contactList);
		
		model.addAttribute("msg","주소록 등록 완료");
		
		return "contact/networkDetail";
	}
	//보안기술부
	@GetMapping("/secDetail")
	public String ContactSec(Model model) {
		
		List<ContactVO> contactList = contactService.getSecList();
		model.addAttribute("contactList", contactList);
		
		
		return "contact/secDetail";
	}
	
	@PostMapping("/secDetail")
	public String ContactSec(@Validated ContactVO conVO, Model model) {
		
		// 일단은 주소록코드 'AB1'로 입력
		conVO.setAbCode("AB1");
		contactService.register(conVO);
		
		List<ContactVO> contactList = contactService.getContactList();
		model.addAttribute("contactList", contactList);
		
		model.addAttribute("msg","주소록 등록 완료");
		
		return "contact/secDetail";
	}
	
	@PostMapping(value="/remove",produces = "text/plain")
	@ResponseBody
	public String deleteContactList(@RequestBody ContactVO conVO){
		contactService.deleteContactList(conVO);
		return "success";
	}
	
	
}
