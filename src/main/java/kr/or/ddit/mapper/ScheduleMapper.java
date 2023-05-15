package kr.or.ddit.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.schedule.vo.CarVO;
import kr.or.ddit.schedule.vo.MroomVO;
import kr.or.ddit.schedule.vo.SchEmpVO;
import kr.or.ddit.schedule.vo.ScheduleVO;

public interface ScheduleMapper {

	public List<ScheduleVO> list(EmployeeVO empVO);	// 등록된 일정 리스트
	
	public int register(ScheduleVO calendar) throws Exception;	// 일정 등록
	
	public int remove(String schCode)throws Exception;			// 일정 삭제
	
	public int update(ScheduleVO calendar) throws Exception;	// 일정 수정

	public List<MroomVO> roomList();							// 회의실 목록

	public List<ScheduleVO> selectEmpSch(String empNo);			// 체크박스에 체크한 사원의 일정 리스트

	// 회의실 예약
	public int registerMrRes(MroomVO mroomVO);					// 회의실 예약 등록

	public int updateMroom(MroomVO mroomVO);					// 회의실 사용여부 수정

	public List<MroomVO> resRoomList();							// 회의실 예약 리스트

	// 차량 예약
	public List<CarVO> carList();								// 차량 목록

	public String selectCar(String carCode);					// 차량 사진이름 조회

	public int registerCarRes(CarVO carVO);						// 차량 예약 등록

	public int updateCar(CarVO carVO);							// 차량 예약시 사용여부 사용중(N)으로 변경 

	public ScheduleVO selectCarDetail(String carCode);			// 차량 예약정보 조회

	public int updateCarUse(String schCode);					// 차량예약 취소 시 차량 사용여부 예약가능(Y)으로 변경

	public List<SchEmpVO> schEmpList(String schCode);			// 일정에 해당하는 일정 참여자 조회


}
