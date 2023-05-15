package kr.or.ddit.good.service;

import java.util.List;

import kr.or.ddit.alert.vo.AlertVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;

public interface IGoodService {

	public List<GoodVO> getGoodList(String youLikeNo);

	public List<EmployeeVO> getEmpByGoodList(List<GoodVO> goodList);

	//좋아요 insert 공지게시판
	public void insertGood(GoodVO goodVO);

	//좋아요 insert 자유게시판
	public void insertFree(GoodVO goodVO);

	//나의 좋아요 List
	public List<GoodVO> getLikesByUsername(String myLikeNo);

	public void deleteGood(GoodVO goodVO);

	public FreeVO getFree(String goodType);

	public void insertAlert(AlertVO aleVO);

	

}
