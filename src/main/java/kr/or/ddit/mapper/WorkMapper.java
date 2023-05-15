package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.work.vo.WorkVO;

public interface WorkMapper {

	public int insertWork(WorkVO workVO);

	public List<WorkVO> getWorkList(EmployeeVO empVO);

	public List<WorkVO> getDepWorkList(String depCode);

}
