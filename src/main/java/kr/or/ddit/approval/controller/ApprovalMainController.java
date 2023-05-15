package kr.or.ddit.approval.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

//import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.approval.service.IAppService;
import kr.or.ddit.approval.vo.ApFormVO;
import kr.or.ddit.approval.vo.AplineUpdateVO;
import kr.or.ddit.approval.vo.AplineVO;
import kr.or.ddit.approval.vo.AppIngVO;
import kr.or.ddit.approval.vo.AppVO;
import kr.or.ddit.approval.vo.RecVO;
import kr.or.ddit.approval.vo.RecruitAppFormVO;
import kr.or.ddit.approval.vo.RecruitFormVO;
import kr.or.ddit.approval.vo.VacationAppFormVO;
import kr.or.ddit.approval.vo.VacationFormVO;
import kr.or.ddit.approval.vo.VacationVO;
import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.employee.service.EmpServiceImpl;
import kr.or.ddit.employee.service.IEmpService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.schedule.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/approval")
public class ApprovalMainController {

	@Inject
	private IAppService appService;
	
//	@Resource(name="uploadPath")
//	private String resourcePath;
//	
//	private String uploadPath = "C://upload";
	@Autowired
	ResourceLoader resouceLoader;
	
	
	//전자결재 홈
	@GetMapping("/home")
	public String home(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		
		//진행중인 기안 리스트
		List<AppIngVO> appList = appService.getAppListByEmpNo(empVO);
		model.addAttribute("appList", appList);
		
		//완료 문서 리스트
		List<AppVO> appEndList = appService.getAppEndListByEmpNo(empVO);
		model.addAttribute("appEndList", appEndList);
		
		//결재할 문서 리스트
		List<AplineVO> appLineList = appService.getAppLineListByEmpNo(empVO);
		model.addAttribute("appLineList", appLineList);
		log.info("appLineList: "+ appLineList);
		
		return "approval/home";
	}
	
	//내가 결재할 리스트 페이지
	@GetMapping("/aplineList")
	public String aplineList(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		
		//결재할 문서 리스트
		List<AplineVO> appLineList = appService.getAppLineListByEmpNo(empVO);
		model.addAttribute("appLineList", appLineList);
		
		return "approval/aplineList";
	}
	
	//결재 완료 페이지
	@GetMapping("/appendList")
	public String appendList(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		
		//완료 문서 리스트
		List<AppVO> appEndList = appService.getAppEndListByEmpNo(empVO);
		model.addAttribute("appEndList", appEndList);
		
		return "approval/appendList";
	}
	
	//진행중인 결재 리스트
	@GetMapping("/appList")
	public String appList(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		
		//진행중인 기안 리스트
		List<AppIngVO> appList = appService.getAppListByEmpNo(empVO);
		model.addAttribute("appList", appList);
		
		return "approval/appList";
	}
	
	//임시저장 문서 리스트
	@GetMapping("/tempstList")
	public String tempstList(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		
		//임시저장 리스트
		List<AppIngVO> tempstList = appService.getTempstListByEmpNo(empVO);
		model.addAttribute("tempstList", tempstList);
		
		return "approval/tempstList";
	}
	
	
	//발주서
	@GetMapping("/order")
	public String order() {
		return "approval/order";
	}

	
	//휴가신청서 띄우기
	@GetMapping("/vacation")
	public String vacation() {
		return "approval/vacation";
	}
	
	//휴가신청서 인서트
	@PostMapping("/vacation/insert")
	public String vacationInsert(VacationFormVO vacation, Model model, @RequestPart(value="file",required = false)  MultipartFile file) throws Exception {
		
		if(file != null && file.getSize() > 0) {

                // 업로드한 파일 처리
            	String uuid = UUID.randomUUID().toString();	// UUID로 임의의 파일명 생성
        		String afSave = uuid+"_"+file.getOriginalFilename();
                String savePath = servletContext.getRealPath("/resources/upload");
//                String savePath = "C:/Users/kwonn/Documents/FinalProject/KUROOffice/src/main/webapp/resources/images";
        		String filePath = savePath + "/" + file.getOriginalFilename();
                byte[] bytes = file.getBytes();
                // 파일 처리 로직 추가
//                Resource res = resouceLoader.getResource("/resources/upload");
                AttFileVO att = new AttFileVO();
    			att.setAfCode("app");
    			att.setAfType("app");
    			att.setAfTcode("APP");
    			att.setAfName(file.getOriginalFilename());
    			att.setAfSave(file.getOriginalFilename());
    			att.setAfSize(file.getSize());
    			att.setAfExt("hwp");
    			empService.insertAf(att);
    			
    			file.transferTo(new File(filePath));

		}
		
		
		
		appService.vacationInsert(vacation);
		model.addAttribute("vacation", vacation);
		return "redirect:/approval/home";
	}
	
	
	//기안하기 비밀번호 체크
	@PostMapping(value="/vacation/pwcheck",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> pwCheck(@RequestBody Map<String, String> Mpassword, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		String pw = empVO.getEmpPw();
		
		if (pw.equals(Mpassword.get("Mpassword"))) {
			log.info("Mpassword:ok");
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		
		log.info("Mpassword: "+ Mpassword.get("Mpassword"));
		log.info("Mpassword:fail");
		return new ResponseEntity<String>("fail",HttpStatus.OK);
		
//		return "나영짱" + Mpassword.get("Mpassword");
	}
	
	
	
	// 발주서와 출장보고서 불러오기
	@GetMapping("/bisOrd")
	public String apFormDetail(String apfName, Model model) {
		log.info("체크: "+ apfName);
		
		ApFormVO form = appService.selectForm(apfName);
		log.info("체크2: "+ form);
		
		model.addAttribute("apform", form);
		return "approval/bisOrd";
	}
	
	@Autowired
	private IEmpService empService;
	
	@Autowired // 믿음 분명 있을 거얌!, 스프링 너만 믿엉!
	private ServletContext servletContext;	
	
//	@Resource(name="uploadPath")
//	private String uploadPath;
	
	
	
	
	//채용품의서 불어오기
	@GetMapping(value="/recruit")
	public String recruitForm(RecVO rec, Model model) {
		model.addAttribute("RecVO", rec);
		return "approval/recruit";
	}
	
	//채용품의서 인서트
	@PostMapping("/recruit/insert")
	public String recruitInsert(RecruitFormVO rec, Model model, @RequestPart(value="file",required = false) MultipartFile file) throws Exception {
		
		System.out.println("여기로 와?");
		
		System.out.println(file.getSize());
		if(file != null && file.getSize() > 0) {
			
//			Resource res = resouceLoader.getResource("/resources/upload");
//			AttFileVO att = new AttFileVO();
//			att.setAfCode("app");
//			att.setAfType("app");
//			att.setAfTcode("APP");
//			att.setAfName(file.getOriginalFilename());
//			att.setAfSave(file.getOriginalFilename());
//			att.setAfSize(file.getSize());
//			att.setAfExt("app");
//			empService.insertAf(att);
//			
//			file.transferTo(new File(res.getFile().getCanonicalPath()+"/"+att.getAfName()));
//			
//		}
		

                // 업로드한 파일 처리
            	String uuid = UUID.randomUUID().toString();	// UUID로 임의의 파일명 생성
        		String afSave = uuid+"_"+file.getOriginalFilename();
                String savePath = servletContext.getRealPath("/resources/upload");
//                String savePath = "C:/Users/kwonn/Documents/FinalProject/KUROOffice/src/main/webapp/resources/images";
        		String filePath = savePath + "/" + file.getOriginalFilename();
                byte[] bytes = file.getBytes();
                // 파일 처리 로직 추가
//                Resource res = resouceLoader.getResource("/resources/upload");
                AttFileVO att = new AttFileVO();
    			att.setAfCode("app");
    			att.setAfType("app");
    			att.setAfTcode("APP");
    			att.setAfName(file.getOriginalFilename());
    			att.setAfSave(file.getOriginalFilename());
    			att.setAfSize(file.getSize());
    			att.setAfExt("hwp");
    			empService.insertAf(att);
    			
    			file.transferTo(new File(filePath));

		}
				
		appService.recruitInsert(rec);
		model.addAttribute("rec", rec);
		return "redirect:/approval/home";
	}
	
	
	
	//재기안 올리기( 채용품의서 )
	//채용품의서 불어오기
		@GetMapping(value="/recruitModify")
		public String recruitModifyForm(Model model, String appCode, String apfCode, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
			String empNo = empVO.getEmpNo();
			
			log.info("appCode 뭐야? "+appCode);
			log.info("apfCode 뭐야? "+apfCode);
			log.info("empNo 뭐야? "+empNo);
			
			List<RecruitAppFormVO> recruitMo = appService.selectRecruitIngForm(appCode, apfCode, empNo);
			model.addAttribute("recruitMo", recruitMo);
			model.addAttribute("status", "u");
			return "approval/recruit";
		}
		
		//채용품의서 수정 인서트
		@PostMapping("/recruit/Modify")
		public String recruitModify(RecruitFormVO rec, Model model, String appCode, @RequestParam("file") MultipartFile file) throws Exception {
			
			System.out.println("여기로 와?");
			
			System.out.println(file.getSize());
			if(file != null && file.getSize() > 0) {
				

	                // 업로드한 파일 처리
	            	String uuid = UUID.randomUUID().toString();	// UUID로 임의의 파일명 생성
	        		String afSave = uuid+"_"+file.getOriginalFilename();
	                String savePath = servletContext.getRealPath("/resources/upload");
//	                String savePath = "C:/Users/kwonn/Documents/FinalProject/KUROOffice/src/main/webapp/resources/images";
	        		String filePath = savePath + "/" + file.getOriginalFilename();
	                byte[] bytes = file.getBytes();
	                // 파일 처리 로직 추가
//	                Resource res = resouceLoader.getResource("/resources/upload");
	                AttFileVO att = new AttFileVO();
	    			att.setAfCode("app");
	    			att.setAfType("app");
	    			att.setAfTcode("APP");
	    			att.setAfName(file.getOriginalFilename());
	    			att.setAfSave(file.getOriginalFilename());
	    			att.setAfSize(file.getSize());
	    			att.setAfExt("hwp");
	    			empService.insertAf(att);
	    			
	    			file.transferTo(new File(filePath));

			}
			
			rec.getRec().setAppCode(appCode);
			appService.recruitModify(appCode, rec);
			model.addAttribute("rec", rec);
			return "redirect:/approval/home";
		}
		
		//재기안하기
		//휴가신청서 불어오기
	@GetMapping(value="/vacationModify")
	public String vacationModifyForm(Model model, String appCode, String apfCode, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		String empNo = empVO.getEmpNo();
		
		log.info("appCode 뭐야? "+appCode);
		log.info("apfCode 뭐야? "+apfCode);
		log.info("empNo 뭐야? "+empNo);
		
		List<VacationAppFormVO> vacationMo = appService.selectVacationIngForm(appCode, apfCode, empNo);
		model.addAttribute("vacationMo", vacationMo);
		model.addAttribute("status", "u");
		return "approval/vacation";
	}

	
	//휴가신청서 수정 인서트
	@PostMapping("/vacation/Modify")
	public String vacationModify(VacationFormVO vacation, Model model, String appCode) throws Exception {
		log.info("넝어와아아아appCode: "+ appCode);
		log.info("넝어와아아아appCode: "+ vacation);
		
		vacation.getVacation().setAppCode(appCode);
		appService.vacationModify(appCode, vacation);
		model.addAttribute("vacation", vacation);
		return "redirect:/approval/home";
	}
	
	//임시저장(휴가신청서)
	@PostMapping("/vacation/tempst")
	public String vacationTempst(VacationFormVO vacation, Model model) throws Exception{
		appService.vacationTempst(vacation);
		model.addAttribute("vacation", vacation);
		return "redirect:/approval/home";
	}
	
	//임시저장(채용품의서)
		@PostMapping("/recruit/tempst")
		public String recruitTempst(RecruitFormVO recruit, Model model) throws Exception{
			appService.recruitTempst(recruit);
			model.addAttribute("recruit", recruit);
			return "redirect:/approval/home";
		}
	
	//결재할 문서  휴가신청서 detail
	@GetMapping("/vacDetail")
	public String vacAppDetail(Model model
								, String appCode
								, String apfCode
								, String empNo
								, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		String sEmpNo = empVO.getEmpNo();
		model.addAttribute("status","ok");
		log.info("여기까지 오긴하니?:"+ appCode);
		log.info("apfCode은 뭔데?:"+ apfCode);
		log.info("세션값 뭐여?: "+ sEmpNo);
		log.info("넘어온 empNo는 뭔디: "+ empNo);
		
		List<VacationAppFormVO> vacationAppForm = appService.selectVacationAppForm(appCode, apfCode, empNo);
		model.addAttribute("vacationAppForm", vacationAppForm);
		log.info("결과 보여줘봐: "+vacationAppForm);
		return "approval/vacationApp";
	}
	
	
	//결재할 문서  채용품의서 detail
		@GetMapping("/recruitDetail")
		public String recAppDetail(Model model
									, String appCode
									, String apfCode
									, String empNo
									, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
			String sEmpNo = empVO.getEmpNo();
			model.addAttribute("status","ok");
			log.info("여기까지 오긴하니?:"+ appCode);
			log.info("apfCode은 뭔데?:"+ apfCode);
			log.info("세션값 뭐여?: "+ sEmpNo);
			log.info("넘어온 empNo는 뭔디: "+ empNo);
			
			List<RecruitAppFormVO> recruitAppForm = appService.selectRecruitAppForm(appCode, apfCode, empNo);
//			AttFileVO attVO =  appService.selectAtt(appCode);
			model.addAttribute("recruitAppForm", recruitAppForm);
//			model.addAttribute("selectAtt", attVO);
			log.info("결과 보여줘봐: "+recruitAppForm);
			return "approval/recruitApp";
		}
	
		//결재진행 문서  휴가신청서 detail
		@GetMapping("/vacIngDetail")
		public String vacIngDetail(Model model
									, String appCode
									, String apfCode
									, String empNo
									, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
			String sEmpNo = empVO.getEmpNo();
			model.addAttribute("status","ok");
			log.info("결재진행 appCode?: "+ appCode);
			log.info("결재진행 apfCode은 뭔데?:"+ apfCode);
			log.info("세션값 뭐여?: "+ sEmpNo);
			log.info("결재진행 넘어온 empNo는 뭔디: "+ empNo);
			
			List<VacationAppFormVO> vacationIngForm = appService.selectVacationIngForm(appCode, apfCode, empNo);
			model.addAttribute("vacationIngForm", vacationIngForm);
			log.info("결과 보여줘봐: "+vacationIngForm);
			return "approval/vacationIng";
		}
	
		
		//결재진행 문서 채용품의서 detail
				@GetMapping("/recIngDetail")
				public String recIngDetail(Model model
											, String appCode
											, String apfCode
											, String empNo
											, HttpServletRequest request) throws Exception {
					HttpSession session = request.getSession();
					EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
					String sEmpNo = empVO.getEmpNo();
					model.addAttribute("status","ok");
					log.info("결재진행rec appCode?: "+ appCode);
					log.info("결재진행rec apfCode은 뭔데?:"+ apfCode);
					log.info("세션값 뭐여?: "+ sEmpNo);
					log.info("결재진행rec 넘어온 empNo는 뭔디: "+ empNo);
					
					List<RecruitAppFormVO> recruitIngForm = appService.selectRecruitIngForm(appCode, apfCode, empNo);
					model.addAttribute("recruitIngForm", recruitIngForm);
					log.info("결과 보여줘봐: "+recruitIngForm);
					return "approval/recruitIng";
				}
	
	//결재하기 버튼 눌렀을 때 결재선 업데이트
	@PostMapping("/aplineListUpdate")
	public String aplineListUpdate(Model model, HttpServletRequest request, String appCode) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		String empNo = empVO.getEmpNo();
		
		log.info("승인버튼 세션 empNo가 뭐야? " + empNo);
		log.info("승인버튼 넘어온 appCode 뭐야? " + appCode);
		
		appService.aplineUpdate(empNo, appCode);
		
		return "redirect:/approval/aplineList";
	}
	
	//순번 3번일때 --결재하기 버튼 눌렀을 때 결재선 업데이트 
		@PostMapping("/aplineListTopUpdate")
		public String aplineListTopUpdate(Model model, HttpServletRequest request, String appCode) throws Exception {
			HttpSession session = request.getSession();
			EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
			String empNo = empVO.getEmpNo();
			
			log.info("top3 세션 empNo가 뭐야? " + empNo);
			log.info("top3 넘어온 appCode 뭐야? " + appCode);
			
			appService.aplineTopUpdate(empNo, appCode);
			
			return "redirect:/approval/aplineList";
		}
	
	
	//반려하기
	@PostMapping("/companion")
	public String companion(Model model, HttpServletRequest request, String appCode, String aplComment) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVO empVO = (EmployeeVO)session.getAttribute("SessionInfo");
		String empNo = empVO.getEmpNo();
		
		log.info("반려버튼 세션 empNo가 뭐야? " + empNo);
		log.info("반려버튼 넘어온 appCode 뭐야? " + appCode);
		log.info("반려버튼 넘어온 aplComment 뭐야? " + aplComment);
		
		appService.companion(empNo, appCode, aplComment);
		
		return "redirect:/approval/aplineList";
	}
	
	//기안서 삭제
	@PostMapping("/approvalDelete")
	public String approvalDelete(Model model, String appCode) throws Exception {
		log.info("삭제 넘어왔니?? " + appCode);
		
		appService.approvalDelete(appCode);
		
		return "redirect:/approval/appList";
		
		
	}
	
}