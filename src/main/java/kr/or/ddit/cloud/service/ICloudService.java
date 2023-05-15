package kr.or.ddit.cloud.service;

import java.util.List;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.cloud.vo.CloudVO;

public interface ICloudService {

	public List<CloudVO> empCloud(String empNo);			// 개인 자료실

	public List<CloudVO> depCloud(String empNo);			// 부서 자료실

	public List<CloudVO> depFolderList(String depCode);		// 부서 자료실 목록

	public int createParentFolder(CloudVO cloudVO);			// 클라우드 상위 폴더 생성

	public int createChildFolder(CloudVO cloudVO); 			// 클라우드 하위 폴더 생성

	public List<CloudVO> empFolderList(String empNo);		// 개인 자료실 목록

	public int insertAf(AttFileVO afVO);					// 첨부파일 업로드

	public String searchFolCode(String fileName);	// 폴더 코드 찾기

  
}
