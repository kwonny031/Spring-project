package kr.or.ddit.timeline.service;

import java.util.List;

import kr.or.ddit.timeline.vo.TimelineVO;

public interface ITimelineService {

	public void insertTime(TimelineVO timVO);

	public List<TimelineVO> timlist(String empNo);

}
