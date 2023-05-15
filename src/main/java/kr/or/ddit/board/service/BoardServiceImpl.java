package kr.or.ddit.board.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.board.vo.BoardFavoriteVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PostVO;
import kr.or.ddit.common.Utils;
import kr.or.ddit.dep.vo.DepVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.mapper.AttfileMapper;
import kr.or.ddit.mapper.BoardMapper;
import kr.or.ddit.mapper.DepMapper;
import kr.or.ddit.mapper.EmployeeMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements IBoardService{

	@Inject
	private BoardMapper boardMapper;
	
	@Inject
	private DepMapper depMapper;

	@Inject
	private AttfileMapper afMapper;
	
	@Inject
	private EmployeeMapper empMapper;

	@Override
	public List<BoardVO> getBoaList() {
		// TODO Auto-generated method stub
		return boardMapper.getBoaList();
	}

	@Override
	public List<DepVO> getDepByBoaList(List<BoardVO> boaList) {
		// TODO Auto-generated method stub
		List<DepVO> depList = new ArrayList<DepVO>();
		
		for (BoardVO boaVO : boaList) {
			DepVO depVO = depMapper.getDep(boaVO.getDepCode());
			depList.add(depVO);
		}
		
		return depList;
	}

	@Override
	public List<AttFileVO> getAfByBoaList(List<BoardVO> boaList) {
		// TODO Auto-generated method stub
		List<AttFileVO> afList = new ArrayList<AttFileVO>();
		
		for (BoardVO boaVO : boaList) {
			AttFileVO afVO = new AttFileVO();
			afVO.setAfType("BOA");
			afVO.setAfTcode(boaVO.getBoaCode());	
			
			afVO = afMapper.getAf(afVO);
			afList.add(afVO);
		}
		
		return afList;
	}

	// 게시판 별 작성권한 사원 리스트 (게시판의 부서 + BOAFAV-BF_WRITE가 Y)
	// 사원 프로필리스트까지 한번에 만들기
	@Override
//	public List<List<EmployeeVO>> getDepEmpByBoaList(List<BoardVO> boaList) {
	public Map<String, Object> getDepEmpByBoaList(List<BoardVO> boaList) {
		// TODO Auto-generated method stub
		List<List<EmployeeVO>> depEmpList = new ArrayList<List<EmployeeVO>>();
		List<DepVO> depList = new ArrayList<DepVO>();
		List<List<BoardFavoriteVO>> boaBfList = new ArrayList<List<BoardFavoriteVO>>();
		
		for (BoardVO boaVO : boaList) {
			DepVO depVO = depMapper.getDep(boaVO.getDepCode());
			depList.add(depVO);			
			
			List<BoardFavoriteVO> bfList = boardMapper.getBfList(boaVO.getBoaCode());
			boaBfList.add(bfList);			
		}
		
		List<List<AttFileVO>> boaAfList = new ArrayList<List<AttFileVO>>();		
		
		for (int i=0; i<boaList.size(); i++) {
			DepVO depVO = depList.get(i);
			List<EmployeeVO> empList = empMapper.getEmpListByDep(depVO.getDepCode());
			
			List<BoardFavoriteVO> bfList = boaBfList.get(i);
			
			for (int j = 0; j < bfList.size(); j++) {
				if(bfList.get(j).getBfWrite().equals("Y")) {
					EmployeeVO empVO = new EmployeeVO();
					empVO.setEmpNo(bfList.get(j).getEmpNo());
					empList.add(empMapper.getEmp(empVO));
				}
			}
			
			log.info("emp size >> " + empList.size());
			
			// 부서원 직급 순으로 정렬
			Collections.sort(empList, new EmpPosComparator());	
			log.info("emp1 >> " + empList);
			depEmpList.add(empList);
			

			// 프로필
			List<AttFileVO> afList = new ArrayList<AttFileVO>();
			
			for (int j = 0; j < empList.size(); j++) {
				AttFileVO afVO = new AttFileVO();
				afVO.setAfType("PROFILE");
				afVO.setAfTcode(empList.get(j).getEmpNo());
				
				afVO = afMapper.getAf(afVO);
				
				afList.add(afVO);
			}
			
			boaAfList.add(afList);			
			
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("depEmpList", depEmpList);
		map.put("boaAfList", boaAfList);
		
		return map;
	}

	// 게시판 별 사원의 프로필 리스트.
	// 쿼리에서 묶음으로 가져와야 하나.
	@Override
	public List<List<AttFileVO>> getBoaAfByBoaList(List<BoardVO> boaList) {
		// TODO Auto-generated method stub
		List<List<AttFileVO>> boaAfList = new ArrayList<List<AttFileVO>>();
		List<DepVO> depList = new ArrayList<DepVO>();
		
		for (BoardVO boaVO : boaList) {
			DepVO depVO = depMapper.getDep(boaVO.getDepCode());
			depList.add(depVO);			
		}
		
		for (int i=0; i<boaList.size(); i++) {
			DepVO depVO = depList.get(i);
			List<EmployeeVO> empList = empMapper.getEmpListByDep(depVO.getDepCode());
			Collections.sort(empList, new EmpPosComparator());	
			log.info("emp2 >> " + empList);
			
			List<AttFileVO> afList = new ArrayList<AttFileVO>();
			
			for (int j = 0; j < empList.size(); j++) {
				AttFileVO afVO = new AttFileVO();
				afVO.setAfType("PROFILE");
				afVO.setAfTcode(empList.get(j).getEmpNo());
				
				afVO = afMapper.getAf(afVO);
				
				afList.add(afVO);
			}
			
			boaAfList.add(afList);
		}		
		
		return boaAfList;
	}

	@Override
	public BoardVO getBoa(String boaCode) {
		// TODO Auto-generated method stub
		return boardMapper.getBoa(boaCode);
	}

	@Override
	public void tempData(String flag) {
		// TODO Auto-generated method stub
		if(flag != null && flag.equals("T")) {
			String[] empArr = { // 나영 김연진 지선 용익
					"20080001",
					"20030005",
					"20130001",
					"20170001"
			};
			String[] dateArr = {
					"01","11","21",
					"02","12","22",
					"03","13","23",
					"04","14","24",
					"05","15","25",
					"06","16","26",
					"07","17","27",
					"08","18","28",
					"09","19","29",
					"10","30"
			};
			String[] monthArr = {
					"01","02","03","04","05","06","07","08","09","10","11","12"
			};
			String[] accountArr = {
					"삼성엔지니어링","아이리치그린","퍼시스홀딩스","소프트젠","에이티앤에스그룹",
					"메타넷글로벌","씨에이치컨설팅"
			};
			
			for (int i = 0; i < 70; i++) {
				PostVO postVO = new PostVO();
				// POST_CODE, BOA_CODE, EMP_NO, POST_TITLE, POST_DATE, POST_HIT, POST_ESS, POST_CONTENT
				// ess - 거래일/매출액/거래처
				postVO.setBoaCode("BOA5");
				postVO.setEmpNo(empArr[(int)(Math.random()*empArr.length)]);
				postVO.setPostTitle("거래 내역 "+i);
				
				String ess = "2023/"+monthArr[(int)(Math.random()*monthArr.length)]+"/"+dateArr[(int)(Math.random()*dateArr.length)]
						+"-"+((int)(Math.random()*570)*15_000+700_000)+"-"+accountArr[(int)(Math.random()*accountArr.length)];
				
				postVO.setPostEss(ess);
				postVO.setPostContent("게시글 내용 "+i);
				
				boardMapper.insertPost(postVO);
			}
		}
	}

	@Override
	public List<PostVO> getPostList(String boaCode) {
		// TODO Auto-generated method stub
		return boardMapper.getPostList(boaCode);
	}

	@Override
	public List<String> getPostNum(List<BoardVO> boaList) {
		// TODO Auto-generated method stub
		List<String> postNumList = new ArrayList<String>();
		
		for (int i = 0; i < boaList.size(); i++) {
			String postNum = boardMapper.getPostNum(boaList.get(i).getBoaCode());
			
			postNumList.add(postNum);
		}
		
		return postNumList;
	}

	@Override
	public List<String> getRecDate(List<BoardVO> boaList) {
		// TODO Auto-generated method stub
		List<String> recDateList = new ArrayList<String>();
		
		for (int i = 0; i < boaList.size(); i++) {
			String recDate = boardMapper.getRecDate(boaList.get(i).getBoaCode());
			
			recDateList.add(recDate);
		}
		
		return recDateList;
	}

	@Override
	public int insertPost(PostVO postVO) {
		// TODO Auto-generated method stub
		return boardMapper.insertPost(postVO);
	}
	

	
	
	
}

class EmpPosComparator implements Comparator<EmployeeVO>{

	@Override
	public int compare(EmployeeVO vo1, EmployeeVO vo2) {
		// TODO Auto-generated method stub
		if(Utils.calPos(vo2.getEmpPos()) == Utils.calPos(vo1.getEmpPos())) {
			return vo1.getEmpName().compareTo(vo2.getEmpName());
		}else {
			return Utils.calPos(vo2.getEmpPos()) - Utils.calPos(vo1.getEmpPos());
		}
	}
	
}




