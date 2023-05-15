package kr.or.ddit.main.service;

import java.util.List;

import kr.or.ddit.approval.vo.AplineVO;
import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.cloud.vo.CloudVO;
import kr.or.ddit.dep.vo.DepVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.timeline.vo.TimelineVO;
import kr.or.ddit.work.vo.WorkVO;

public interface IMainService {

	public EmployeeVO getEmp(EmployeeVO empVO);

	public EmployeeVO loginCheck(EmployeeVO empVO);

	public AttFileVO getAf(AttFileVO afVO);

	public DepVO getDep(String depCode);

	public List<DepVO> getDepList();

	public List<EmployeeVO> getEmpList();

	public List<TimelineVO> timlist(String empNo);

	public List<WorkVO> getWorkList(EmployeeVO empVO);

	public List<AttFileVO> getAfByEmpList(List<EmployeeVO> empList);

	public List<EmployeeVO> getEmpListByDep(String depCode);

	public List<WorkVO> getDepWorkList(String depCode);

	//메인화면 좋아요 List
	public List<GoodVO> goodList(String empNo);

	public List<NoticeVO> getRecNotList();

	public List<EmployeeVO> getEmpByNoticeList(List<NoticeVO> notList);

	public List<Integer> getGoodByNoticeList(List<NoticeVO> notList);

	public List<AplineVO> getAppLineListByEmpNo(EmployeeVO empVO) throws Exception;
	
	// 메인화면 클라우드 리스트
	public List<CloudVO> empCloud(String empNo);

	public List<CloudVO> depCloud(String empNo);

	public void update(EmployeeVO empVO);

	public List<GoodVO> getGoodList(String empNo);

}
