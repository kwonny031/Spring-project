package kr.or.ddit.free.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.common.Utils;
import kr.or.ddit.common.vo.ComCodeVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.ComCodeMapper;
import kr.or.ddit.mapper.CommentMapper;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.FreeMapper;
import kr.or.ddit.mapper.GoodMapper;
import kr.or.ddit.mapper.TimelineMapper;
import kr.or.ddit.timeline.vo.TimelineVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FreeServiceImpl implements IFreeService{

	@Inject
	private FreeMapper freeMapper;
	
	@Inject
	private EmployeeMapper empMapper;
	
	@Inject
	private AttfileMapper afMapper;

	@Inject
	private GoodMapper goodMapper;
	
	@Inject
	private ComCodeMapper ccMapper;
	
	@Inject
	private TimelineMapper timeMapper;

	@Inject
	private CommentMapper commMapper;
	
	
	
	@Override
	public List<FreeVO> getFreeList() {
		// TODO Auto-generated method stub
		return freeMapper.getFreeList();
	}

	@Override
	public FreeVO getFree(String freeCode) {
		// TODO Auto-generated method stub
		return freeMapper.getFree(freeCode);
	}

	@Override
	public void incrementHit(String freeCode) {
		freeMapper.incrementHit(freeCode);
	}

	@Override
	public List<EmployeeVO> getEmpByFreeList(List<FreeVO> freeList) {
		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();
	
		for (int i = 0; i < freeList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();
			
			String empNo = freeList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);
			
			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);
		}
		
		return empList;
	}

	@Override
	public EmployeeVO getEmpByFree(FreeVO freeVO) {
		// TODO Auto-generated method stub
		EmployeeVO empVO = new EmployeeVO();
		
		empVO.setEmpNo(freeVO.getEmpNo());
		
		return empMapper.getEmp(empVO);
	}

	@Override
	public AttFileVO getAf(AttFileVO afVO) {
		// TODO Auto-generated method stub
		return afMapper.getAf(afVO);
	}

	@Override
	public List<Integer> getGoodByFreeList(List<FreeVO> freeList) {
		// TODO Auto-generated method stub
		List<Integer> goodCountList = new ArrayList<Integer>();
		
		for (int i = 0; i < freeList.size(); i++) {
			FreeVO freeVO = freeList.get(i);
			
			List<GoodVO> tmpList = goodMapper.getGood(freeVO.getFreeCode());
			if(tmpList.size() != 0) {
				
				goodCountList.add(tmpList.size());
			}else {
				goodCountList.add(0);
			}
		}
		
		return goodCountList;
	}

	@Override
	public List<GoodVO> getGood(String goodType) {
		// TODO Auto-generated method stub
		return goodMapper.getGood(goodType);
	}

	@Override
	public List<EmployeeVO> getEmpByGoodList(List<GoodVO> goodList) {
		// TODO Auto-generated method stub
		
		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();
		for (int i = 0; i < goodList.size(); i++) {
			
			GoodVO goodVO = goodList.get(i);
			
			EmployeeVO empVO = new EmployeeVO();
			empVO.setEmpNo(goodVO.getEmpNo());
			
			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);
		}
		
		return empList;
	}

	@Override
	public List<ComCodeVO> getTimeList(List<GoodVO> goodList) {
		// TODO Auto-generated method stub
		
		// java로 리스트를 여러개 만들거나 SQL.xml에서 resultMap 사용
		List<ComCodeVO> timeList = new ArrayList<>();
		for (int i = 0; i < goodList.size(); i++) {
			
			GoodVO goodVO = goodList.get(i);
			
			// Utils.calDate() - 파라미터에 Date 넣고 리턴은 ComcodeVO
			String timeCode = Utils.calDate(goodVO.getGoodDate());
			
			ComCodeVO ccVO = new ComCodeVO();
			ccVO.setComGroup("TIME_DISP");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd.");
			if (timeCode.equals("7")) {
				
				String ccName = sdf.format(goodVO.getGoodDate());
				ccVO.setCcName(ccName);
				
			}else {
				ccVO.setComCode(timeCode);
				ccVO = ccMapper.getCc(ccVO);
			}
			
			timeList.add(ccVO);
		}
		
		return timeList;
	}

	@Override
	public List<AttFileVO> getAfByEmpList(List<EmployeeVO> empList) {
		// TODO Auto-generated method stub
		
		List<AttFileVO> afList = new ArrayList<AttFileVO>();
		for (int i = 0; i < empList.size(); i++) {
			
			EmployeeVO empVO = empList.get(i);
			AttFileVO afVO = new AttFileVO();
			afVO.setAfType("PROFILE");
			afVO.setAfTcode(empVO.getEmpNo());			
			
			afVO = afMapper.getAf(afVO);
			
			afList.add(afVO);
		}
		
		return afList;
	}

	@Override
	public List<ComCodeVO> getPosByEmpList(List<EmployeeVO> empList) {
		// TODO Auto-generated method stub
		
		List<ComCodeVO> posList = new ArrayList<ComCodeVO>();
		for (EmployeeVO empVO : empList) {
			
			ComCodeVO ccVO = new ComCodeVO();
			ccVO.setComCode(empVO.getEmpPos());
			ccVO.setComGroup("EMP_POS");
			
			ccVO = ccMapper.getCc(ccVO);
			posList.add(ccVO);
		}		
		
		return posList;
	}

	@Override
	public ComCodeVO getCc(ComCodeVO ccVO) {
		// TODO Auto-generated method stub
		
		ccVO = ccMapper.getCc(ccVO);
		return ccVO;
	}

	@Override
	public void register(FreeVO freeVO) {
		freeMapper.register(freeVO);
		
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(freeVO.getFreeCode()); //null
		timVO.setEmpNo(freeVO.getEmpNo());
		timVO.setTimContent("자유게시판이 등록되었습니다.");
		timeMapper.insertTime(timVO);
	}

	@Override
	public void update(FreeVO freeVO) {
		freeMapper.update(freeVO);
		
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(freeVO.getFreeCode()); //null
		timVO.setEmpNo(freeVO.getEmpNo());
		timVO.setTimContent("자유게시판이 수정되었습니다.");
		timeMapper.insertTime(timVO);
	}

	@Override
	public void delete(String freeCode) {
		freeMapper.delete(freeCode);
	}

	@Override
	public int insertAf(AttFileVO afVO) {
		// TODO Auto-generated method stub
		return afMapper.insertAf(afVO);
	}

	@Override
	public List<Integer> getCommCountByFreeList(List<FreeVO> freeList) {
		// TODO Auto-generated method stub
		List<Integer> commCountList = new ArrayList<Integer>();
		
		for (int i = 0; i < freeList.size(); i++) {
			FreeVO freeVO = freeList.get(i);
			
			List<CommentVO> tmpList = commMapper.getComm(freeVO.getFreeCode());
			if(tmpList.size() != 0) {
				
				commCountList.add(tmpList.size());
			}else {
				commCountList.add(0);
			}
		}
		
		return commCountList;
	}

	@Override
	public List<AttFileVO> getAfByCommList(List<CommentVO> commList) {
		// TODO Auto-generated method stub
		List<AttFileVO> commProfileList = new ArrayList<AttFileVO>();
		for (int i=0; i<commList.size(); i++) {
			
			CommentVO commVO = commList.get(i);
			AttFileVO afVO = new AttFileVO();
			afVO.setAfTcode(commVO.getEmpNo());
			afVO.setAfType("PROFILE");
			afVO = afMapper.getAf(afVO);
			
			commProfileList.add(afVO);
		}		
		
		return commProfileList;
	}

	

	
	
	

	
	
}



