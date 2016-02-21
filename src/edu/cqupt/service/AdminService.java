package edu.cqupt.service;

import java.util.List;

import edu.cqupt.exception.CquptException;
import edu.cqupt.po.admin.Admin;

public interface AdminService {
	//添加管理员
		public void addAdmin(Admin admin);
		//删除管理员
		public void deleteAdmin(Integer aid);
		//查询所有管理员
		public List<Admin> findAllAdmin();
		//管理员登录
		public Admin adminLogin(Admin form) throws CquptException;
}
