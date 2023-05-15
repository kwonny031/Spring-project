package kr.or.ddit.work.service;

import java.util.List;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.work.vo.WorkVO;

public interface IWorkService {

 	public int insertWork(WorkVO workVO);

	public List<WorkVO> getWorkList(EmployeeVO empVO);

	public List<EmployeeVO> getEmpListByDep(String depCode);

	public List<WorkVO> getDepWorkList(String depCode);

	public List<AttFileVO> getAfByEmpList(List<EmployeeVO> empList);

}
