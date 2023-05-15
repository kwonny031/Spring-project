package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.message.vo.MesrecVO;
import kr.or.ddit.message.vo.MessageVO;


public interface MesRecMapper {

	public List<MesrecVO> getMessageList();
	
	public MesrecVO getMessage(String mesCode);

	public List<MessageVO> getMesrecList();

}
