package kr.or.ddit.work.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.board.vo.PostVO;
import kr.or.ddit.common.Utils;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.work.service.IWorkService;
import kr.or.ddit.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/work")
public class WorkController {

	@Inject
	private IWorkService workService;
	
	@GetMapping("/home")
	public String home(Model model, HttpServletRequest req) throws JsonProcessingException {
		
		// 마지막 날짜 구하기
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		
		LocalDate lastDayDate = LocalDate.of(year, month, 1).
				plusDays(LocalDate.of(year, month, 1).lengthOfMonth()-1);
		
		String lastDayFull = lastDayDate.toString();
		int lastDay = Integer.parseInt(lastDayFull.substring(lastDayFull.length()-2,lastDayFull.length()));
		
		int totalWeek = (int) Math.ceil(lastDay / 7.0);
		int restDayNum = lastDay % 7;
		
		model.addAttribute("totalWeek", totalWeek);
		model.addAttribute("restDayNum", restDayNum);
		
		// 사원의 근무 리스트
		HttpSession session = req.getSession();
		
		if (session.getAttribute("SessionInfo") == null) {  
			// SessionInfo가 없으면 로그인 페이지로 이동
			return "conn/login";
		}
		
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
		List<WorkVO> workList = workService.getWorkList(empVO);
		
		model.addAttribute("workList", workList);
//		log.info("workList >> " + workList);
		
		// Object를 Gson으로 변환하고 JSONArray에 담아서 보냄. X - 간단하게 가능.
		JSONArray jsonWorkList = new JSONArray();
		Gson gson = new Gson();
		
		for (WorkVO vo : workList) {
			jsonWorkList.add(gson.toJson(vo));
		}
		
		model.addAttribute("jsonWorkList", jsonWorkList);
		
		// 전체 부서원 정보
		List<EmployeeVO> depEmpList = workService.getEmpListByDep(empVO.getDepCode());
		
		// 부서원 직급 순으로 정렬
		Collections.sort(depEmpList, new EmpPosComparator());
		model.addAttribute("depEmpList", depEmpList);
		
		// 부서원 출근 상태
		List<WorkVO> depWorkList = workService.getDepWorkList(empVO.getDepCode());
		List<String> statusList = new ArrayList<String>();
		
		boolean addFlag = true;
		
//		for (EmployeeVO vo : empList) { // foreach는 순서없이 부르나
		for (int i=0; i<depEmpList.size(); i++) { 
//			log.info("empList >> " + empList.get(i));
			EmployeeVO vo = depEmpList.get(i); 
			for (int j = 0; j < depWorkList.size(); j++) {
				if (vo.getEmpNo().equals(depWorkList.get(j).getEmpNo())) {
//					log.info("true emp >> " + vo.getEmpName()+" "+ vo.getEmpNo()+" "+depWorkList.get(j).getEmpNo());
					if(depWorkList.get(j).getWorkType().equals("업무종료")) {
						statusList.add("END");
						addFlag = false;
						break;
					}else if(depWorkList.get(j).getWorkType().equals("업무")) {
						statusList.add("START");
						addFlag = false;
						break;
					}
				}
			}
			
			if (addFlag) {
				statusList.add("NONE");
			}
			
			addFlag = true;
		}
		
		log.info("st list >> " + statusList);
		model.addAttribute("statusList", statusList);
		
		// 부서원 이미지
		List<AttFileVO> empImgList = workService.getAfByEmpList(depEmpList);
		String empImgListJson = gson.toJson(empImgList);
		
		model.addAttribute("empImgListJson", empImgListJson);
		
		// 근태 관리 권한
		boolean manageFlag = false;
		
		if (Utils.calPos(empVO.getEmpPos()) > 2) {
			manageFlag = true;
		}
		
		model.addAttribute("manageFlag", manageFlag);
		
		return "work/home";
	}
	
	// produce - 헤더의 Accept를 설정
	@ResponseBody
	@RequestMapping(value="/insert", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> insertWork(@RequestBody WorkVO workVO) {
		
//		log.info("data >> " + workVO);
		workVO.setWorkDate(workVO.getWorkDate().replaceAll("-", ""));
		int count = workService.insertWork(workVO);
		
		if (count == 1) {
			return new ResponseEntity<String>("저장되었습니다.", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	// ajax 근무 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/workList", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public JSONArray workList(@RequestBody EmployeeVO empVO, Model model, HttpServletRequest req) {
		
//		HttpSession session = req.getSession();
//		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");		
//		EmployeeVO empVO = new EmployeeVO();
//		empVO.setEmpNo(empNo);
		log.info("no >> " + empVO.getEmpNo());
		
		// 페이지 리턴이 아니면 model.addAttribute이 안되나?
		List<WorkVO> workList = workService.getWorkList(empVO);
//		model.addAttribute("workList", workList);
//		log.info("wl >> " + workList);
		
		// Object를 Gson으로 변환하고 JSONArray에 담아서 보냄.
		JSONArray jsonWorkList = new JSONArray();
		Gson gson = new Gson();
		
		for (WorkVO vo : workList) {
			jsonWorkList.add(gson.toJson(vo));
		}
		
//		model.addAttribute("jsonWorkList", jsonWorkList);
		
		//
		return jsonWorkList;
	}
	
	
	
	
	
	
}

class EmpPosComparator implements Comparator<EmployeeVO>{

	@Override
	public int compare(EmployeeVO vo1, EmployeeVO vo2) {
		// TODO Auto-generated method stub
		if(Utils.calPos(vo2.getEmpPos()) == Utils.calPos(vo1.getEmpPos())) {
			return vo1.getEmpName().compareTo(vo2.getEmpName());
		}else {
			return Utils.calPos(vo2.getEmpPos()) - Utils.calPos(vo1.getEmpPos());
		}
	}
	
}


