package edu.cqupt.service;

import edu.cqupt.po.introduce.Introduce;

public interface IntroduceService {
	// 添加概述
	public void addIntroduce(Introduce introduce);

	// 修改概述
	public void editIntroduce(Introduce introduce);
	//查找
	public Introduce findIntroduce();
}
