package kr.or.ddit.notice.service;

import java.util.List;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.common.vo.ComCodeVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.good.vo.GoodVO;
import kr.or.ddit.notice.vo.NoticeVO;

public interface INoticeService {

	public List<NoticeVO> getNoticeList();

	public List<EmployeeVO> getEmpByNoticeList(List<NoticeVO> noticeList);

	public List<ComCodeVO> getPosByEmpList(List<EmployeeVO> empList);

	public List<Integer> getGoodByNoticeList(List<NoticeVO> noticeList);

	public void register(NoticeVO noticeVO);

	public void incrementHit(String notCode);

	public NoticeVO getNotice(String notCode);

	public EmployeeVO getEmpByNotice(NoticeVO noticeVO);

	public ComCodeVO getCc(ComCodeVO ccVO);

	public AttFileVO getAf(AttFileVO afVO);

	public List<GoodVO> getGood(String notCode);

	public List<EmployeeVO> getEmpByGoodList(List<GoodVO> goodList);

	public List<AttFileVO> getAfByEmpList(List<EmployeeVO> empList);

	public List<ComCodeVO> getTimeList(List<GoodVO> goodList);

	public void update(NoticeVO noticeVO);

	public void delete(String notCode);

	public List<NoticeVO> getRecNotList();

	public int insertAf(AttFileVO afVO);

}
