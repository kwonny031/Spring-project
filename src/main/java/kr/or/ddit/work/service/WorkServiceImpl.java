package kr.or.ddit.work.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.DepMapper;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.WorkMapper;
import kr.or.ddit.work.vo.WorkVO;

@Service
public class WorkServiceImpl implements IWorkService{

	@Inject
	private WorkMapper workMapper; 
	
	@Inject
	private EmployeeMapper empMapper;
	
	@Inject
	private AttfileMapper afMapper;
	
	@Override
	public int insertWork(WorkVO workVO) {
		// TODO Auto-generated method stub
		return workMapper.insertWork(workVO);
	}

	@Override
	public List<WorkVO> getWorkList(EmployeeVO empVO) {
		// TODO Auto-generated method stub
		return workMapper.getWorkList(empVO);
	}

	@Override
	public List<EmployeeVO> getEmpListByDep(String depCode) {
		// TODO Auto-generated method stub
		return empMapper.getEmpListByDep(depCode);
	}

	@Override
	public List<WorkVO> getDepWorkList(String depCode) {
		// TODO Auto-generated method stub
		return workMapper.getDepWorkList(depCode);
	}

	@Override
	public List<AttFileVO> getAfByEmpList(List<EmployeeVO> empList) {
		// TODO Auto-generated method stub
		List<AttFileVO> empImgList = new ArrayList<AttFileVO>();
		
		for (int i = 0; i < empList.size(); i++) {
			EmployeeVO vo = empList.get(i);
			
			AttFileVO afVO = new AttFileVO();
			afVO.setAfType("PROFILE");
			afVO.setAfTcode(vo.getEmpNo());
			
			afVO = afMapper.getAf(afVO);
			empImgList.add(afVO);
		}
		
		return empImgList;
	}

	
	
	
	
	
}



