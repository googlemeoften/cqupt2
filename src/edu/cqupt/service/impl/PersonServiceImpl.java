package edu.cqupt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cqupt.mapper.PersonMapper;
import edu.cqupt.po.person.Person;
import edu.cqupt.service.PersonService;
/**
 * <p>Description:人物处理业务层</p>
 * @author dave
 * @date 2015-9-4
 */
@Service("personService")
public class PersonServiceImpl implements PersonService {
	@Autowired
	private PersonMapper personMapper;

	public Person findPersonById(Integer person_id,Integer state) {
		
		Person person =new Person();
		person.setPerson_state(state);
		person.setPerson_id(person_id);
		return personMapper.findPersonById(person);
	}

	public List<Person> findPersonList(Integer state) {

		return personMapper.findAllPerson(state);
	}

	public void addPerson(Person person) {

		personMapper.addPerson(person);
	}

	public void deleteProject(Integer person_id) {

		personMapper.deletePerson(person_id);
	}

	public Person findPersonById(Integer person_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
