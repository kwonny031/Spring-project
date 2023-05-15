package kr.or.ddit.employee.service;

import java.util.List;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;

public interface IEmpService {
	
	public List<EmployeeVO> list();
	
	public EmployeeVO selectMember(String id);
	
	public String idFind(EmployeeVO empVO);
	
	public String pwFind(EmployeeVO empVO);
	
	public int insertAf(AttFileVO afVO);

	public AttFileVO getAf(AttFileVO afVO);
	
	public void register (EmployeeVO empVO);

	public List<EmployeeVO> listAdmin();

	public EmployeeVO getEmpNo(String empNo);

	public void update(EmployeeVO empVO);

	public int getAllPostCount(String empNo);

	public int getAllGoodCount(String empNo);
}
