package kr.or.ddit.good.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.alert.vo.AlertVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.mapper.AlertMapper;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.FreeMapper;
import kr.or.ddit.mapper.GoodMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodServiceImpl implements IGoodService {
	
	@Inject
	private GoodMapper goodMapper;
	
	@Inject
	private EmployeeMapper empMapper;

	@Inject
	private FreeMapper freeMapper;

	@Inject
	private AlertMapper alertMapper;

	@Override
	public List<GoodVO> getGoodList(String empNo) {

		return goodMapper.getGoodList(empNo);
	}

	@Override
	public List<EmployeeVO> getEmpByGoodList(List<GoodVO> goodList) {
		
		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();
		
		for (int i = 0; i < goodList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();
			
			String empNo = goodList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);
			
			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);
			
		}
		return empList;
	}

	//좋아요 insert 공지게시판
	@Override
	public void insertGood(GoodVO goodVO) {
		
		goodMapper.insertGood(goodVO);
	}

	//좋아요 insert 자유게시판
	@Override
	public void insertFree(GoodVO goodVO) {
		
		goodMapper.insertFree(goodVO);
	}

	//나의 좋아요 List
	@Override
	public List<GoodVO> getLikesByUsername(String myLikeNo) {

		return goodMapper.getLikesByUsername(myLikeNo);
	}

	@Override
	public void deleteGood(GoodVO goodVO) {
		// TODO Auto-generated method stub
		goodMapper.deleteGood(goodVO);
		
	}

	@Override
	public FreeVO getFree(String goodType) {
		// TODO Auto-generated method stub
		return freeMapper.getFree(goodType);
	}

	@Override
	public void insertAlert(AlertVO aleVO) {
		// freeCode로 좋아요 받는사람 사번 찾기
		log.info("aleVO >> " + aleVO);
		FreeVO freeVO = freeMapper.getFree(aleVO.getAleType());
		aleVO.setEmpNo(freeVO.getEmpNo());
		aleVO.setAleType(aleVO.getAleType());
		aleVO.setAleContent("새로운 좋아요");
		
		alertMapper.insertAlert(aleVO);
	}


}
