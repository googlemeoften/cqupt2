package edu.cqupt.mapper;

import edu.cqupt.po.introduce.Introduce;

public interface IntroduceMapper {
	// 添加介绍信息
	public void addIntroduce(Introduce introduce);

	// 修改介绍信息
	public void updateIntroduce(Introduce introduce);

	// 查找介绍
	public Introduce findIntroduce();

}
