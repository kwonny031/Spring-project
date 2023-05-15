package kr.or.ddit.main.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.service.IAppService;
import kr.or.ddit.approval.vo.AplineVO;
import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.cloud.vo.CloudVO;
import kr.or.ddit.dep.vo.DepVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.mapper.EmployeeMapper;
import kr.or.ddit.mapper.GoodMapper;
import kr.or.ddit.mapper.NoticeMapper;
import kr.or.ddit.mapper.TimelineMapper;
import kr.or.ddit.mapper.WorkMapper;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.timeline.vo.TimelineVO;
import kr.or.ddit.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;
import kr.or.ddit.mapper.AppMapper;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.CloudMapper;
import kr.or.ddit.mapper.DepMapper;

@Slf4j
@Service
public class MainServiceImpl implements IMainService{

	@Inject
	private EmployeeMapper empMapper;
	
	@Inject
	private AttfileMapper aFMapper;

	@Inject
	private DepMapper depMapper;
	
	@Inject
	private TimelineMapper timMapper;
	
	@Inject
	private WorkMapper workMapper;
	
	@Inject
	private AttfileMapper afMapper;
	
	@Inject
	private GoodMapper goodMapper;

	@Inject
	private NoticeMapper noticeMapper;
	
	@Inject
	private AppMapper appMapper;
	
	@Inject
	private CloudMapper cloudMapper;
	
	@Override
	public EmployeeVO getEmp(EmployeeVO empVO) {
		// TODO Auto-generated method stub
		return empMapper.getEmp(empVO);
	}

	@Override
	public EmployeeVO loginCheck(EmployeeVO empVO) {
		// TODO Auto-generated method stub
		return empMapper.loginCheck(empVO);
	}

	@Override
	public AttFileVO getAf(AttFileVO afVO) {
		// TODO Auto-generated method stub
		return aFMapper.getAf(afVO);
	}

	@Override
	public DepVO getDep(String depCode) {
		// TODO Auto-generated method stub
		return depMapper.getDep(depCode);
	}

	@Override
	public List<DepVO> getDepList() {
		// TODO Auto-generated method stub
		return depMapper.getDepList();
	}

	@Override
	public List<EmployeeVO> getEmpList() {
		// TODO Auto-generated method stub
		return empMapper.getEmpList();
	}

	@Override
	public List<TimelineVO> timlist(String empNo) {
		// TODO Auto-generated method stub
		return timMapper.timlist(empNo);
	}

	@Override
	public List<WorkVO> getWorkList(EmployeeVO empVO) {
		// TODO Auto-generated method stub
		return workMapper.getWorkList(empVO);
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
	public List<GoodVO> goodList(String empNo) {
		// TODO Auto-generated method stub
		return goodMapper.goodList(empNo);
	}

	@Override
	public List<NoticeVO> getRecNotList() {
		// TODO Auto-generated method stub
		List<NoticeVO> notList = noticeMapper.getRecNotList(); 
		
		return notList;
	}

	@Override
	public List<EmployeeVO> getEmpByNoticeList(List<NoticeVO> notList) {
		// TODO Auto-generated method stub
		List<EmployeeVO> notEmpList = new ArrayList<EmployeeVO>();
		
		for (int i = 0; i < notList.size(); i++) {
			EmployeeVO empVO = new EmployeeVO();
			
			String empNo = notList.get(i).getEmpNo();
			empVO.setEmpNo(empNo);
			
			empVO = empMapper.getEmp(empVO);
			notEmpList.add(empVO);
		}
		
		return notEmpList;
	}

	@Override
	public List<Integer> getGoodByNoticeList(List<NoticeVO> notList) {
		List<Integer> notGoodList = new ArrayList<Integer>();
		
		for (int i = 0; i < notList.size(); i++) {
			NoticeVO noticeVO = notList.get(i);
			
			List<GoodVO> tmpList = goodMapper.getGood(noticeVO.getNotCode());
			if(tmpList.size() != 0) {
				
				notGoodList.add(tmpList.size());
			}else {
				notGoodList.add(0);
			}
		}
		
		return notGoodList;
	}

	@Override
	public List<AplineVO> getAppLineListByEmpNo(EmployeeVO empVO) throws Exception {
		// TODO Auto-generated method stub
		return appMapper.getAppLineListByEmpNo(empVO);
	}

	@Override
	public List<CloudVO> empCloud(String empNo) {
		// TODO Auto-generated method stub
		return cloudMapper.empCloud(empNo);
	}

	@Override
	public List<CloudVO> depCloud(String empNo) {
		// TODO Auto-generated method stub
		return cloudMapper.depCloud(empNo);
	}

	@Override
	public void update(EmployeeVO empVO) {
		// TODO Auto-generated method stub
		String pw = empVO.getEmpPw();
		log.info("pw >> " + pw);
		empVO = empMapper.getEmp(empVO);
		log.info("pw >> " + pw);
		empVO.setEmpPw(pw);
		log.info("empp >> " + empVO);
		empMapper.update(empVO);
		
	}

	@Override
	public List<GoodVO> getGoodList(String empNo) {
		// TODO Auto-generated method stub
		return goodMapper.getGoodList(empNo);
	}

	
	
	
	
	
	
}


