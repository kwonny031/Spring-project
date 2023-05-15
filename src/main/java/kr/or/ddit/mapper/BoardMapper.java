package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.board.vo.BoardFavoriteVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PostVO;

public interface BoardMapper {

	List<BoardVO> getBoaList();

	List<BoardFavoriteVO> getBfList(String boaCode);

	BoardVO getBoa(String boaCode);

	int insertPost(PostVO postVO);

	List<PostVO> getPostList(String boaCode);

	String getPostNum(String boaCode);

	String getRecDate(String boaCode);

}
