package edu.cqupt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cqupt.mapper.NewsMapper;
import edu.cqupt.po.news.News;
import edu.cqupt.service.NewsService;

@Service("newsService")
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsMapper newsMapper;

	public void addNews(News news) {

		newsMapper.addNews(news);
	}

	public List<News> findAllNewsList() {
		return newsMapper.findAllNewsList();
	}

	public News findNewsById(Integer nid) {

		return newsMapper.findNewsById(nid);
	}

	public void deleteNews(Integer id) {
		newsMapper.deleteNews(id);

	}

}
