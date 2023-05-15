package kr.or.ddit.schedule.service;

import java.util.List;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.schedule.vo.CarVO;
import kr.or.ddit.schedule.vo.MroomVO;
import kr.or.ddit.schedule.vo.SchEmpVO;
import kr.or.ddit.schedule.vo.ScheduleVO;


public interface IScheduleService {
	
	public List<ScheduleVO> list(EmployeeVO empVO);

	public int register(ScheduleVO schVO)throws Exception;

	public int remove(ScheduleVO scheduleVO) throws Exception;

	public int update(ScheduleVO schVO) throws Exception;

	public List<MroomVO> roomList();

	public List<MroomVO> resRoomList();

	public List<ScheduleVO> selectEmpSch(String empNo);

	public List<CarVO> carList();

	public String selectCar(String carCode);

	public ScheduleVO selectCarDetail(String carCode);

	public List<SchEmpVO> schEmpList(String schCode);

}
