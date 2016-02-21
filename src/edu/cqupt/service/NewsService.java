package edu.cqupt.service;

import java.util.List;

import edu.cqupt.po.news.News;

public interface NewsService {
	//添加新闻
		public void addNews(News news);
		//查询新闻列表
		public List<News> findAllNewsList();
		//通过新闻id查找新闻
		public News findNewsById(Integer nid);
		//删除新闻
		public void deleteNews(Integer nid);
}
