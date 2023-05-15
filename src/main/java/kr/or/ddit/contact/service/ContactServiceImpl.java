package kr.or.ddit.contact.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.mapper.ContactMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ContactServiceImpl implements IContactService {
	
	@Inject
	private ContactMapper contactMapper;
	
	@Override
	public List<ContactVO> getContactList() {
		
		return contactMapper.getContactList();
	}

	@Override
	public void register(ContactVO conVO) {
		contactMapper.register(conVO);
		
	}

	@Override
	public List<ContactVO> getTehList() {

		return contactMapper.getTehList();
	}

	@Override
	public List<ContactVO> getSalesList() {
		// TODO Auto-generated method stub
		return contactMapper.getSalesList();
	}

	@Override
	public List<ContactVO> getMnList() {
		// TODO Auto-generated method stub
		return contactMapper.getMnList();
	}

	@Override
	public List<ContactVO> contactList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContactVO> getNtList() {
		// TODO Auto-generated method stub
		return contactMapper.getNtList();
	}

	@Override
	public void deleteContactList(ContactVO conVO) {
		
		contactMapper.deleteContactList(conVO);
		
	}

	//보안기술부
	@Override
	public List<ContactVO> getSecList() {
		// TODO Auto-generated method stub
		return contactMapper.getSecList();
	}

}
