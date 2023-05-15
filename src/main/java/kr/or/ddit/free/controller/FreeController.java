package kr.or.ddit.free.controller;

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
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.common.Utils;
import kr.or.ddit.common.vo.ComCodeVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.service.IFreeService;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.notice.controller.Download;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.timeline.service.ITimelineService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/free")
public class FreeController {

	@Inject
	private IFreeService freeService;
	
	@Inject
	private ICommentService commService;
	
	@Resource(name="uploadPath")
	private String uploadPath;	
	
	@Autowired // 믿음 분명 있을 거얌!, 스프링 너만 믿엉!
	private ServletContext servletContext;	
	
	@GetMapping("/home")
	public String home(Model model) {
		
		List<FreeVO> freeList = freeService.getFreeList();
		model.addAttribute("freeList", freeList);
		
		// 각 게시글의 작성자 List<EmployeeVO> 구하기
		List<EmployeeVO> empList = freeService.getEmpByFreeList(freeList);
		model.addAttribute("empList", empList);
		
		// 직급 리스트 posList
		List<ComCodeVO> posList = freeService.getPosByEmpList(empList);
		model.addAttribute("posList", posList);
		
		// 좋아요 수 구하기.
		List<Integer> goodCountList = freeService.getGoodByFreeList(freeList);
		model.addAttribute("goodCountList", goodCountList);
		
		// 게시물 댓글 수
		List<Integer> commCountList = freeService.getCommCountByFreeList(freeList);
		model.addAttribute("commCountList", commCountList);
		
		
		return "free/home";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(FreeVO freeVO, Model model) {
		model.addAttribute("freeVO",freeVO);
		return "free/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Validated FreeVO freeVO, MultipartFile attFile, Model model, HttpServletRequest req)  throws IllegalStateException, IOException {
		freeService.register(freeVO);
//		log.info("af >> " + attFile);
		// 첨부파일 insert
		
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
			
			HttpSession session = req.getSession();
			EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
			
			AttFileVO afVO = new AttFileVO();
			afVO.setAfType("FREE");
			afVO.setAfTcode(freeVO.getFreeCode());
			afVO.setAfName(afName);
			afVO.setAfSize(attFile.getSize());
			afVO.setAfSave(afSave);
			
			afVO.setAfExt(afName.split("\\.")[1].toUpperCase());
			
	//		log.info("afvo >> " + afVO);
			freeService.insertAf(afVO);		
		}
		
		
		return "redirect:/free/home";
	}
	
	@RequestMapping(value = "/update",method = RequestMethod.GET)
	public String updateForm(String freeCode,Model model) {
		
		log.info("code >> "+ freeCode);
		FreeVO freeVO = freeService.getFree(freeCode);
		model.addAttribute("freeVO",freeVO);
		return "free/update";//
	}
	
	// path variable /update/{abc} // ${ } - el태그(jsp)
	//
	@RequestMapping(value = "/update/{freeCode}",method = RequestMethod.POST)
	public String update(FreeVO freeVO, Model model) {
		freeService.update(freeVO);
		return "free/detail";//
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(String freeCode,Model model) {
		freeService.delete(freeCode);
		return "redirect:/free/home"; //화면
	}
	
	
	@GetMapping("/detail")
	public String detail(String freeCode, Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();		
		if (session.getAttribute("SessionInfo") == null) {  
			// SessionInfo가 없으면 로그인 페이지로 이동
			return "conn/login";
		}		
		
		// 조회수 증가 - 먼저 하고 getFree()
		freeService.incrementHit(freeCode);
		FreeVO freeVO = freeService.getFree(freeCode);
		
		model.addAttribute("freeVO", freeVO);
		
		// 작성자 empVO 구하기
		EmployeeVO empVO = freeService.getEmpByFree(freeVO);
		model.addAttribute("empVO", empVO);
		
		// 작성자 직급
		ComCodeVO ccVO = new ComCodeVO();	
		ccVO.setComGroup("EMP_POS");
		ccVO.setComCode(empVO.getEmpPos());
		
		ccVO = freeService.getCc(ccVO);
		model.addAttribute("ccVO", ccVO);
		
		// emp의 profile 구하기
		AttFileVO afVO = new AttFileVO();
		afVO.setAfType("PROFILE");
		afVO.setAfTcode(empVO.getEmpNo());	
		
		afVO = freeService.getAf(afVO);
		model.addAttribute("afVO", afVO);
		
		// 좋아요 리스트 구하기.
		List<GoodVO> goodList = new ArrayList<GoodVO>();
		goodList = freeService.getGood(freeVO.getFreeCode());

		EmployeeVO SessionInfo = (EmployeeVO) session.getAttribute("SessionInfo"); 
		
		boolean goodFlag = false;
		
		if (goodList.size() != 0) {
			model.addAttribute("goodList", goodList);
			
			// 좋아요의 사원 리스트 구하기
			List<EmployeeVO> empList = freeService.getEmpByGoodList(goodList);
			model.addAttribute("empList", empList);
			
			// 좋아요 눌렀는지 여부
			for (EmployeeVO vo : empList) {
				if(SessionInfo.getEmpNo().equals(vo.getEmpNo())) {
					goodFlag = true;
				}
			}
			
			// 사원 목록의 프로필 가져오기
			List<AttFileVO> afList = freeService.getAfByEmpList(empList);
			model.addAttribute("afList", afList);
			
			// 직급 리스트 posList
			List<ComCodeVO> posList = freeService.getPosByEmpList(empList);
			model.addAttribute("posList", posList);
			
			// 좋아요 지난시간 리스트 가져오기 -> 리스트가 날짜순으로 정렬되게 하기
			List<ComCodeVO> timeList = freeService.getTimeList(goodList);
			model.addAttribute("timeList", timeList);
			
		}else {
			model.addAttribute("goodList", null);
		}
		
		model.addAttribute("goodFlag", goodFlag);
		
		List<CommentVO> CommList = commService.list(freeCode);
		model.addAttribute("CommList",CommList);
		log.info("CommList >> " + CommList);	
		
		List<AttFileVO> commProfileList = freeService.getAfByCommList(CommList);
		model.addAttribute("commProfileList",commProfileList);
		
		log.info("no chk >> ");
		AttFileVO attFile = new AttFileVO();		
		attFile.setAfType("FREE");
		attFile.setAfTcode(freeCode);

		attFile = freeService.getAf(attFile);
		log.info("af >> " + attFile);
		model.addAttribute("attFile",attFile);
		
		
		return "free/detail";
	}
	

	@RequestMapping(value="/download")
	public View download(String afTcode, Model model) {
		
		AttFileVO afVO = new AttFileVO();
		afVO.setAfTcode(afTcode);
		afVO.setAfType("FREE");
		afVO = freeService.getAf(afVO);
		
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
	
	// 좋아요 리스트 가져오기
	@PostMapping(value = "/goodList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JSONArray updateGood(@RequestBody GoodVO goodVO, HttpServletRequest req, Model model) {
		
		log.info("goodVO >>"+goodVO);
		Gson gson = new Gson();
		Map<String, Object> goodMap = new HashMap<String, Object>();
		// ${goodList } ${afList.get(i.index).afSave} goodFlag ${posList.get(i.index).ccName }
		// ${empList.get(i.index).empName } ${timeList.get(i.index).ccName }
		
		
		// 좋아요 리스트 구하기.
		List<GoodVO> goodList = new ArrayList<GoodVO>();
		goodList = freeService.getGood(goodVO.getGoodType());
		
		HttpSession session = req.getSession();
		EmployeeVO SessionInfo = (EmployeeVO) session.getAttribute("SessionInfo"); 
		
		boolean goodFlag = false;
		
		List<EmployeeVO> empList = null;
		List<AttFileVO> afList = null;
		List<ComCodeVO> posList = null;
		List<ComCodeVO> timeList = null;
		if (goodList.size() != 0) {
//			model.addAttribute("goodList", goodList);
			
			// 좋아요의 사원 리스트 구하기
			empList = freeService.getEmpByGoodList(goodList);
//			model.addAttribute("empList", empList);
			
			// 좋아요 눌렀는지 여부
			for (EmployeeVO vo : empList) {
				if(SessionInfo.getEmpNo().equals(vo.getEmpNo())) {
					goodFlag = true;
				}
			}
			
			// 사원 목록의 프로필 가져오기
			afList = freeService.getAfByEmpList(empList);
//			model.addAttribute("afList", afList);
			
			// 직급 리스트 posList
			posList = freeService.getPosByEmpList(empList);
//			model.addAttribute("posList", posList);
			
			// 좋아요 지난시간 리스트 가져오기 -> 리스트가 날짜순으로 정렬되게 하기
			timeList = freeService.getTimeList(goodList);
//			model.addAttribute("timeList", timeList);
			
		}else {
//			model.addAttribute("goodList", null);
		}
		
//		model.addAttribute("goodFlag", goodFlag);
		
		log.info("goodList >> " + goodList);
		log.info("goodList >> " + gson.toJson(goodList));
		goodMap.put("goodList", gson.toJson(goodList));
		goodMap.put("empList", gson.toJson(empList));
		goodMap.put("goodFlag", gson.toJson(goodFlag));
		goodMap.put("afList", gson.toJson(afList));
		goodMap.put("posList", gson.toJson(posList));
		goodMap.put("timeList", gson.toJson(timeList));
		log.info("map >> " + goodMap);
		
		JSONArray goodMapJson = new JSONArray();
		goodMapJson.add(gson.toJson(goodMap));
		log.info("map >> " + goodMapJson);
		
		return goodMapJson;
	}	
	
	
	

	
	
}



