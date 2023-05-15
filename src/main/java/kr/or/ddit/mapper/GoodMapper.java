package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.good.vo.GoodVO;

public interface GoodMapper {

	public List<GoodVO> getGood(String goodType);

	public List<GoodVO> getGoodByFree(FreeVO freeVO);

	//상대방의 좋아요 List
	public List<GoodVO> getGoodList(String empNo);

	public List<GoodVO> goodList(String empNo);

	//좋아요insert공지게시판
	public void insertGood(GoodVO goodVO);

	//좋아요insert자유게시판
	public void insertFree(GoodVO goodVO);

	//나의 좋아요 List
	public List<GoodVO> getLikesByUsername(String myLikeNo);

	public void deleteGood(GoodVO goodVO);

	
}
