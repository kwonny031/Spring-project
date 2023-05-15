package kr.or.ddit.board.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PostVO;
import kr.or.ddit.dep.vo.DepVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	private IBoardService boardService;

	@GetMapping("/home")
	public String home(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute("SessionInfo") == null) {  
			// SessionInfo가 없으면 로그인 페이지로 이동
			return "conn/login";
		}
		
		List<BoardVO> boaList = boardService.getBoaList();
		model.addAttribute("boaList", boaList);
		
		// 게시판 이름 리스트
		List<DepVO> depList = boardService.getDepByBoaList(boaList);
		model.addAttribute("depList", depList);
		
		// 게시판 아이콘 리스트
		List<AttFileVO> afList = boardService.getAfByBoaList(boaList);
		model.addAttribute("afList", afList);
		
		// 게시판 사원 리스트.
		Map<String, Object> map = boardService.getDepEmpByBoaList(boaList);
//		Map<String, Object> depEmpList = boardService.getDepEmpByBoaList(boaList);
		model.addAttribute("depEmpList", map.get("depEmpList"));
//		for (List<EmployeeVO> list : depEmpList) {
//			log.info("depEmp sizes >> " + list.size());
//		}
		
		// 게시판 사원 프로필 리스트.
		model.addAttribute("boaAfList", map.get("boaAfList"));
		
		// 게시글 수, 최근 게시일 리스트
		List<String> postNumList = boardService.getPostNum(boaList);
		List<String> recDateList = boardService.getRecDate(boaList);
		
		log.info("post, rec >> " + postNumList+" "+recDateList);
		model.addAttribute("postNumList", postNumList);
		model.addAttribute("recDateList", recDateList);
		
		return "board/home";
	}	
	
	@GetMapping("/list")
	public String list(String boaCode, Model model) {
		// 로직 처리는 service에서. 
		
		
		BoardVO boaVO = boardService.getBoa(boaCode);
		model.addAttribute("boa", boaVO);
		
		List<PostVO> postList = boardService.getPostList(boaCode);
		
		Collections.sort(postList, new EssDateComparator());
//		log.info("postList >> " + postList);
		
		model.addAttribute("postList", postList);
		
		// essList (거래일/매출액 0729/3450000)
		List<Map<String, String>> essList = new ArrayList<Map<String,String>>();
		
		for (PostVO vo : postList) {
			Map<String, String> tempMap = new HashMap<String, String>();
			String date = vo.getPostEss().split("-")[0];
			String sales = vo.getPostEss().split("-")[1];
			String account = vo.getPostEss().split("-")[2];
			
			tempMap.put("date", date);
			tempMap.put("sales", sales);
			tempMap.put("account", account);
			essList.add(tempMap);
		}
		
		model.addAttribute("essList", essList);
		
		// postJson - 이렇게 변환하면 되네.
		Gson gson = new Gson();
		String postJson = gson.toJson(postList);
		model.addAttribute("postJson", postJson);
//		log.info("json >> " + postJson);
		
		String essJson = gson.toJson(essList);
		model.addAttribute("essJson", essJson);
		
		List<BoardVO> boaList = boardService.getBoaList();
		model.addAttribute("boaList", boaList);		
		
		List<String> postNumList = boardService.getPostNum(boaList);
		model.addAttribute("postNumList", postNumList);		
		
		return "board/list";
	}
	
	// 임시 페이지
	@GetMapping("/list2")
	public String list2(String flag, Model model) {
		
		boardService.tempData(flag);
		
		return "board/list2";
	}
	
	@PostMapping("/insertPost")
	public String insertPost(@ModelAttribute PostVO postVO, String boaCode, Model model) {
		
//		BoardVO boa = boardService.getBoa(boaCode);
		postVO.setBoaCode(boaCode);
		
		int count = boardService.insertPost(postVO);
		log.info("chk >> " + count);
		
		return "redirect:/board/list?boaCode="+boaCode+"&count="+count;
	}
	
	
	
	
}

class EssDateComparator implements Comparator<PostVO>{

	@Override
	public int compare(PostVO vo1, PostVO vo2) {
		// TODO Auto-generated method stub
		return Integer.parseInt(vo2.getPostEss().split("-")[0].replaceAll("/", "")) - Integer.parseInt(vo1.getPostEss().split("-")[0].replaceAll("/", ""));
	}
	
}




