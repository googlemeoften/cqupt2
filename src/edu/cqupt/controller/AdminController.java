package edu.cqupt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.cqupt.exception.CquptException;
import edu.cqupt.po.admin.Admin;
import edu.cqupt.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("findAllAdmin")
	public String findAllAdmin(Model model) {

		List<Admin> adminList = adminService.findAllAdmin();
		model.addAttribute("adminList", adminList);
		return "adminjsp//handle//admin_findAdmin";
	}

	@RequestMapping("adminLogin")
	public String adminLogin(Model model, Admin form, HttpSession session) {
		try {
			Admin admin = adminService.adminLogin(form);
			session.setAttribute("session_admin", admin);
			return "adminjsp//handle//admin_index";
		} catch (CquptException e) {
			model.addAttribute("msg", e.getMessage());
			return "adminjsp//admin_login";
		}
	}

	@RequestMapping("deleteAdmin")
	public String deleteAdmin(Integer aid,Model model) {
		adminService.deleteAdmin(aid);
		
		model.addAttribute("msg", "删除成功");
		return "adminjsp/handle/admin_index";
	}

	@RequestMapping("addAdmin")
	public String addAdmin(Admin admin,Model model) {
		adminService.addAdmin(admin);
		model.addAttribute("msg", "添加成功");
		return "adminjsp/handle/admin_index";
	}
}
