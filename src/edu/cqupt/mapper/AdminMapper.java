package edu.cqupt.mapper;

import java.util.List;

import edu.cqupt.po.admin.Admin;

public interface AdminMapper {
	//添加管理员
	public void addAdmin(Admin admin);
	//删除管理员
	public void deleteAdmin(Integer aid);
	//查询所有管理员
	public List<Admin> findAllAdmin();
	//通过姓名查找管理员
	public Admin findAdminByName(String name);
}
