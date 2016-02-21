package edu.cqupt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cqupt.exception.CquptException;
import edu.cqupt.mapper.AdminMapper;
import edu.cqupt.po.admin.Admin;
import edu.cqupt.service.AdminService;

/**
 * <p>
 * Description:管理员业务层
 * </p>
 * 
 * @author dave
 * @date 2015-9-4
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;

	public void addAdmin(Admin admin) {

		adminMapper.addAdmin(admin);
	}

	public void deleteAdmin(Integer aid) {

		adminMapper.deleteAdmin(aid);
	}

	public List<Admin> findAllAdmin() {

		return adminMapper.findAllAdmin();
	}

	public Admin adminLogin(Admin form) throws CquptException {

		Admin admin = adminMapper.findAdminByName(form.getAdmin_name());
		if (admin == null) {
			throw new CquptException("该用户还没有分配管理员权限，请联系管理员");
		} else if (!admin.getPassword().equals(form.getPassword())) {
			throw new CquptException("用户密码错误,请检查密码");
		}
		
		return admin;
	}

}
