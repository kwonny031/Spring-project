package kr.or.ddit.main.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import kr.or.ddit.approval.vo.AplineVO;
import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.cloud.vo.CloudVO;
import kr.or.ddit.common.Utils;
import kr.or.ddit.dep.vo.DepVO;
import kr.or.ddit.employee.service.IEmpService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.main.service.IMainService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.timeline.vo.TimelineVO;
import kr.or.ddit.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainController {

	@Inject
	private IMainService mainService;
	
	@GetMapping("/home")
	public String home(HttpServletRequest req, Model model) throws Exception {
		
		HttpSession session = req.getSession();

		EmployeeVO empVO = (EmployeeVO) session.getAttribute("empVO");
		
		if (empVO == null) {  
			// SessionInfo가 없으면 로그인 페이지로 이동
			return "conn/login";
		}
		
		// erd 수정 - 먼저 이전 데이터 먼저 바뀐 컬럼에 맞게 넣기
		AttFileVO afVO = new AttFileVO();
		afVO.setAfType("PROFILE");
		afVO.setAfTcode(empVO.getEmpNo());			
		
		AttFileVO profile = mainService.getAf(afVO);
		session.setAttribute("profile", profile);			
		
		// 부서명
		DepVO depVO = mainService.getDep(empVO.getDepCode());
		session.setAttribute("depVO", depVO);
		
		session.setAttribute("SessionInfo", empVO);	
		
		// 조직도 데이터 (일단은 로그인 해야 보이는 걸로)
		List<DepVO> depList = mainService.getDepList();
		List<EmployeeVO> empList = mainService.getEmpList();
		
		List<String> treeJson = new ArrayList<String>();
		
		for (DepVO dVO : depList) {
			Map<String, String> tempMap = new HashMap<String, String>();
			
			tempMap.put("id", dVO.getDepCode());
			
			// 상위부서가 없는 경우(DEP1) #으로 입력
			if (dVO.getDepParcode() == null) {
				
				tempMap.put("parent", "#");
			}else {
				tempMap.put("parent", dVO.getDepParcode());
			}
			tempMap.put("text", dVO.getDepName());
			
			
//			log.info("json map >> " + new JSONObject(tempMap));
			// map을 json으로 변환
			treeJson.add(new JSONObject(tempMap).toString());
		}
		
		// emp id를 만들기 위한 map
		Map<String, Integer> idMap = new HashMap<String, Integer>();
		
		for (EmployeeVO eVO : empList) {
			Map<String, String> tempMap = new HashMap<String, String>();
			
			
			if (idMap.get(eVO.getDepCode()) == null) {
				idMap.put(eVO.getDepCode(), 1);
			}else {
				idMap.put(eVO.getDepCode(), ((int) idMap.get(eVO.getDepCode()))+1);
			}
			
			tempMap.put("id", eVO.getDepCode() + idMap.get(eVO.getDepCode()));
			tempMap.put("parent", eVO.getDepCode());
			tempMap.put("text", eVO.getEmpName()+" "+eVO.getEmpPos());
			tempMap.put("empNo", eVO.getEmpNo());
			treeJson.add(new JSONObject(tempMap).toString());
		}
		
		log.info("treejson >> " + treeJson);
		session.setAttribute("treeJson", treeJson);
		session.setAttribute("empList", empList);
		
		// 타임라인 정보
		List<TimelineVO> timlist = mainService.timlist(empVO.getEmpNo()); // empNo
		session.setAttribute("timlist",timlist); // session으로 수정
		
		// 근태 정보
		List<WorkVO> workList = mainService.getWorkList(empVO);			
		
		JSONArray jsonWorkList = new JSONArray();
		Gson gson = new Gson();
		
		for (WorkVO vo : workList) {
			jsonWorkList.add(gson.toJson(vo));
		}
		
		log.info("j list >> " + jsonWorkList);
		session.setAttribute("jsonWorkList", jsonWorkList);
		
		// 부서원 이미지
		List<AttFileVO> empImgList = mainService.getAfByEmpList(empList);
		String empImgListJson = gson.toJson(empImgList);
		
		session.setAttribute("empImgListJson", empImgListJson);			
		
		// 전체 부서원 정보
		List<EmployeeVO> depEmpList = mainService.getEmpListByDep(empVO.getDepCode());
		
		// 부서원 직급 순으로 정렬
		Collections.sort(depEmpList, new EmpPosComparator());
		session.setAttribute("depEmpList", depEmpList);
		
		// 부서원 출근 상태
		List<WorkVO> depWorkList = mainService.getDepWorkList(empVO.getDepCode());
		List<String> statusList = new ArrayList<String>();
		
		//결재할 문서 리스트
		List<AplineVO> appLineList = mainService.getAppLineListByEmpNo(empVO);
		model.addAttribute("appLineList", appLineList);
		
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
		session.setAttribute("statusList", statusList);
		
		//모델로 넣어보기!!!!!!!!!!모델로보내기
//		List<GoodVO> goodList = mainService.goodList(empVO.getEmpNo()); //empNo
//		session.setAttribute("goodlist", goodList); 
		
		// 메인 공지사항 notList
		List<NoticeVO> notList = mainService.getRecNotList();
		session.setAttribute("notList", notList); 
		
		// notEmpList notGoodList 공지사항 사원, 좋아요
		List<EmployeeVO> notEmpList = mainService.getEmpByNoticeList(notList);
		session.setAttribute("notEmpList", notEmpList);
				
		List<Integer> notGoodList = mainService.getGoodByNoticeList(notList);
		session.setAttribute("notGoodList", notGoodList);			
		
		// 클라우드
		// 개인 자료실 리스트
		List<CloudVO> empCloud = mainService.empCloud(empVO.getEmpNo());
		
		// 부서 자료실 리스트
		List<CloudVO> depCloud = mainService.depCloud(empVO.getDepCode());
		
		model.addAttribute("empCloud", empCloud);
		model.addAttribute("depCloud", depCloud);
		log.debug("[empCloud] : "+ empCloud);
		log.debug("[depCloud] : "+ depCloud);
		log.debug("empNo : "+ empVO.getEmpNo());
		
		// 헤더 좋아요 리스트 + 좋아요 alert
		List<GoodVO> goodMesList = mainService.getGoodList(empVO.getEmpNo());
		session.setAttribute("goodMesList", goodMesList);
		
		
		return "main/home";		
	}
	
	@GetMapping("/organization")
	public String organization() {
		
		return "main/organization";
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

