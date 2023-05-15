package kr.or.ddit.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.admin.vo.adminMailVO;
import kr.or.ddit.employee.service.IEmpService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.schedule.vo.CarVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private IEmpService empSerivce;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String admin(Model model) {
		List<EmployeeVO> empList = empSerivce.listAdmin();
		model.addAttribute("empList",empList);
		return "admin/home";
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(EmployeeVO empVO,Model model) {
		model.addAttribute("empVO",empVO);
		return "admin/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Validated EmployeeVO empVO, Model model) {
		log.debug("[adminController 넘겨 받은 empVO 확인] :"+empVO);
		empSerivce.register(empVO);
		sendEmail(empVO);
		return "redirect:/admin/home";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String empNo,Model model) {
		EmployeeVO empVO =  empSerivce.getEmpNo(empNo);
		model.addAttribute("empVO",empVO);
		return "admin/detail";
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateForm(String empNo, Model model) {
		log.info("empNo >> "+empNo);
		EmployeeVO empVO = empSerivce.getEmpNo(empNo);
		model.addAttribute("empVO",empVO);
		return "admin/update";
	}
	
	@RequestMapping(value = "/update/{empNo}", method = RequestMethod.POST)
	public String update(EmployeeVO empVO, Model model) {
		empSerivce.update(empVO);
		return "redirect:/admin/home";
	}
	
	
	
	@RequestMapping(value = "/registerCar", method = RequestMethod.GET)
	public String registerForm(CarVO carVO,Model model) {
		model.addAttribute("carVO",carVO);
		return "admin/registerCar";
	}
	
	@RequestMapping(value = "/registerCar", method = RequestMethod.POST)
	public String register(@Validated CarVO carVO, Model model) {
		
		return "redirect:/admin/home";
		
	}
	
	
	public void sendEmail(EmployeeVO empVO) {
		String from = "ssiimm3018@gmail.com";
		String str = "    <div style=\"width: 800px; position: absolute; margin:auto;\">\r\n" + 
				"        <div >\r\n" + 
				"          <div class=\"card-header\" style=\"width:90%; background-color: rgb(85, 85, 189); padding:20px\">\r\n" + 
				"            <div style=\"color:white\"><strong>KURO Office</strong> 인재영입</div>\r\n" + 
				"          </div>\r\n" + 
				"          <div class=\"card-body\" style=\"margin:10px\">\r\n" + 
				"            <div style=\"font-size:xx-large; font-weight: bold; margin:20px\">\r\n" + 
				"                최종합격 <br>\r\n" + 
				"                축하드립니다.\r\n" + 
				"            </div>\r\n" + 
				"            <h3 class=\"card-title\">송강님 안녕하세요. KURO Office 인사담당자입니다.</h3>\r\n" + 
				"            <p class=\"card-text\">\r\n" + 
				"              2023년 상반기 보안기술부 신입 사원 모집에 <strong style=\"color:blue\">최종합격</strong>하셨음을 안내드립니다. <br>\r\n" + 
				"              진심으로 축하드립니다.<br>\r\n" + 
				"\r\n" + 
				"              송강님을 동료로 맞이할 수 있게 되어 영광입니다. <br><br>\r\n" + 
				"              아래는 사원번호(아이디)와 임시비밀번호입니다. 홈페이지에 접속 후 비밀번호를 변경해주세요.\r\n" + 
				"            </p>\r\n" + 
				"            <div style=\"background-color: #e0e0f7; border-radius: 5px; padding: 30px; width: 700px; font-size: medium;\">\r\n" + 
				"                \r\n" + 
				"                <div style=\"display: inline-block; margin: 0 50px\">사원번호 : <strong style=\"font-size: x-large;\">20230005</strong></div>\r\n" + 
				"                <div style=\"display: inline-block;\">임시 비밀번호 : <strong style=\"font-size: x-large;\">"+ empVO.getEmpPw() +"</strong></div>\r\n" + 
				"            </div>\r\n" + 
				"            <!-- <div style=\"margin:auto;\">\r\n" + 
				"                <a href=\"#\"><button>홈페이지로 이동</button></a>\r\n" + 
				"            </div> -->\r\n" + 
				"          </div>\r\n" + 
				"          <div class=\"card-header\" style=\"width:90%; background-color: rgb(85, 85, 189); padding:20px\">\r\n" + 
				"          </div>\r\n" + 
				"        </div>\r\n" + 
				"      </div>";
		 try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            
	              MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	            
	            
	            mailHelper.setFrom(from);
	            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
	            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
	            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
	            mailHelper.setTo(empVO.getEmpEmail());
	            mailHelper.setSubject("쿠로오피스입니다");
	            mailHelper.setText(str, true);
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	}
	
}
