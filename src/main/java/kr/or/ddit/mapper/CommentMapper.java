package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.comment.vo.CommentVO;

public interface CommentMapper {

	public void insertComm(CommentVO commVO);

	public List<CommentVO> list(String commType);

	public void updateComm(CommentVO commVO);

	public void deleteComm(CommentVO commVO);

	public List<CommentVO> getComm(String freeCode);

}
