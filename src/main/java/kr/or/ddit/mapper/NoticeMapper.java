package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.notice.vo.NoticeVO;

public interface NoticeMapper {

	public NoticeVO getNotice(String notCode);

	public List<NoticeVO> getNoticeList();

	public void incrementHit(String notCode);

	public void register(NoticeVO noticeVO);

	public void update(NoticeVO noticeVO);

	public void delete(String notCode);

	public List<NoticeVO> getRecNotList();

}
