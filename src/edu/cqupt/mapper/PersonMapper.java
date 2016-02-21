package edu.cqupt.mapper;

import java.util.List;

import edu.cqupt.po.person.Person;

public interface PersonMapper {
	//添加人物
	public void addPerson(Person person);
	//删除人物
	public void deletePerson(Integer id);
	//修改人物
	public void editPerson(Person person);
	//查找所有人物
	public List<Person> findAllPerson(Integer state);
	//通过Id查找人物
	public Person findPersonById(Person person);
}
