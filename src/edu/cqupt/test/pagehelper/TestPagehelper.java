package edu.cqupt.test.pagehelper;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.cqupt.po.project.Project;
import edu.cqupt.service.ProjectService;
/***
 * 
 * <p>Description:分页测试</p>
 * @author dave
 * @date 2015-9-7
 */
public class TestPagehelper {
	private ApplicationContext applicationContext;

	@Before
	public void init() {
		applicationContext = new ClassPathXmlApplicationContext(
				"classpath:spring/applicationContext-dao.xml");
	}

	@Test
	public void testFindProjectList() {

		ProjectService projectService = (ProjectService) applicationContext
				.getBean("projectService");
		PageHelper.startPage(1,1);
		List<Project> projectList = projectService.findProjectList();
		PageInfo<Project> page = new PageInfo<Project>(projectList);
		System.out.println(page.getPageNum());//当前页号
		System.out.println(page.getTotal());//总记录数
		System.out.println(page.getPages());//总页数
		System.out.println(page.getNextPage());//下一页
		List<Project>pList=page.getList();
		for(Project p:pList){
			System.out.println(p);
		}
		
	}

}
