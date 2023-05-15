package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PostVO;
import kr.or.ddit.dep.vo.DepVO;
import kr.or.ddit.employee.vo.EmployeeVO;

public interface IBoardService {

	List<BoardVO> getBoaList();

	List<DepVO> getDepByBoaList(List<BoardVO> boaList);

	List<AttFileVO> getAfByBoaList(List<BoardVO> boaList);

	Map<String, Object> getDepEmpByBoaList(List<BoardVO> boaList);

	List<List<AttFileVO>> getBoaAfByBoaList(List<BoardVO> boaList);

	BoardVO getBoa(String boaCode);

	void tempData(String flag);

	List<PostVO> getPostList(String boaCode);

	List<String> getPostNum(List<BoardVO> boaList);

	List<String> getRecDate(List<BoardVO> boaList);

	int insertPost(PostVO postVO);

}
