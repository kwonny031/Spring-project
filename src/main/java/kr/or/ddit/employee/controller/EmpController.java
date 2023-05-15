package kr.or.ddit.employee.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.common.Utils;
import kr.or.ddit.employee.service.IEmpService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.work.service.IWorkService;
import kr.or.ddit.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.af;

@Slf4j
@Controller
@RequestMapping("/emp")
public class EmpController {
	
	@Resource(name="uploadPath")
	private String uploadPath;	
	
	@Autowired // 믿음 분명 있을 거얌!, 스프링 너만 믿엉!
	private ServletContext servletContext;	
	
	@Inject
	private IEmpService empService;
	

	@Inject
	private IWorkService workService;
	
	@GetMapping("/home")
	public String tree() {
		log.debug("jsTree");
		
		return "employee/jsTree";
	}
	
	@ResponseBody
	@GetMapping("/empList")
	public JSONArray empList() {
		List<EmployeeVO> list = empService.list();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		// 필요한 정보
		// 부서코드, 사원이름, 부서이름(조인필요)
		// 직급코드(직책), 사원코드, 메일, 전화번호, 상태메세지, 회사코드(회사이름)
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i < list.size(); i++) {
			map.put("id", list.get(i).getEmpNo());
			map.put("parent", list.get(i).getHempNo());
			map.put("text", list.get(i).getEmpName());
			map.put("depCode", list.get(i).getDepCode());
			map.put("depName", list.get(i).getDepName());
			map.put("empPos", list.get(i).getEmpPos());
			map.put("empEmail", list.get(i).getEmpEmail());
			map.put("empTel", list.get(i).getEmpTel());
//			map.put("empMsg", list.get(i).getEmpMsg());
			map.put("coCode", list.get(i).getCoCode());
			jsonObj = new JSONObject(map);
			jsonArr.add(jsonObj);
		}
//		System.out.println("[emp] jsonArr : " + jsonArr);
//		System.out.println("리스트 list >>>>>>>>> " + list);
		return jsonArr;
	}
	
//	@RequestMapping(value="/selectMember", method = RequestMethod.POST)
	@RequestMapping(value="/selectMember", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public EmployeeVO selectMember(@RequestBody String id) {
		EmployeeVO employeeVO = empService.selectMember(id);
		log.info("emp >> " + employeeVO);
		return employeeVO;
	}
	
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(HttpServletRequest req, Model model) {
			
		HttpSession session = req.getSession();

		if (session.getAttribute("SessionInfo") == null) {  
			// SessionInfo가 없으면 로그인 페이지로 이동
			return "conn/login";
		}		
		
		
		
		// 전체 부서원 정보
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
//		empVO.setDepCode("DEP22");
		List<WorkVO> workList = workService.getWorkList(empVO);
		
		model.addAttribute("workList", workList);
		
		
		// Object를 Gson으로 변환하고 JSONArray에 담아서 보냄. X - 간단하게 가능.
		JSONArray jsonWorkList = new JSONArray();
		Gson gson = new Gson();
		
		for (WorkVO vo : workList) {
			jsonWorkList.add(gson.toJson(vo));
		}
		List<EmployeeVO> depEmpList = workService.getEmpListByDep(empVO.getDepCode());
		
		// 부서원 직급 순으로 정렬
		Collections.sort(depEmpList, new EmpPosComparator());
		model.addAttribute("depEmpList", depEmpList);
		
		// 부서원 이미지
		List<AttFileVO> empImgList = workService.getAfByEmpList(depEmpList);
//		String empImgListJson = gson.toJson(empImgList);
		
		model.addAttribute("empImgList", empImgList);
		
		// 총 게시글, 좋아요 수
		int postNum = empService.getAllPostCount(empVO.getEmpNo());
		int goodNum = empService.getAllGoodCount(empVO.getEmpNo());
//		
		model.addAttribute("postNum", postNum );
		model.addAttribute("goodNum", goodNum);
		
		return "employee/mypage";
	}
	
	@PostMapping("/insertAf")
	public ResponseEntity<String> insertAf(MultipartFile image, HttpServletRequest req) throws Exception, IOException {
		
		// 실제 경로 확인: D:\A_TeachingMaterial\09_FinalPoject\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\KUROOffice\resources\images
		// 이 경로 + uuid로 업데이트(afSave) 하고 기존 파일명은 afName에 저장. 이미지 불러오는
		// 방식(src) 변경
		log.debug("실제 경로 확인: "+servletContext.getRealPath("/resources/images"));
		
		String uuid = UUID.randomUUID().toString();	// UUID로 임의의 파일명 생성
		String afSave = uuid+"_"+image.getOriginalFilename();		
		
		String savePath = servletContext.getRealPath("/resources/images");
		String filePath = uploadPath + "/" + afSave;
		String filePath2 = savePath + "/" + afSave;
		
		// 실제 저장경로 말고 
		// D:\A_TeachingMaterial\09_FinalPoject\KUROOffice\src\main\webapp\resources\images
		// 여기에 파일을 올려야하나
		image.transferTo(new File(filePath)); // 요 한 줄로 끄읕!
		image.transferTo(new File(filePath2));
		
		log.debug("너머온 파일명:" + image.getOriginalFilename());
		log.debug("너머온 파일사이즈:" + image.getSize());
		String afName = image.getOriginalFilename();
		
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo");
		
//		log.info("name ??? >> " + image.getOriginalFilename());
//		log.info("f name >> " + Arrays.toString(image.getOriginalFilename().split("\\.")));
//		log.info("f name >> " + afName.split("\\.")[1].toUpperCase());
		AttFileVO afVO = new AttFileVO();
		afVO.setAfType("PROFILE");
		afVO.setAfTcode(empVO.getEmpNo());
		afVO.setAfName(afName);
		afVO.setAfSize(image.getSize());
		afVO.setAfSave(afSave);
		
		// .split(String regex) split의 매개변수는 정규식이라서 특수문자를 나타내기 위해 \\를 붙임.
		afVO.setAfExt(afName.split("\\.")[1].toUpperCase());
		
//		log.info("afvo >> " + afVO);
		int count = empService.insertAf(afVO);
		
		if (count == 1) {
			AttFileVO profile = empService.getAf(afVO);
			session.setAttribute("profile", profile);			
			
			return new ResponseEntity<String>("1", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("0", HttpStatus.OK);
		}
	}
	
	@PostMapping("/update")
	public String update(EmployeeVO empVO) {
		log.info("upd chk >> "+empVO);
		
		empService.update(empVO);
		
		return "redirect:/emp/mypage";
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
	
	
}







