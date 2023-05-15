package kr.or.ddit.main.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.ddit.approval.service.IAppService;
import kr.or.ddit.approval.vo.AplineVO;
import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.cloud.service.ICloudService;
import kr.or.ddit.cloud.vo.CloudVO;
import kr.or.ddit.common.Utils;
import kr.or.ddit.common.vo.ComCodeVO;
import kr.or.ddit.dep.vo.DepVO;
import kr.or.ddit.employee.service.IEmpService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.main.service.IMainService;
import kr.or.ddit.main.vo.mailjoinVO;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.timeline.vo.TimelineVO;
import kr.or.ddit.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/conn")
public class LoginController {

	@Inject
	private IMainService loginService;
	
	@Inject
	private IEmpService empService;
	
	@Inject
	private IAppService appService; 
	
	@Inject
	private ICloudService cloudService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	
	@GetMapping("/login")
	public String login() {
		
		return "main/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest req, EmployeeVO empVO, Model model) throws Exception {
		
		// 임시 로그인 체크
		log.info("no, pw >> " + empVO.getEmpNo()+", "+empVO.getEmpPw());
		empVO = loginService.loginCheck(empVO);
		
		HttpSession session = req.getSession();
		session.setAttribute("empVO", empVO);
		
		if (empVO == null) {
			model.addAttribute("msg", "로그인 정보를 확인해주세요.");
			return "conn/login";
		}
		
		return "redirect:/main/home";
		
	}
	

	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "conn/login";
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String loginFind(Model model) {
		model.addAttribute("bodyText","login-page");
		log.debug("find>>>");
		return "conn/find";
	}
	
	@RequestMapping(value = "/idfind", method = RequestMethod.POST)
	public ResponseEntity<String> idFind(EmployeeVO empVO){
		String empNo = empService.idFind(empVO);
		return new ResponseEntity<String>(empNo,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/pwfind", method = RequestMethod.POST)
	public ResponseEntity<String> pwFind(EmployeeVO empVO){
		String empNo = empService.pwFind(empVO);
		return new ResponseEntity<String>(empNo,HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/sendMail", produces = "text/plain; charset=utf-8")
	@ResponseBody
    public ResponseEntity<String> sendjoinMail(@RequestBody mailjoinVO mvo, HttpSession session ) throws Exception{
		 	Random random = new Random();
			
		 	log.info("temp >> " + mvo.getTempPw());
		 	
//			int ranNum = random.nextInt(100000);
			
		 	// 비밀번호 변경
		 	EmployeeVO empVO = new EmployeeVO();
		 	empVO.setEmpPw(mvo.getTempPw());
		 	empVO.setEmpNo(mvo.getJoinNum());
		 	log.info("emp >> " + empVO);
		 	loginService.update(empVO);
		 	
		 	
			session.setAttribute("ranNum", mvo.getTempPw());
	        session.setMaxInactiveInterval(20);
	        
	        String from = "ssiimm3018@gmail.com";
	        String str = "    <div style=\"width: 800px; position: absolute; margin:auto;\">\r\n" + 
					"        <div >\r\n" + 
					"          <div class=\"card-header\" style=\"width:90%; background-color: rgb(85, 85, 189); padding:20px\">\r\n" + 
					"            <div style=\"color:white\"><strong>KURO Office</strong> 시스템</div>\r\n" + 
					"          </div>\r\n" + 
					"          <div class=\"card-body\" style=\"margin:10px\">\r\n" + 
					"            <div style=\"font-size:xx-large; font-weight: bold; margin:20px\">\r\n" + 
					"                임시 비밀번호입니다.<br>\r\n" + 
					"            </div>\r\n" + 
					"            <h3 class=\"card-title\">사원님 안녕하세요. KURO Office 프로그램 담당자입니다.</h3>\r\n" + 
					"            <p class=\"card-text\">\r\n" + 
					"              "+
					"              아래는 임시 비밀번호입니다. 홈페이지에 접속 후 마이페이지에서 비밀번호를 변경 해주세요.\r\n" + 
					"            </p><br>\r\n" + 
					"            <div style=\"background-color: #e0e0f7; border-radius: 5px; padding: 30px; width: 700px; font-size: medium;\">\r\n" + 
					"                \r\n" + 
					"                <div style=\"display: inline-block; margin: 0 50px\">사원번호 : <strong style=\"font-size: x-large;\">"+mvo.getJoinNum()+"</strong></div>\r\n" + 
					"                <div style=\"display: inline-block;\">임시 비밀번호 : <strong style=\"font-size: x-large;\">"+ mvo.getTempPw() +"</strong></div>\r\n" + 
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
	            mailHelper.setTo(mvo.getTo());
	            mailHelper.setSubject("[Kuro Office] 비밀번호 찾기 결과입니다");
	            mailHelper.setText(str, true);
	            // true는 html을 사용하겠다는 의미입니다.
	            
	            /*
	             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
	             */
	            
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	            return new ResponseEntity<String>("FAILED", HttpStatus.OK);
	        }
	        
	        
	        return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    }
	
	

	@RequestMapping(value = "/numberCheck", produces = "text/plain; charset=utf-8")
	@ResponseBody
    public ResponseEntity<String> numCheck(@RequestBody mailjoinVO mvo, HttpSession session) throws Exception{
		int ranNum;
		System.out.println(mvo.getJoinNum());
		if(session.getAttribute("ranNum")!=null) {
		 ranNum = (int)session.getAttribute("ranNum");
		}else {
			ranNum = 0;
		}
		
		
		if(mvo.getJoinNum().equals(String.valueOf(ranNum))) {
			
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
	        
    }
	
}



