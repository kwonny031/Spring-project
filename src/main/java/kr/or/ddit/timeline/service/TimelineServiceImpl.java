package kr.or.ddit.timeline.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.mapper.TimelineMapper;
import kr.or.ddit.timeline.vo.TimelineVO;

@Service
public class TimelineServiceImpl implements ITimelineService {

	@Inject
	private TimelineMapper timemapper;
	
	@Override
	public void insertTime(TimelineVO timVO) {
		timemapper.insertTime(timVO);
	}

	@Override
	public List<TimelineVO> timlist(String empNo) {
		return timemapper.timlist(empNo);
	}


}
