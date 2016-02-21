package edu.cqupt.service;

import java.util.List;

import edu.cqupt.po.person.Person;


public interface PersonService {
	//通过id查找
	public Person findPersonById(Integer person_id,Integer state);
	//查找所有项目
	public List<Person> findPersonList(Integer state);
	//添加项目
	public void addPerson(Person person);
	//删除项目
	public void deleteProject(Integer person_id);
}
