package edu.cqupt.po.project;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import edu.cqupt.convert.JsonDateSerializer;

/**
 * <p>
 * Description:团队项目
 * </p>
 * 
 * @author dave
 * @date 2015-9-3
 */
public class Project {
	private Integer pid;
	private String name;
	private String joinperson;
	private String awards;
	private String description;
	private Date time;

	@JsonSerialize(using=JsonDateSerializer.class)  
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	private List<Image> imageList;

	public Project() {
		super();
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJoinperson() {
		return joinperson;
	}

	public void setJoinperson(String joinperson) {
		this.joinperson = joinperson;
	}

	public String getAwards() {
		return awards;
	}

	public void setAwards(String awards) {
		this.awards = awards;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Image> getImageList() {
		return imageList;
	}

	public void setImageList(List<Image> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "Project [pid=" + pid + ", name=" + name + ", joinperson="
				+ joinperson + ", awards=" + awards + ", description="
				+ description + ", imageList=" + imageList + "]";
	}

}
