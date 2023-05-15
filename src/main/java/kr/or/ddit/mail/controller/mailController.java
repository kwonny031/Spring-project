package kr.or.ddit.mail.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.mail.service.IMailService;
import kr.or.ddit.mail.vo.MailRecVO;
import kr.or.ddit.mail.vo.MailVO;
import kr.or.ddit.notice.controller.Download;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mail")
public class mailController {
	
	@Resource(name="uploadPath")
	private String uploadPath;

	@Inject
	private IMailService mailService;
	
	@Autowired // 믿음 분명 있을 거얌!, 스프링 너만 믿엉!
	private ServletContext servletContext;		
	

	// 보낸메일함List
	@GetMapping("/send")
	public String Mailsend(HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
		
		List<MailVO> mailList = mailService.selectSendList(empVO.getEmpNo());
		model.addAttribute("mailList", mailList);
		log.info("보낸 mailList"+mailList);
		
		return "mail/send";
	}
	
	

	// 받은메일함List
	@GetMapping("/recieveList")
	public String MailRecieve(HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
		
		List<MailVO> receiveList = mailService.selectReceiveList(empVO.getEmpNo());
		model.addAttribute("receiveList", receiveList);

		return "mail/recieveList";
	}

	// 메일 detail
	@GetMapping("/detail")
	public String detail(String mailCode, Model model, HttpServletRequest req, MailVO mailVO1) {
		
		HttpSession session = req.getSession();
		EmployeeVO empVO1 = (EmployeeVO) session.getAttribute("SessionInfo");
		
		MailVO mailVO = mailService.getMail(mailCode);
		
		mailVO1 = mailVO;
		//로그인 한 사람으로 바꿔서 넣어줌
		mailVO1.setEmpNo(empVO1.getEmpNo());
		
		List<MailVO> mailVOList = mailService.selectReceiveDetail(mailVO1);
		log.info("mailVOList : " + mailVOList);
		
		//작성자 empVO구하기
		EmployeeVO empVO = mailService.getEmpByMail(mailVO);
		model.addAttribute("empVO", empVO);
		
		//emp profile구하기
		AttFileVO afVO = new AttFileVO();
		afVO.setAfType("PROFILE");
		afVO.setAfTcode(empVO.getEmpNo());
		
		afVO = mailService.getAf(afVO);
		model.addAttribute("afVO", afVO);
		
		model.addAttribute("mailVO", mailVO);
		//sender, receiver, file 목록 포함
		log.info("mailVOList >> "+mailVOList);
		model.addAttribute("mailVOList",mailVOList);
		
		log.info("no chk >> ");
		AttFileVO fileInput = new AttFileVO();		
		fileInput.setAfType("");
		fileInput.setAfTcode(mailCode);

		fileInput = mailService.getAf(fileInput);
		log.info("af >> " + fileInput);
		model.addAttribute("attFile",fileInput);
		
		
		return "mail/detail";
	}

	// 메일보내기 주소록
	@GetMapping("/write")
	public String write(@Validated MailVO mailVO, Model model) {
		
		List<ContactVO> contactList = mailService.getContactList();
		model.addAttribute("contactList", contactList);
		
		return "mail/write";
	}
	
	@PostMapping("/write")
	public String MailWrite(
	        @Validated MailVO mailVO,
	        HttpServletRequest req,
	        @RequestParam("fileInput") MultipartFile fileInput, // 파일 업로드를 위한 파라미터
	        Model model) throws IllegalStateException, IOException {
	    
	    String sendEmpNo = ((EmployeeVO)req.getSession().getAttribute("SessionInfo")).getEmpNo();
	    String[] recvEmpNos = req.getParameterValues("empNo");

	    int count = mailService.write(sendEmpNo,recvEmpNos,mailVO);

	    if(recvEmpNos.length == count) {
	        model.addAttribute("msg", "ok");
	    }
	    
	    
	    
	    String uuid = UUID.randomUUID().toString();	// UUID로 임의의 파일명 생성
		String afSave = uuid+"_"+fileInput.getOriginalFilename();		
		
		String savePath = servletContext.getRealPath("/resources/images");
		String filePath = uploadPath + "/" + afSave;
		String filePath2 = savePath + "/" + afSave;
		
		fileInput.transferTo(new File(filePath)); // 요 한 줄로 끄읕!
		fileInput.transferTo(new File(filePath2));
		
		log.debug("너머온 파일명:" + fileInput.getOriginalFilename());
		log.debug("너머온 파일사이즈:" + fileInput.getSize());
		String afName = fileInput.getOriginalFilename();
		
		AttFileVO afVO = new AttFileVO();
		afVO.setAfType("MAIL");
		afVO.setAfTcode(mailVO.getMailCode());
		afVO.setAfName(afName);
		afVO.setAfSize(fileInput.getSize());
		afVO.setAfSave(afSave);
		
		afVO.setAfExt(afName.split("\\.")[1].toUpperCase());
		
		int count1 = mailService.insertAf(afVO);		
		
	
	    

	    List<ContactVO> contactList = mailService.getContactList();
	    model.addAttribute("contactList", contactList);

	    return "mail/process";
	}
	
	//메일 임시저장 작성하기
	//params매핑
	// 요청URI : /mail/write?outboxBtns
	@RequestMapping(value="/write",method=RequestMethod.POST,params="outboxBtn")
	public String outboxMail(
			@Validated MailVO mailVO,
			HttpServletRequest req, Model model) {
		
		log.info("outboxMail에 왔다");
		
		String sendEmpNo = ((EmployeeVO)req.getSession().getAttribute("SessionInfo")).getEmpNo();
		String[] recvEmpNos = req.getParameterValues("empNo");
		log.info("mailVO : " + mailVO);
		
		int count = mailService.outboxWrite(sendEmpNo, mailVO);
		
		if(recvEmpNos.length == count) {
			model.addAttribute("msg","ok");
		}
		//주소록에서 사원들 불러오는 리스트
		List<ContactVO> contactList = mailService.getContactList();
		model.addAttribute("contactList", contactList);
		
		return "mail/write";
	}
	
	//메일 보관함
	@GetMapping("/store")
	public String store(HttpServletRequest req, Model model) {
		
		List<MailVO> updateMailList = mailService.getStoreList();
		model.addAttribute("updateMailList", updateMailList);
		
		List<EmployeeVO> empList = mailService.getEmpByStoreList(updateMailList);
		model.addAttribute("empList", empList);
		
		return "mail/store";
	}
	
	//임시보관함
	@GetMapping("outbox")
	public String outbox(HttpServletRequest req, Model model) {
		
		List<MailVO> outboxList = mailService.getOutboxList();
		model.addAttribute("outboxList",outboxList);
		
		List<EmployeeVO> empList = mailService.getEmpByOutboxList(outboxList);
		model.addAttribute("empList",empList);
		
		return "mail/outbox";
	}

	
	// 메일 쓰레기통
	@GetMapping("/trash")
	public String trash() {
		
		return "mail/trash";
	}
	
	@GetMapping("/process")
	public String process() {
		
		return "mail/process";
	}
	
	
	@PostMapping(value = "/update", produces = "text/plain")
	@ResponseBody
	public String updateMail(@RequestBody MailRecVO marVO){
		
		log.info("code >> "+marVO.getMailCode());
		mailService.updateMail(marVO);
		return "success";
	}
	
	
	//받은 메일함 삭제
	@PostMapping(value= "/delete", produces = "text/plain")
	@ResponseBody
	public String deleteMail(@RequestBody MailVO mailVO) {
		
		mailService.deleteMail(mailVO);
		return "success";
		
	}
	
	@PostMapping(value= "/updateTag", produces = "text/plain")
	@ResponseBody
	public String insertMail(@RequestBody List<MailVO> mailList) {
		
		log.debug("mailList: >>>"+ mailList);
		for (MailVO mailVO : mailList) {
		mailService.updateTag(mailVO);
		}

		return "success";
		
	}
	
	@GetMapping("/outboxdetail")
	public String outboxdetail(String mailCode, Model model) {
		
		MailVO mailVO = mailService.getoutboxMail(mailCode);
		
		EmployeeVO empVO = mailService.getempByMail(mailVO);
		model.addAttribute("empVO",empVO);
		
		model.addAttribute("mailVO", mailVO);
		
		return "mail/outboxdetail";
	}
	
	//경영자료메일함
	@GetMapping("/mng")
	public String mngMail(HttpServletRequest req, Model model) {
		
		List<MailVO> mngList = mailService.getMngList();
		model.addAttribute("mngList",mngList);
		
		List<EmployeeVO> empList = mailService.getEmpByMngList(mngList);
		model.addAttribute("empList",empList);
		
		
		return "mail/mng";
	}
	//회계자료메일함
	@GetMapping("/act")
	public String actMail(HttpServletRequest req, Model model) {
		
		List<MailVO> actList = mailService.getActList();
		model.addAttribute("actList",actList);
		
		return "mail/act";
	}
	//참고자료메일함
	@GetMapping("/ref")
	public String refMail(HttpServletRequest req, Model model) {
		
		List<MailVO> refList = mailService.getRefList();
		model.addAttribute("refList",refList);
		
		return "mail/ref";
	}
	
	//메일 다운로드
	@RequestMapping(value="/download")
	public View mailDownload(String afTcode, Model model) {
		
		AttFileVO afVO = new AttFileVO();
		afVO.setAfTcode(afTcode);
		afVO.setAfType("MAIL");
		afVO = mailService.getAf(afVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("afVO", afVO);
		map.put("uploadPath", uploadPath);
		
		model.addAttribute("map", map);
		
		// 리턴되는 noticeDownloadView는 jsp페이지로 존재하는 페이지 Name을 요청하는 게 아니라,
		// 클래스를 요청하는 것인데, 해당 클래스가 스프링에서 제공하는 AbstractView 클래스를 상
		// 속받은 클래스인데 그 클래스는 AbstractView를 상속받아 renderMergedOutputModel 함수를
		// 재정의할 때 View로 취급될 수 있게 해준다.
		return new Download();
		
	}	
	
	

	
	
}

