package kr.or.ddit.timeline.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.timeline.service.ITimelineService;
import kr.or.ddit.timeline.vo.TimelineVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/timeline")
public class TimelineController {

	@Inject
	private ITimelineService timeService;
	
	
	
	@RequestMapping(value = "/insertTime", method = RequestMethod.POST, produces = "text/plain")
	public ResponseEntity<String> insertTimeline(@RequestBody TimelineVO timVO){
		timeService.insertTime(timVO);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/listTime/{empNo}", method = RequestMethod.GET)
	public List<TimelineVO> timlist(@PathVariable String empNo){
		log.info("no >> "+empNo);
		
		return timeService.timlist(empNo);// 화면 이동 x 
		 
	}
	
	
}
