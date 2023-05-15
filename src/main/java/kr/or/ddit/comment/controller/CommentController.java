package kr.or.ddit.comment.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.free.service.IFreeService;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.timeline.service.ITimelineService;
import kr.or.ddit.timeline.vo.TimelineVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/comment")
public class CommentController {

	@Inject
	private ICommentService commService;
	
	@Inject
	private IFreeService freeService;
	
	 
	/*
	 * @Inject private ITimelineService timeService;
	 */
	
	@RequestMapping(value = "/insertComm", method = RequestMethod.POST, produces = "text/plain")
	public ResponseEntity<String> insertComm(@RequestBody CommentVO commVO) {
		commService.insertComm(commVO);
		/*
		 * TimelineVO timeVO = new TimelineVO(); timeService.insertTime(timeVO);
		 */
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/list/{freeCode}",method = RequestMethod.GET)
	public List<CommentVO> CommentList(@PathVariable String freeCode){
		
		List<CommentVO> list = commService.list(freeCode); 
		log.info("list >> " + list);
		return list;
	}
	
	@RequestMapping(value = "/updateComm", method = RequestMethod.POST, produces = "text/plain")
	public ResponseEntity<String> updateComm(@RequestBody CommentVO commVO){
		commService.updateComm(commVO);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}

	@RequestMapping(value = "/deleteComm", method = RequestMethod.POST, produces = "text/plain")
	public ResponseEntity<String> deleteComm(@RequestBody CommentVO commVO){
		commService.deleteComm(commVO);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
}
