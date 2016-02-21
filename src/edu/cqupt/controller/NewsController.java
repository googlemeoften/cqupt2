package edu.cqupt.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.cqupt.po.news.News;
import edu.cqupt.service.NewsService;
import edu.cqupt.utils.UUIDUtils;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;

	@ResponseBody
	@RequestMapping("findNewsList")
	public List<News> findNewsList() {
		// PageHelper.startPage(1, 1);
		return newsService.findAllNewsList();
	}

	@ResponseBody
	@RequestMapping("newsImage")
	public String newsImage(MultipartFile fileToUpload, HttpSession session) {
		String imageName = null;
		if (fileToUpload != null) {
			imageName = fileToUpload.getOriginalFilename();
			imageName = UUIDUtils.uuid()
					+ imageName.substring(imageName.lastIndexOf("."));
			String filePath = session.getServletContext().getRealPath(
					"newsPhoto");
			File imageFile = new File(filePath, imageName);

			try {
				fileToUpload.transferTo(imageFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "newsPhoto" + "/" + imageName;
	}

	@RequestMapping("addNews")
	public String addNews(News news, HttpSession session, String content,
			Model model) {

		String contentPath = session.getServletContext().getRealPath(
				"newsContent");
		String newsPath = UUIDUtils.uuid() + ".txt";
		File file = new File(contentPath, newsPath);
		System.out.println("cinva" + file.getAbsolutePath());
		BufferedWriter bw = null;

		try {
			file.createNewFile();
			bw = new BufferedWriter(new FileWriter(file));
			bw.write(content);
			bw.flush();
			news.setPath("newsContent" + "/" + newsPath);
			news.setPublishtime(new Date());
			newsService.addNews(news);
		} catch (IOException e) {

			model.addAttribute("msg", "发布失败");
			e.printStackTrace();
		}
		model.addAttribute("msg", "发布成功");
		return "adminjsp//handle//admin_index";
	}

	@RequestMapping("deleteNews")
	public String deleteNews(Integer nid, HttpSession session, Model model) {
		News news = newsService.findNewsById(nid);
		String path = news.getPath();
		String imagePath = news.getImage();

		String newsPath = session.getServletContext()
				.getRealPath("newsContent");
		String image = session.getServletContext().getRealPath("newsPhoto");

		path = theIndex(path, "/");
		imagePath = theIndex(imagePath, "/");

		File newsFile = new File(newsPath, path);
		File imageFile = new File(image, imagePath);

		newsFile.delete();
		imageFile.delete();

		newsService.deleteNews(nid);
		model.addAttribute("msg", "删除成功");
		return "adminjsp//handle//admin_index";
	}

	@RequestMapping("findNewsById")
	public String findNewsById(HttpServletRequest request, Integer nid,
			HttpSession session) {
		News news = newsService.findNewsById(nid);
		String newsPath = news.getPath();
		String filePath = session.getServletContext()
				.getRealPath("newsContent");

		newsPath = theIndex(newsPath, "/");
		File file = new File(filePath, newsPath);

		BufferedReader br;
		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(
					file)));
			StringBuffer sb = new StringBuffer();
			String con = null;
			while ((con = br.readLine()) != null) {
				sb.append(con);
			}
			request.setAttribute("content", sb.toString());
			request.setAttribute("news", news);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "jsp//news";

	}

	// 剪切字符串
	private String theIndex(String str, String mark) {

		int index = str.lastIndexOf(mark);
		return str.substring(index + 1);
	}

}
