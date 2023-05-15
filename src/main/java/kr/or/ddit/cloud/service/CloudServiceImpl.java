package kr.or.ddit.cloud.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.cloud.vo.CloudVO;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.CloudMapper;

@Service
public class CloudServiceImpl implements ICloudService {

	@Inject
	private CloudMapper cloudMapper; 
	
	@Inject
	private AttfileMapper afMapper;
	
	@Override
	public List<CloudVO> empCloud(String empNo) {
		return cloudMapper.empCloud(empNo); 
	}
 
	@Override
	public List<CloudVO> depCloud(String empNo) {
		return cloudMapper.depCloud(empNo);
	}

	@Override
	public List<CloudVO> depFolderList(String depCode) {
		return cloudMapper.depFolderList(depCode);
	}

	@Override
	public int createChildFolder(CloudVO cloudVO) {
		return cloudMapper.createChildFolder(cloudVO);
	}

	@Override
	public int createParentFolder(CloudVO cloudVO) {
		return cloudMapper.createParentFolder(cloudVO);
	}

	@Override
	public List<CloudVO> empFolderList(String empNo) {
		return cloudMapper.empFolderList(empNo);
	}

	@Override
	public int insertAf(AttFileVO afVO) {
		AttFileVO temp = afVO;
		afVO = afMapper.getAf(afVO);
		
		int count;
		
		// 파일이 존재하면 update. 없으면 insert
		if (afVO == null) {
			count = afMapper.insertAf(temp);
		}else {
			temp.setAfCode(afVO.getAfCode());
			count = afMapper.updateAf(temp);
		}
		
		return count;
	}

	@Override
	public String searchFolCode(String fileName) {
		return cloudMapper.searchFolCode(fileName);
	}

}
