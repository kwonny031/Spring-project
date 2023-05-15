package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.work.vo.WorkVO;

public interface EmployeeMapper {

	public EmployeeVO getEmp(EmployeeVO empVO);

	public EmployeeVO loginCheck(EmployeeVO empVO);

	public List<EmployeeVO> list();

	public EmployeeVO selectMember(String id);

	public List<EmployeeVO> getEmpList();

	public String idFind(EmployeeVO empVO);

	public List<EmployeeVO> getEmpListByDep(String depCode);

	public EmployeeVO getEmpByEmpName(String string);

	public String pwFind(EmployeeVO empVO);
	
	public void register(EmployeeVO empVO);

	public List<EmployeeVO> listAdmin();

	public void update(EmployeeVO empVO);

	public EmployeeVO getEmpNo(String empNo);

	public int getAllPostCount(String empNo);

	public int getAllGoodCount(String empNo);

}
