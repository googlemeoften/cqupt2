package edu.cqupt.po.person;

public class Person {
	private Integer person_id;
	private String person_name;
	private String work;
	private String description;
	private String person_image;
	private Integer person_state;

	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public Integer getPerson_id() {
		return person_id;
	}

	public void setPerson_id(Integer person_id) {
		this.person_id = person_id;
	}

	public String getPerson_name() {
		return person_name;
	}

	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPerson_image() {
		return person_image;
	}

	public void setPerson_image(String person_image) {
		this.person_image = person_image;
	}

	public Integer getPerson_state() {
		return person_state;
	}

	public void setPerson_state(Integer person_state) {
		this.person_state = person_state;
	}

	@Override
	public String toString() {
		return "Person [person_id=" + person_id + ", person_name="
				+ person_name + ", work=" + work + ", description="
				+ description + ", person_image=" + person_image
				+ ", person_state=" + person_state + "]";
	}

}
