package kr.or.ddit.message.service;

import java.util.List;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.message.vo.MesrecVO;
import kr.or.ddit.message.vo.MessageVO;

public interface IMessageService {

	public List<MessageVO> getMessageList();

	public List<EmployeeVO> getEmpByMsgList(List<MessageVO> messageList);

	// 쪽지 detail
	public MessageVO getMessage(String mesCode);

	// 쪽지 detail
	public EmployeeVO getEmpByMessage(MessageVO messageVO);

	public AttFileVO getAf(AttFileVO afVO);

	// 쪽지 작성 write
	public int write(String sendEmpNo, String[] recvEmpNOs, MessageVO msgVO);

	// 쪽지 보내기 주소록 List
	public List<ContactVO> getContactList();

	// 받은 쪽지 삭제
	public void deleteMsg(MessageVO msgVO);

	// 받은쪽지함 리스트 정보 가져오기
	public List<MessageVO> selectReceiveList(String empNo);

	/**
	 * @param empNo
	 * @return 보낸쪽지함 목록
	 */
	public List<MessageVO> selectSendList(String empNo);

	// store
	public List<MessageVO> getStoreList();

	// store
	public List<EmployeeVO> getEmpByStoreList(List<MessageVO> storeList);

	// 받은쪽지 즐겨찾기
	public void updateMsg(MesrecVO mesVO);

	//받은 쪽지 Detail
	public MessageVO getMSG(String mesCode);

}
