package kr.or.ddit.comment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.alert.vo.AlertVO;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.free.vo.FreeVO;
import kr.or.ddit.mapper.AlertMapper;
import kr.or.ddit.mapper.CommentMapper;
import kr.or.ddit.mapper.FreeMapper;
import kr.or.ddit.mapper.TimelineMapper;
import kr.or.ddit.timeline.vo.TimelineVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class CommentServiceImpl implements ICommentService {

	@Inject
	private CommentMapper commapper;
	
	@Inject
	private FreeMapper freeMapper;
	
	@Inject
	private TimelineMapper timeMapper;
	
	@Inject
	private AlertMapper alertMapper;
	
	@Override
	public void insertComm(CommentVO commVO) {
		// commType 정의
		// empNo 정의
		// commPath 정의
		commapper.insertComm(commVO); // selectKey 설정
		
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(commVO.getCommType()); //null commType으로 수정
		timVO.setEmpNo(commVO.getEmpNo());
		timVO.setTimContent("댓글이 등록되었습니다.");
		timeMapper.insertTime(timVO);
		
		// 댓글 등록시 알람(alert) 등록
		AlertVO aleVO = new AlertVO();
		
		// 자유게시판인 경우..
		FreeVO freeVO = freeMapper.getFree(commVO.getCommType());
		aleVO.setEmpNo(freeVO.getEmpNo()); // commType 조회해서 사원번호 찾아야 함.
		aleVO.setAleType(commVO.getCommType());
		aleVO.setAleContent("새로운 댓글");
		
		alertMapper.insertAlert(aleVO);
		
	}
	
	
	@Override
	public List<CommentVO> list(String commType) {
		return commapper.list(commType);
	}

	

	@Override
	public void updateComm(CommentVO commVO) {
		commapper.updateComm(commVO);
		
		TimelineVO timVO = new TimelineVO();
		timVO.setTimType(commVO.getCommCode()); //null
		timVO.setEmpNo(commVO.getEmpNo());
		timVO.setTimContent("댓글이 수정되었습니다.");
		timeMapper.insertTime(timVO);
	}


	@Override
	public void deleteComm(CommentVO commVO) {
		commapper.deleteComm(commVO);
	}

	

	
	

	


}
