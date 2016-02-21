package edu.cqupt.po.news;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import edu.cqupt.convert.JsonDateSerializer;

/**
 * 新闻
 * @author Dave
 */
public class News {

	private Integer nid;
	private String title;
	private String author;
	private Date publishtime;
	private String image;
	private String path;

	public News() {
		super();
	}

	public News(Integer nid, String title, String author, Date publishtime,
			String image, String path) {
		super();
		this.nid = nid;
		this.title = title;
		this.author = author;
		this.publishtime = publishtime;
		this.image = image;
		this.path = path;
	}

	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	@JsonSerialize(using=JsonDateSerializer.class)  
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	public Date getPublishtime() {
		return publishtime;
	}

	public void setPublishtime(Date publishtime) {
		this.publishtime = publishtime;
	}

	@Override
	public String toString() {
		return "News [nid=" + nid + ", title=" + title + ", author=" + author
				+ ", publishtime=" + publishtime + ", image=" + image
				+ ", path=" + path + "]";
	}

}
