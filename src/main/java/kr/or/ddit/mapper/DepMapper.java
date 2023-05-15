package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.board.vo.BoardFavoriteVO;
import kr.or.ddit.dep.vo.DepVO;

public interface DepMapper {

	DepVO getDep(String depCode);

	List<DepVO> getDepList();

}
