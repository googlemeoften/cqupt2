package edu.cqupt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cqupt.mapper.ImageMappper;
import edu.cqupt.mapper.ProjectMapper;
import edu.cqupt.po.project.Image;
import edu.cqupt.po.project.Project;
import edu.cqupt.service.ProjectService;

/**
 * <p>
 * Description:项目业务层
 * </p>
 * 
 * @author dave
 * @date 2015-9-4
 */
@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectMapper projectMapper;
	@Autowired
	private ImageMappper imageMapper;

	public Project findProjectById(Integer pid) {

		return projectMapper.findProjectById(pid);
	}

	public List<Project> findProjectList() {

		return projectMapper.findAllProject();
	}
	/**
	 * 添加项目
	 */
	public void addProject(Project project) {
		projectMapper.addProject(project);
		int pid = project.getPid();
		for (Image image : project.getImageList()) {
			image.setImage_pid(pid);
			imageMapper.addImage(image);
		}
	}

	public void deleteProject(Integer pid) {

		projectMapper.deleteProject(pid);
	}

}
