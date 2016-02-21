package edu.cqupt.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.cqupt.po.person.Person;
import edu.cqupt.service.PersonService;
import edu.cqupt.utils.UUIDUtils;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;

	@ResponseBody
	@RequestMapping("findAllStudent")
	public List<Person> findAllStudent() {

		return personService.findPersonList(1);
	}
	
	@ResponseBody
	@RequestMapping("findAllTeacher")
	public List<Person> findAllTeacher() {

		return personService.findPersonList(0);
	}

	@ResponseBody
	@RequestMapping("findTeacher")
	public Person findPersonById(Integer person_id, Model model) {

		Person person = personService.findPersonById(person_id,0);
		model.addAttribute("person", person);
		return person;
	}
	
	@ResponseBody
	@RequestMapping("findStudent")
	public Person findStudent(Integer person_id, Model model) {

		Person person = personService.findPersonById(person_id,1);
		model.addAttribute("person", person);
		return person;
	}

	@RequestMapping(value = "/addPerson", method = RequestMethod.POST)
	public String addPerson(Person person,
			@RequestParam("image") MultipartFile image, HttpSession session)
			throws IllegalStateException, IOException {

		String filePath = session.getServletContext()
				.getRealPath("personImage");
		String imageName = null;
		if (image != null) {
			imageName = image.getOriginalFilename();
			int index = imageName.lastIndexOf(".");
			imageName = UUIDUtils.uuid() + imageName.substring(index);
			File imageFile = new File(filePath, imageName);
			image.transferTo(imageFile);
		}
		person.setPerson_image("personImage" + "/" + imageName);
		personService.addPerson(person);
		
		return "adminjsp//handle//admin_index";
	}

	@RequestMapping("deletePerson")
	public String deletePerson(Integer id, HttpSession session) {
		System.out.println(id);
		Person person = personService.findPersonById(id,null);
		System.out.println(person);
		String imageFile = person.getPerson_image();
		
		String imagePath = session.getServletContext().getRealPath(
				"personImage");
		File file = null;

		int index = imageFile.lastIndexOf("/");
		imageFile = imageFile.substring(index);
		file = new File(imagePath, imageFile);
		if (file.exists()) {
			file.delete();
		}
		personService.deleteProject(id);
		return "adminjsp//handle//admin_index";
	}

}
