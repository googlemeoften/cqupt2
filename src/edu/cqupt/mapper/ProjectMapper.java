package edu.cqupt.mapper;

import java.util.List;

import edu.cqupt.po.project.Project;

public interface ProjectMapper {
	
	// 查找到所有的项目
	public List<Project> findAllProject();

	// 添加项目
	public void addProject(Project project);

	// 删除项目
	public void deleteProject(Integer pid);
	
	//通过id查找
	public Project findProjectById(Integer pid);
}
