package edu.cqupt.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.cqupt.po.project.Image;
import edu.cqupt.po.project.Project;
import edu.cqupt.service.ProjectService;
import edu.cqupt.utils.UUIDUtils;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	@ResponseBody
	@RequestMapping("findAllProject")
	public List<Project> findAllProject() {

		return projectService.findProjectList();
	}
	@ResponseBody
	@RequestMapping("findProjectById")
	public Project findProjectById(Integer pid, Model model) {

		Project project = projectService.findProjectById(pid);
		model.addAttribute("project", project);
		return project;
		//return "jsp//news";
	}

	@RequestMapping("addProjct")
	public String addProject(Project project,
			@RequestParam("imageFiles") MultipartFile[] imageFiles,
			HttpSession session) throws IllegalStateException, IOException {

		String filePath = session.getServletContext().getRealPath("projectImage");
		List<Image> imageList = new ArrayList<Image>();

		if (imageFiles != null) {
			for (MultipartFile item : imageFiles) {
				Image image = new Image();

				String imageName = item.getOriginalFilename();
				int index = imageName.lastIndexOf(".");
				imageName = UUIDUtils.uuid() + imageName.substring(index);
				File imageFile = new File(filePath, imageName);
				item.transferTo(imageFile);
				image.setPath("projectImage" + "/" + imageName);
				imageList.add(image);
			}
			project.setTime(new Date());
			project.setImageList(imageList);
			projectService.addProject(project);

		}
		return "adminjsp//handle//admin_index";
	}

	@RequestMapping("deleteProject")
	public String deleteProject(Integer pid, HttpSession session) {

		Project project = projectService.findProjectById(pid);

		List<Image> imageList = project.getImageList();

		String imagePath = session.getServletContext().getRealPath("projectImage");
		File imageFile = null;
		if (imageList != null) {
			for (Image image : imageList) {
				String path = image.getPath();
				int index = path.lastIndexOf("/");
				path = path.substring(index);
				imageFile = new File(imagePath, path);
				if (imageFile.exists()) {
					imageFile.delete();
				}
			}
		}

		projectService.deleteProject(pid);
		return "adminjsp//handle//admin_index";
	}

}
