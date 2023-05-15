package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.message.vo.MesrecVO;
import kr.or.ddit.message.vo.MessageVO;

public interface MessageMapper {

	public List<MessageVO> getMessageList();
	
	//쪽지 detail
	public MessageVO getMessage(String mesCode);

	public int write(MessageVO msgVO);

	//받은 쪽지 삭제
	public int deleteMsg(MessageVO msgVO);

	// 받은쪽지함 목록 정보 가져오기
	public List<MessageVO> selectReceiveList(String empNo);

	// message 테이블에 내가 보낸 쪽지 정보를 한번 기록 한다.
	public int sendMessage(MessageVO msgVO);
	// 쪽지 보낼때 내가 선택한 주소록의 사람에 해당하는 사원번호
	public String getEmpNo(String string);

	public List<MessageVO> selectSendList(String empNo);


	//store List
	public List<MessageVO> getStoreList();

	//받은쪽지 즐겨찾기
	public void updateMsg(MesrecVO mesVO);

	//받은쪽지 detail
	public MessageVO getMSG(String mesCode);


}
