package kr.or.ddit.notice.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.common.Utils;
import kr.or.ddit.common.vo.ComCodeVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.ComCodeMapper;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.GoodMapper;
import kr.or.ddit.mapper.NoticeMapper;
import kr.or.ddit.mapper.TimelineMapper;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.timeline.vo.TimelineVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Inject
	private NoticeMapper noticeMapper;
	
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
	
	
	@Override
	public List<NoticeVO> getNoticeList() {
		return noticeMapper.getNoticeList();
	}

	@Override
	public NoticeVO getNotice(String notCode) {
		return noticeMapper.getNotice(notCode);
	}
	
	@Override
	public void incrementHit(String notCode) {
		noticeMapper.incrementHit(notCode);
	}

	@Override
	public List<EmployeeVO> getEmpByNoticeList(List<NoticeVO> noticeList) {
		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();
		
		for (int i = 0; i < noticeList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();
			
			String empNo = noticeList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);
			
			empVO = empMapper.getEmp(empVO);
			empList.add(empVO);
		}
		
		return empList;
	}

	@Override
	public EmployeeVO getEmpByNotice(NoticeVO noticeVO) {
		EmployeeVO empVO = new EmployeeVO();
		
		empVO.setEmpNo(noticeVO.getEmpNo());
		
		return empMapper.getEmp(empVO);
	}

	@Override
	public AttFileVO getAf(AttFileVO afVO) {
		return afMapper.getAf(afVO);
	}

	@Override
	public List<Integer> getGoodByNoticeList(List<NoticeVO> noticeList) {
		List<Integer> goodCountList = new ArrayList<Integer>();
		
		for (int i = 0; i < noticeList.size(); i++) {
			NoticeVO noticeVO = noticeList.get(i);
			
			List<GoodVO> tmpList = goodMapper.getGood(noticeVO.getNotCode());
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
		return goodMapper.getGood(goodType);
	}

	@Override
	public List<EmployeeVO> getEmpByGoodList(List<GoodVO> goodList) {
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
		ccVO = ccMapper.getCc(ccVO);
		return ccVO;
	}

	@Override
	public void register(NoticeVO noticeVO) {
		noticeMapper.register(noticeVO);
		
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(noticeVO.getNotCode()); //null
		timVO.setEmpNo(noticeVO.getEmpNo());
		timVO.setTimContent("공지사항이 등록되었습니다.");
		timeMapper.insertTime(timVO);
	}

	@Override
	public void update(NoticeVO noticeVO) {
		noticeMapper.update(noticeVO);
		
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(noticeVO.getNotCode()); //null
		timVO.setEmpNo(noticeVO.getEmpNo());
		timVO.setTimContent("공지사항이 수정되었습니다.");
		timeMapper.insertTime(timVO);
	}

	@Override
	public void delete(String notCode) {
		noticeMapper.delete(notCode);
	}

	@Override
	public List<NoticeVO> getRecNotList() {
		// TODO Auto-generated method stub
		return noticeMapper.getRecNotList();
	}

	@Override
	public int insertAf(AttFileVO afVO) {
		// TODO Auto-generated method stub
		return afMapper.insertAf(afVO);
	}









	
	
	
}
