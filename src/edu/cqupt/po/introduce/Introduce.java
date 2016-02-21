package edu.cqupt.po.introduce;

public class Introduce {
	private Integer introduce_id;
	private String introduce_path;

	public Introduce() {
		super();
	}

	public Introduce(Integer introduce_id, String introduce_path) {
		super();
		this.introduce_id = introduce_id;
		this.introduce_path = introduce_path;
	}

	public Integer getIntroduce_id() {
		return introduce_id;
	}

	public void setIntroduce_id(Integer introduce_id) {
		this.introduce_id = introduce_id;
	}

	public String getIntroduce_path() {
		return introduce_path;
	}

	public void setIntroduce_path(String introduce_path) {
		this.introduce_path = introduce_path;
	}

	@Override
	public String toString() {
		return "Introduce [introduce_id=" + introduce_id + ", introduce_path="
				+ introduce_path + "]";
	}

}
