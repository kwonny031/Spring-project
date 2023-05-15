package kr.or.ddit.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.schedule.vo.CarVO;
import kr.or.ddit.schedule.vo.MroomVO;
import kr.or.ddit.schedule.vo.SchEmpVO;
import kr.or.ddit.schedule.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/sch")
public class SchController {

	@Inject
	private IScheduleService scheduleService;
	
	@GetMapping("/home")
	public String schedule(Model model) {
		
		// 회의실 리스트
		List<MroomVO> roomList = scheduleService.roomList();
		model.addAttribute("roomList", roomList);
		log.debug("[roomList] : " + roomList);
		
		return "schedule/home";
	}
	
	@ResponseBody
	@RequestMapping(value = "/home", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public JSONArray schList(@RequestBody EmployeeVO empVO, Model model) {
		
		// 자기 개인일정과 소속 부서 일정 조회를 위해 사원번호와 부서코드로 조회
		System.out.println("[(컨트롤러) empNo] : " + empVO.getEmpNo());
		System.out.println("[(컨트롤러) depCode] : " + empVO.getDepCode());
		
		ScheduleVO schVO = new ScheduleVO();
		List<ScheduleVO> list = scheduleService.list(empVO);
//		List<ScheduleVO> list = service.list(empVO.getEmpNo(),empVO.getDepCode());
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i < list.size(); i++) {
			
			map.put("schCode", list.get(i).getSchCode());
			
			List<SchEmpVO> schempList = scheduleService.schEmpList(list.get(i).getSchCode());
			if(schempList.size() != 0) {
				// 일정 코드에 해당하는 일정참여자 조회
				System.out.println("[일정참여사원 목록] : "+schempList);
				map.put("schEmpName", schempList);
			}
			
			map.put("empNo", list.get(i).getEmpNo());
			map.put("title", list.get(i).getSchTitle());
			map.put("content", list.get(i).getSchContent());
			map.put("start", list.get(i).getSchStart());
			map.put("end", list.get(i).getSchEnd());
			map.put("schLocation", list.get(i).getSchLocation());
			map.put("schType", list.get(i).getSchType());
			map.put("schRead", list.get(i).getSchRead());
			map.put("color", list.get(i).getSchColor());
			map.put("description", list.get(i).getSchContent());	// tooltip을 사용하기위해 description을 사용
			if((list.get(i).getSchColor()).equals("yellow")) {
				map.put("textColor", "black");
			}else {
				map.put("textColor", "white");
			}
			jsonObj = new JSONObject(map);
			jsonArr.add(jsonObj);
		}
		log.debug("[일정]jsonArr : {}"+jsonArr); 
		return jsonArr;
	}
	
	@ResponseBody
	@PostMapping(value="/register",produces = "application/json;charset=utf-8")
	public String register(@RequestBody ScheduleVO schVO) throws Exception {
		scheduleService.register(schVO);
		
		if(schVO.getSchCode() != null ) {
			return "redirect:/sch/home";
		}
		
		return "Success";
	}
	
	@ResponseBody
	@PostMapping("/update")
	public String update(ScheduleVO schVO) throws Exception {
		scheduleService.update(schVO);
		return "Success";
	}
	
	@ResponseBody
	@PostMapping("/remove")
	public String remove(ScheduleVO scheduleVO) throws Exception{
		scheduleService.remove(scheduleVO);
		return "Success";
	}
	
	
	@GetMapping("/resRoom")
	public String resRoomList(Model model) {
		
		// 회의실 예약 리스트(mrres)
		List<MroomVO> mrres = scheduleService.resRoomList();
		
		JSONArray jsonMrres = new JSONArray();
		Gson gson = new Gson();
		
		for (MroomVO vo : mrres) {
			jsonMrres.add(gson.toJson(vo));
		}
		
		log.info("chk >>");
		model.addAttribute("jsonMrres", jsonMrres);
		return "schedule/resRoom";
	}
	
	@GetMapping("/resCar")
	public String resCarHome(Model model) {
		// 차량목록 초회
		List<CarVO> carList = scheduleService.carList();
		model.addAttribute("carList", carList);
		
		return "schedule/resCar";
	}
	@GetMapping("/room")
	public String roomHome() {
		return "schedule/room";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectEmpSch", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String selectEmpSch(@RequestBody String empNo, Model model) {
		
		//체크박스에 체크한 사원들의 일정 목록
		List<ScheduleVO> schVO = scheduleService.selectEmpSch(empNo);
		
		Gson gson = new Gson();
		String empSch = gson.toJson(schVO);
		
		return empSch;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectCar", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String selectCar(@RequestParam("carCode") String carCode) {
		String afSave = scheduleService.selectCar(carCode);
		return afSave;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectCarDetail", method = RequestMethod.POST)
	public ScheduleVO selectCarDetail(@RequestParam("carCode") String carCode) {
		ScheduleVO schVO =  scheduleService.selectCarDetail(carCode);
		return schVO;
	}
}
