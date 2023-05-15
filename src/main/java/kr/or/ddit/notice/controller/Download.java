package kr.or.ddit.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.attfile.vo.AttFileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Download extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = (Map<String, Object>) model.get("map");
		
		AttFileVO afVO = (AttFileVO) map.get("afVO");

		String uploadPath = (String) map.get("uploadPath");
		File file = new File(uploadPath+"/"+afVO.getAfSave());
		
		// "Content-Disposition", "attachment"를 붙여야 화면이동 하지 않고 다운로드 됨.
		response.setHeader("Content-Disposition", "attachment");

		OutputStream os = response.getOutputStream();
		FileUtils.copyFile(file, os);
		
	}

}
