package edu.cqupt.service;

import java.util.List;

import edu.cqupt.po.project.Project;

/**
 * <p>
 * Description:项目业务层
 * </p>
 * @author dave
 * @date 2015-9-3
 */
public interface ProjectService {
	//通过id查找
	public Project findProjectById(Integer pid);
	//查找所有项目
	public List<Project> findProjectList();
	//添加项目
	public void addProject(Project project);
	//删除项目
	public void deleteProject(Integer pid);
}
