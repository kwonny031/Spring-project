package kr.or.ddit.employee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.CloudMapper;
import kr.or.ddit.mapper.EmployeeMapper;

@Service
public class EmpServiceImpl implements IEmpService {

	@Inject
	private EmployeeMapper empMapper;
	
	@Inject
	private AttfileMapper afMapper;
	
	@Inject
	private CloudMapper cloudMapper;
	
	@Override
	public List<EmployeeVO> list() {
		return empMapper.list();
	}

	@Override
	public EmployeeVO selectMember(String id) {
		return empMapper.selectMember(id);
	}

	@Override
	public String idFind(EmployeeVO empVO) {
		return empMapper.idFind(empVO);
	}

	@Override
	public String pwFind(EmployeeVO empVO) {
		return empMapper.pwFind(empVO);
	}

	@Override
	public int insertAf(AttFileVO afVO) {
		// 사진이 존재하면 update. 없으면 insert
		AttFileVO temp = afVO;
		afVO = afMapper.getAf(afVO);
		
		int count;
		
		if (afVO == null) {
			count = afMapper.insertAf(temp);
		}else {
			temp.setAfCode(afVO.getAfCode());
			count = afMapper.updateAf(temp);
		}
		
		return count;
	}

	@Override
	public AttFileVO getAf(AttFileVO afVO) {
		return afMapper.getAf(afVO);
	}

	@Override
	public void register(EmployeeVO empVO) {
		empVO.setEmpNo(empVO.getEmpNo());
		//사원등록
		empMapper.register(empVO);
		
		
		//클라우드 생성
		cloudMapper.register(empVO);
	}

	@Override
	public List<EmployeeVO> listAdmin() {
		return empMapper.listAdmin();
	}

	@Override
	public EmployeeVO getEmpNo(String empNo) {
		return empMapper.getEmpNo(empNo);
	}

	@Override
	public void update(EmployeeVO empVO) {
		empMapper.update(empVO);
	}

	@Override
	public int getAllPostCount(String empNo) {
		// TODO Auto-generated method stub
		return empMapper.getAllPostCount(empNo);
	}

	@Override
	public int getAllGoodCount(String empNo) {
		// TODO Auto-generated method stub
		return empMapper.getAllGoodCount(empNo);
	}

	
	
	
	
	
}




