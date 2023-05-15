package kr.or.ddit.mapper;

import kr.or.ddit.attfile.vo.AttFileVO;

public interface AttfileMapper {

	public AttFileVO getAf(AttFileVO afVO);

	public int insertAf(AttFileVO temp);

	public int updateAf(AttFileVO afVO);


}
