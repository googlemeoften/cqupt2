package edu.cqupt.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.xmlbeans.XmlException;

@Controller
public class IntroduceController {

	@RequestMapping("addIntroduce")
	public String addIntroduce(MultipartFile upload, HttpSession session,Model model)
			throws IllegalStateException, IOException {
		
		String fileName = upload.getOriginalFilename();
		if (!fileName.isEmpty()||fileName.trim()!="") {
			int index = fileName.lastIndexOf(".");
			fileName = fileName.substring(index);
			fileName = "introduce" + fileName;
			String filePath = session.getServletContext().getRealPath(
					"introduce");
			File file = new File(filePath, fileName);
			if(file.exists()){
				file.delete();
			}
			upload.transferTo(file);
			
		}else{
			
			model.addAttribute("msg", "上传数据不能为空");
		}
		return "adminjsp//handle//admin_index";
	}

	@RequestMapping("downloadIntroduce")
	public void downloadIntroduce(HttpServletResponse response,
			HttpSession session) throws FileNotFoundException, IOException {

		String filepath = session.getServletContext().getRealPath("introduce")+"/"+"introduce.docx";
		File file = new File(filepath);
		response.addHeader("content-disposition", "attachment;filename="
				+ "introduce.docx");
		IOUtils.copy(new FileInputStream(file), response.getOutputStream());
	}

	@RequestMapping("findIntroduce")
	public void findIntroduce(HttpSession session, HttpServletResponse response)
			throws IOException, XmlException, OpenXML4JException {
		response.setContentType("text/html; charset=UTF-8");

		String introduceFile = session.getServletContext().getRealPath(
				"introduce");
		File introduce = new File(introduceFile, "introduce.docx");

		if (!introduce.exists()) {
			introduce.createNewFile();
		}

		InputStream is = new FileInputStream(introduce);
		XWPFDocument doc = new XWPFDocument(is);

		Iterator<XWPFParagraph> iter = doc.getParagraphsIterator();
		StringBuffer sb = new StringBuffer();
		while (iter.hasNext()) {
			XWPFParagraph paragraph = iter.next();

			sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+paragraph.getText() + "<br/>");
		}

		response.getWriter().print(sb.toString());

	}

}
