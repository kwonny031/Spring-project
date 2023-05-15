package kr.or.ddit.comment.service;

import java.util.List;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.timeline.vo.TimelineVO;

public interface ICommentService {

	public void insertComm(CommentVO commVO);

	public List<CommentVO> list(String commType);

	public void updateComm(CommentVO commVO);

	public void deleteComm(CommentVO commVO);

}
