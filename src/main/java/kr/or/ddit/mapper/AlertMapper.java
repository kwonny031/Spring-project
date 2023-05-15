package kr.or.ddit.mapper;

import kr.or.ddit.alert.vo.AlertVO;

public interface AlertMapper {

	void insertAlert(AlertVO aleVO);

	void update(AlertVO aleVO);

}
