package kr.or.ddit.cloud.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import kr.or.ddit.attfile.vo.AttFileVO;
import kr.or.ddit.cloud.service.ICloudService;
import kr.or.ddit.cloud.vo.CloudVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cloud")
public class CloudController {
 
	@Inject
	private ICloudService cloudService;
	
	@Resource(name="uploadPath")
	private String uploadPath;	
	
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("/home")
	public String home(int empNo, HttpServletRequest req, Model model) {
		
		// 개인 자료실 리스트
		List<CloudVO> empCloud = cloudService.empCloud(String.valueOf(empNo));
		
		// 세션확인 
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("SessionInfo"); 
		log.debug("[세션에 담긴 부서 정보] : " + empVO.getDepCode());
		
		// 여기서 부서자료실을 리스트로 리턴해서  model에 보내야하나??
		List<CloudVO> depCloud = cloudService.depCloud(empVO.getDepCode());
		
		model.addAttribute("empCloud", empCloud);
		model.addAttribute("depCloud", depCloud);
		
		log.debug("[empCloud] : "+ empCloud);
		log.debug("[depCloud] : "+ depCloud);
		log.debug("empNo : "+ empNo);
		log.debug("depNo : "+ depCloud.get(0).getDepCode());
		return "cloud/home";
	}
	
	@GetMapping("/depCloud")
	public String depCloud(@RequestParam("depCode") String depCode, Model model) {
		
		List<CloudVO> depFolderList = cloudService.depFolderList(depCode);
		
		model.addAttribute("depFolderList", depFolderList);
		log.debug("[depCode] : " + depCode);
		log.debug("[depFolderList] : " + depFolderList);
		return "cloud/depCloud";
	}
	
	@GetMapping("/myCloud")
	public String myCloud(@RequestParam("empNo") String empNo,	Model model) {
		
		List<CloudVO> empFolderList = cloudService.empFolderList(empNo);
		
		model.addAttribute("empFolderList", empFolderList);
		
		log.debug("[empNo] : " + empNo);
		log.debug("[empFolderList] : " + empFolderList);
		
		return "cloud/myCloud";
	}

	@ResponseBody
	@PostMapping(value="/createFolder", produces = "application/json;charset=utf-8")
	public String createFolder(@RequestBody CloudVO cloudVO) {
		
		if(cloudVO.getFolParcode() == "" || cloudVO.getFolParcode() == null) {	// 상위 폴더 생성 : folParcode(상위 폴더 코드)가 null
			cloudService.createParentFolder(cloudVO); 
		}else {																	// 하위 폴더 생성 : folParcode(상위 폴더 코드) 존재
			cloudService.createChildFolder(cloudVO);	
		}
		return "Success";
	}
	
	@PostMapping("/insertAf")
	public ResponseEntity<String> inseretAf(MultipartFile image, HttpServletRequest req) throws Exception, IOException{
		
		log.debug("실제 경록 확인 : " + servletContext.getRealPath("/resources/images"));
		log.debug("[넘어온 file 값 확인] : "+ image);
		log.debug("넘어온 파일명:" + image.getOriginalFilename());
		log.debug("넘어온 파일사이즈:" + image.getSize());
		
//		String uuid = UUID.randomUUID().toString();	// UUID로 임의의 파일명 생성
//		String afSave = uuid+"_"+image.getOriginalFilename();		
		String afSave = image.getOriginalFilename();		
		
		String savePath = servletContext.getRealPath("/resources/images");
		String filePath = uploadPath + "/" + afSave;
		String filePath2 = savePath + "/" + afSave;
		
		image.transferTo(new File(filePath)); // 요 한 줄로 끄읕!
		image.transferTo(new File(filePath2));
		
		String fileName = image.getOriginalFilename();
		String afName = image.getOriginalFilename();
		
		// 생성된 폴더코드 값 찾기
		String folCode = cloudService.searchFolCode(fileName);
		
		AttFileVO afVO = new AttFileVO();
		CloudVO cloudVO = new CloudVO();
		
		log.debug("[af_Tcode] : "+ folCode);
		afVO.setAfType("Folder");	
		afVO.setAfTcode(folCode);
		afVO.setAfName(afName);
		afVO.setAfSize(image.getSize());
		afVO.setAfSave(afSave);
		
		// .split(String regex) split의 매개변수는 정규식이라서 특수문자를 나타내기 위해 \\를 붙임.
		afVO.setAfExt(afName.split("\\.")[1].toUpperCase());
		
		int count = cloudService.insertAf(afVO);
		
		if (count == 1) {
//			AttFileVO profile = cloudService.getAf(afVO);
			
			return new ResponseEntity<String>("1", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("0", HttpStatus.OK);
		}
	}
	
//	@RequestMapping("/download.do")
//	public View fileDownload(String folCode,Model model) {
//		AttFileVO fileVO = cloudService.fileDownload(folCode);
//		
//		Map<String, Object> fileMap = new HashMap<String, Object>();
//		fileMap.put("fileName", fileVO.getAfName());
//		fileMap.put("fileSize", fileVO.getAfSize());
//		fileMap.put("fileSavepath", fileVO.getAfPath());
//		model.addAttribute("fileMap", fileMap);
//		
//		return new NoticeDownloadView();
//	}
}
