package kr.or.ddit.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.common.vo.ComCodeVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Inject
	private INoticeService noticeService;
	
	@Inject
	private ICommentService commService;
	
	@Resource(name="uploadPath")
	private String uploadPath;		
	
	@Autowired // 믿음 분명 있을 거얌!, 스프링 너만 믿엉!
	private ServletContext servletContext;		
	
	
	@GetMapping("/home")
	public String home(Model model) {
		List<NoticeVO> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList",noticeList);
		
		// 각 게시글의 작성자 List<EmployeeVO> 구하기
		List<EmployeeVO> empList = noticeService.getEmpByNoticeList(noticeList);
		model.addAttribute("empList", empList);
				
		// 직급 리스트 posList
		List<ComCodeVO> posList = noticeService.getPosByEmpList(empList);
		model.addAttribute("posList", posList);
				
		// 좋아요 수 구하기.
		List<Integer> goodCountList = noticeService.getGoodByNoticeList(noticeList);
		model.addAttribute("goodCountList", goodCountList);
				
		return "notice/home";
	}


	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(NoticeVO noticeVO, Model model) {
		model.addAttribute("noticeVO",noticeVO);
		return "notice/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Validated NoticeVO noticeVO, MultipartFile attFile, Model model, HttpServletRequest req) throws IllegalStateException, IOException {
		
		// 공지사항을 먼저 등록하고나서 vo에 담겨있는 code를 사용
		noticeService.register(noticeVO);		
		
		log.info("af >> " + attFile);
		// 첨부파일 insert
		
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
		
		// 파일 첨부 한 경우만 처리
		if (!attFile.isEmpty()) {
			String uuid = UUID.randomUUID().toString();	// UUID로 임의의 파일명 생성
			String afSave = uuid+"_"+attFile.getOriginalFilename();		
			
			String savePath = servletContext.getRealPath("/resources/images");
			String filePath = uploadPath + "/" + afSave;
			String filePath2 = savePath + "/" + afSave;
			
			attFile.transferTo(new File(filePath)); // 요 한 줄로 끄읕!
			attFile.transferTo(new File(filePath2));
			
			log.debug("너머온 파일명:" + attFile.getOriginalFilename());
			log.debug("너머온 파일사이즈:" + attFile.getSize());
			String afName = attFile.getOriginalFilename();
			
			
			AttFileVO afVO = new AttFileVO();
			afVO.setAfType("NOTICE");
			afVO.setAfTcode(noticeVO.getNotCode());
			afVO.setAfName(afName);
			afVO.setAfSize(attFile.getSize());
			afVO.setAfSave(afSave);
			
			afVO.setAfExt(afName.split("\\.")[1].toUpperCase());
			
//		log.info("afvo >> " + afVO);
			noticeService.insertAf(afVO);		
		}
		
		
		
		// 메인 공지사항에 보이도록 notList 다시 조회
		List<NoticeVO> notList = noticeService.getRecNotList();
		session.setAttribute("notList", notList);
		
		return "redirect:/notice/home";
	}
	
	@RequestMapping(value = "/update",method = RequestMethod.GET)
	public String updateForm(String notCode,Model model) {
		NoticeVO noticeVO = noticeService.getNotice(notCode);
		model.addAttribute("noticeVO",noticeVO);
		return "notice/update";//
	}
	
	// path variable /update/{abc} // ${ } - el태그(jsp)
	//
	@RequestMapping(value = "/update/{notCode}",method = RequestMethod.POST)
	public String update(NoticeVO noticeVO, Model model, HttpServletRequest req) {
		noticeService.update(noticeVO);
		
		// 메인 공지사항에 보이도록 notList 다시 조회
		HttpSession session = req.getSession();
		List<NoticeVO> notList = noticeService.getRecNotList();
		session.setAttribute("notList", notList);
		
		return "notice/detail";//
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(String notCode,Model model, HttpServletRequest req) {
		noticeService.delete(notCode);
		
		// 메인 공지사항에 보이도록 notList 다시 조회
		HttpSession session = req.getSession();
		List<NoticeVO> notList = noticeService.getRecNotList();
		session.setAttribute("notList", notList);		
		
		return "redirect:/notice/home";
	}
	
	@RequestMapping(value = "/detail", method =  RequestMethod.GET)
	public String detail(String notCode, Model model) {
		noticeService.incrementHit(notCode);
		NoticeVO noticeVO = noticeService.getNotice(notCode);
		
		model.addAttribute("noticeVO",noticeVO);
		
		EmployeeVO empVO = noticeService.getEmpByNotice(noticeVO);
		model.addAttribute("empVO",empVO);
		
		ComCodeVO ccVO = new ComCodeVO();
		ccVO.setComGroup("EMP_POS");
		ccVO.setComCode(empVO.getEmpPos());
		
		ccVO = noticeService.getCc(ccVO);
		model.addAttribute("ccVO",ccVO);
		
		AttFileVO afVO = new AttFileVO();
		afVO.setAfType("PROFILE");
		afVO.setAfTcode(empVO.getEmpNo());

		afVO = noticeService.getAf(afVO);
		model.addAttribute("afVO",afVO);
		
		List<GoodVO> goodList = new ArrayList<GoodVO>();
		goodList = noticeService.getGood(noticeVO.getNotCode());
		
		if(goodList.size() != 0) {
			model.addAttribute("goodList",goodList);
			
			List<EmployeeVO> empList = noticeService.getEmpByGoodList(goodList);
			model.addAttribute("empList",empList);
			
			List<AttFileVO> afList = noticeService.getAfByEmpList(empList);
			model.addAttribute("afList",afList);
			
			List<ComCodeVO> posList = noticeService.getPosByEmpList(empList);
			model.addAttribute("posList",posList);
			
			List<ComCodeVO> timeList = noticeService.getTimeList(goodList);
			model.addAttribute("timeList",timeList);
		} else {
			model.addAttribute("goodList",null);
		}
		List<CommentVO> CommList = commService.list(notCode);
		model.addAttribute("CommList",CommList);
		
		// 첨부파일
		log.info("no chk >> ");
		AttFileVO attFile = new AttFileVO();		
		attFile.setAfType("NOTICE");
		attFile.setAfTcode(notCode);

		attFile = noticeService.getAf(attFile);
		log.info("af >> " + attFile);
		model.addAttribute("attFile",attFile);
		
		return "notice/detail";
		
	}
	
	@RequestMapping(value="/download")
	public View download(String afTcode, Model model) {
		
		AttFileVO afVO = new AttFileVO();
		afVO.setAfTcode(afTcode);
		afVO.setAfType("NOTICE");
		afVO = noticeService.getAf(afVO);
		
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




