package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.timeline.vo.TimelineVO;

public interface TimelineMapper {

	public void insertTime(TimelineVO timVO);

	public List<TimelineVO> timlist(String empNo);

}
