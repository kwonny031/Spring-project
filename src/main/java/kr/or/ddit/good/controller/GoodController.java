package kr.or.ddit.good.controller;



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

import kr.or.ddit.alert.vo.AlertVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.service.IGoodService;
import kr.or.ddit.good.vo.GoodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/good")
public class GoodController {

	@Inject
	private IGoodService goodService;
	

	//나의 좋아요
	@GetMapping("/list")
	public String list(Model model, HttpServletRequest req, String empNo) {
	    

		String myLikeNo = ((EmployeeVO)req.getSession().getAttribute("SessionInfo")).getEmpNo();
	    List<GoodVO> myLikes = goodService.getLikesByUsername(myLikeNo);
	    
	   
	    
	    model.addAttribute("myLikes", myLikes);

		return "good/list";
	}

	//상대방의 좋아요
	@GetMapping("/list2")
	public String list2(Model model, HttpServletRequest req) {
		
		String empNo = ((EmployeeVO)req.getSession().getAttribute("SessionInfo")).getEmpNo();
		List<GoodVO> goodList = goodService.getGoodList(empNo);
		
		log.info("gl >> " + goodList);
		model.addAttribute("goodList", goodList);
		
//		List<EmployeeVO> empList = goodService.getEmpByGoodList(goodList);
//		model.addAttribute("empList", empList);
		
		return "good/list2";
	}
	
	/*
	 * @GetMapping("/posts") public String getPosts(@RequestParam(defaultValue =
	 * "1") int page, Model model) { Pageable pageable = PageRequest.of(page - 1,
	 * PAGE_SIZE); Page<Post> postPage = postRepository.findAll(pageable);
	 * 
	 * model.addAttribute("posts", postPage.getContent());
	 * model.addAttribute("currentPage", page); model.addAttribute("totalPages",
	 * postPage.getTotalPages());
	 * 
	 * return "post-list"; // 게시물 목록을 보여주는 뷰 이름 }
	 */
	
	

	//공지게시판insert
	@PostMapping(value = "/insert", produces = "text/plain")
	@ResponseBody
	public String insertGood(@RequestBody GoodVO goodVO, HttpServletRequest req) {
		
		log.info("code >>");
		
		// session에서 empNo 추가
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
		goodVO.setEmpNo(empVO .getEmpNo());
		goodService.insertGood(goodVO);
		
		return "success";
	}
	
	//자유게시판에서 좋아요 누른 경우
	@PostMapping(value = "/insertFree", produces = "text/plain")
	@ResponseBody
	public String insertFree(@RequestBody GoodVO goodVO, HttpServletRequest req) {
		
		log.info("code >>"+goodVO);
		
		// session에서 empNo 추가
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
		goodVO.setEmpNo(empVO .getEmpNo());
		goodService.insertFree(goodVO);
		
		// aleVO insert
		AlertVO aleVO = new AlertVO();
		aleVO.setAleType(goodVO.getGoodType());
		goodService.insertAlert(aleVO);
		
		return "success";
	}
	
	// 좋아요 취소하는 경우(수정이지만 delete를 하는 걸로)
	@PostMapping(value = "/updateGood", produces = "text/plain")
	@ResponseBody
	public String updateGood(@RequestBody GoodVO goodVO, HttpServletRequest req) {
		
		log.info("goodVO >>"+goodVO);
		
		// session에서 empNo 추가
//		HttpSession session = req.getSession();
//		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
//		goodVO.setEmpNo(empVO .getEmpNo());
		
		goodService.deleteGood(goodVO);
		
		return "success";
	}
	
	
	
}





	