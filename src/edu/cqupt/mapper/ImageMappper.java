package edu.cqupt.mapper;

import edu.cqupt.po.project.Image;

public interface ImageMappper {
	// 添加项目图片
	public void addImage(Image image);

	// 删除项目图片
	public void deleteImage(Integer image_pid);
}
