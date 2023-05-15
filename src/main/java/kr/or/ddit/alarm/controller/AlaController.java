package kr.or.ddit.alarm.controller;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.alarm.vo.AlaVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.schedule.vo.ScheduleVO;


@RestController
public class AlaController {

	
	@Inject
	private JavaMailSenderImpl mailSender;
	
  
	@RequestMapping(value = "/sendAlarm", method = RequestMethod.GET)
	public ResponseEntity<String> sendAlarm(HttpSession session,HttpServletRequest req) {
		ScheduleVO SchVO = new ScheduleVO();
		AlaVO alaVO = new AlaVO();
		session  = req.getSession();
		String from = "hee822090@gmail.com";
		try {
            MimeMessage mail = mailSender.createMimeMessage();
              MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            mailHelper.setFrom(from);
            mailHelper.setTo(((EmployeeVO)req.getSession().getAttribute("SessionInfo")).getEmpEmail());
            mailHelper.setSubject("예약메일입니다");
            mailHelper.setText("예약메일입니다.", true);
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("FAILED", HttpStatus.OK);
        }
        return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		
	}
}
