package kr.or.ddit.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.mapper.AccMapper;
import kr.or.ddit.mapper.SchEmpMapper;
import kr.or.ddit.mapper.ScheduleMapper;
import kr.or.ddit.mapper.TimelineMapper;
import kr.or.ddit.schedule.vo.CarVO;
import kr.or.ddit.schedule.vo.MroomVO;
import kr.or.ddit.schedule.vo.SchEmpVO;
import kr.or.ddit.schedule.vo.ScheduleVO;
import kr.or.ddit.timeline.vo.TimelineVO;


@Service
public class ScheduleImpl implements IScheduleService {

	@Inject
	private ScheduleMapper schMapper;
	
	@Inject
	private SchEmpMapper schEmpMapper;
	
	@Inject
	private TimelineMapper timeMapper;
	
	@Override
	public List<ScheduleVO> list(EmployeeVO empVO) {
		return schMapper.list(empVO);
	}

	@Override
	@Transactional   // 2개의 insert가 세트로 모두 성공해야 함!! 1개라도 실패하면 롤백 (default:propergation _ 커넥션객체를 다르게해서 커넥션단위를 다르게 설정)
	public int register(ScheduleVO schVO) throws Exception {
		if(schVO.getSchStart().length() == 10) {
			schVO.setSchStart(schVO.getSchStart().split("T")[0]);
		}
		if(schVO.getSchEnd().length() == 10) {
			schVO.setSchEnd(schVO.getSchEnd().split("T")[0]);
		}
		
//		if(schVO.get)
		System.out.println("[일정 타입]" + schVO.getSchType());
		if(schVO.getSchType().equals("개인일정")) {
			schVO.setSchColor("blue");
		}else if(schVO.getSchType().equals("부서일정")) {
			schVO.setSchColor("green");
		}else if(schVO.getSchType().equals("회사일정")){
			schVO.setSchColor("red");
		}else if(schVO.getSchType().equals("[회의]")) {
			schVO.setSchColor("orange");
		}
		
		// 일정 등록
		int result =  schMapper.register(schVO);
		
		System.out.println("[empNo 확인1] : " + schVO.getSchEmpNo() + "[]");
		
		// 일정 참여자 등록
		if(schVO.getSchEmpNo() != null && schVO.getSchEmpNo() != "") {
			String[] empNo = schVO.getSchEmpNo().split("/");
			System.out.println("[empNo 확인2] : " + empNo);
			
			for (int i = 0; i < empNo.length; i++) {
				SchEmpVO schempVO = new SchEmpVO();
				schempVO.setSchCode(schVO.getSchCode());
				schempVO.setEmpNo(empNo[i]);
				schEmpMapper.register(schempVO);
			}
		}
		
		if (schVO.getSchType().equals("차량 예약")) {
			// 차량 예약 등록
			CarVO carVO = new CarVO();
			carVO.setSchCode(schVO.getSchCode());
			carVO.setCarCode(schVO.getSchLocation());
			result = schMapper.registerCarRes(carVO);
			
			// 차량 사용여부 수정
			result = schMapper.updateCar(carVO);
			
		}
		if(schVO.getSchType().equals("회의실 예약") && schVO.getSchLocation() != null && schVO.getSchLocation() != ""){
			// 회의실 예약 등록
			MroomVO mroomVO = new MroomVO();
			mroomVO.setSchCode(schVO.getSchCode());
			mroomVO.setMrCode(schVO.getSchLocation());
			result = schMapper.registerMrRes(mroomVO);
			
			//회의실 사용여부 수정
			result = schMapper.updateMroom(mroomVO);
		}
		
		// 타임라인 등록
		TimelineVO timVO = new TimelineVO();
//		FreeVO freeVO = new FreeVO();
		
		timVO.setTimType(schVO.getSchCode()); //null
		timVO.setEmpNo(schVO.getEmpNo());
		timVO.setTimContent("일정이 등록되었습니다.");
		timeMapper.insertTime(timVO);
		
		return result;
	}

	@Override
	@Transactional   // 2개의 insert가 세트로 모두 성공해야 함!~~ 1개라도 실패하면 롤백
	public int remove(ScheduleVO scheduleVO) throws Exception {
		int result;
//		ScheduleVO schVO = new ScheduleVO();
		System.out.println(" 차량코드 : "+ scheduleVO.getCarCode());
		// 일정이 삭제되면 schCode가 삭제되니까 schCode로 사용여부를 수정하려면 사용여부 먼저 업데이트되야해!!
		
		if(scheduleVO.getCarCode() != null) {
			// 차량 사용여부 변경 (일정 삭제시 사용여부 : N -> Y)
			result = schMapper.updateCarUse(scheduleVO.getCarCode());
		}
		
		//일정 삭제
		result = schMapper.remove(scheduleVO.getSchCode());
		
		return result;
	}

	@Override
	@Transactional
	public int update(ScheduleVO schVO) throws Exception {
		int result;
		
		if(schVO.getSchStart().length() == 10) {
			schVO.setSchStart(schVO.getSchStart().split("T")[0]);
		}
		if(schVO.getSchEnd().length() == 10) {
			schVO.setSchEnd(schVO.getSchEnd().split("T")[0]);
		}
		
		if(schVO.getSchType().equals("개인일정")) {
			schVO.setSchColor("blue");
		}else if(schVO.getSchType().equals("부서일정")) {
			schVO.setSchColor("green");
		}else if(schVO.getSchType().equals("회사일정")){
			schVO.setSchColor("red");
		}else if(schVO.getSchType().equals("[회의]")) {
			schVO.setSchColor("orange");
		}
		
		// 일정 수정
		result = schMapper.update(schVO);
		System.out.println("[ update result ] : " + result);
		
		// 타임라인 등록
		TimelineVO timVO = new TimelineVO();
		FreeVO freeVO = new FreeVO();
		
		timVO.setTimType(freeVO.getFreeCode()); //null
		timVO.setEmpNo(freeVO.getEmpNo());
		timVO.setTimContent("일정이 수정되었습니다.");
		timeMapper.insertTime(timVO);
		
		return result;
	}

	@Override
	public List<MroomVO> roomList() {
		
		return schMapper.roomList();
	}

	@Override
	public List<MroomVO> resRoomList() {
		return schMapper.resRoomList();
	}

	@Override
	public List<ScheduleVO> selectEmpSch(String empNo) {
		return schMapper.selectEmpSch(empNo);
	}

	@Override
	public List<CarVO> carList() {
		return schMapper.carList();
	}

	@Override
	public String selectCar(String carCode) {
		return schMapper.selectCar(carCode);
	}

	@Override
	public ScheduleVO selectCarDetail(String carCode) {
		return schMapper.selectCarDetail(carCode);
	}

	@Override
	public List<SchEmpVO> schEmpList(String schCode) {
		return schMapper.schEmpList(schCode);
	}



}
