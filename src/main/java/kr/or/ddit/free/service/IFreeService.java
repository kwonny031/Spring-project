package kr.or.ddit.free.service;

import java.util.List;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.common.vo.ComCodeVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;

public interface IFreeService {

	public List<FreeVO> getFreeList();

	public FreeVO getFree(String freeCode);

	public void incrementHit(String freeCode);

	public List<EmployeeVO> getEmpByFreeList(List<FreeVO> freeList);

	public EmployeeVO getEmpByFree(FreeVO freeVO);

	public AttFileVO getAf(AttFileVO afVO);

	public List<Integer> getGoodByFreeList(List<FreeVO> freeList);

	public List<GoodVO> getGood(String goodType);

	public List<EmployeeVO> getEmpByGoodList(List<GoodVO> goodList);

	public List<ComCodeVO> getTimeList(List<GoodVO> goodList);

	public List<AttFileVO> getAfByEmpList(List<EmployeeVO> empList);

	public List<ComCodeVO> getPosByEmpList(List<EmployeeVO> empList);

	public ComCodeVO getCc(ComCodeVO ccVO);

	public void register(FreeVO freeVO);

	public void update(FreeVO freeVO);

	public void delete(String freeCode);

	public int insertAf(AttFileVO afVO);

	public List<Integer> getCommCountByFreeList(List<FreeVO> freeList);

	public List<AttFileVO> getAfByCommList(List<CommentVO> commList);


}
