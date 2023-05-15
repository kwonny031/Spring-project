package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.free.vo.FreeVO;

public interface FreeMapper {

	public List<FreeVO> getFreeList();

	public FreeVO getFree(String freeCode);

	public void incrementHit(String freeCode);

	public void register(FreeVO freeVO);

	public void update(FreeVO freeVO);

	public void delete(String freeCode);


}
