package edu.cqupt.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.cqupt.exception.CquptException;
import edu.cqupt.po.user.User;
import edu.cqupt.service.UserService;
import edu.cqupt.utils.UUIDUtils;
import edu.cqupt.utils.VerifyCode;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// 通过姓名查找
	@ResponseBody
	@RequestMapping("/findUserByName")
	public boolean findUserByName(String username) {
		User user = userService.findUserByProperties(username);
		if (user == null) {
			return true;
		}
		return false;
	}

	// 通过邮箱查找
	@ResponseBody
	@RequestMapping("/findByEmail")
	public boolean findByEmail(String email) {
		if (userService.findUserByProperties(email) == null)
			return true;
		return false;
	}

	// 比对验证码
	@ResponseBody
	@RequestMapping("/verifyCode")
	public boolean verifyCode(HttpSession session, String verifyText) {
		String verifyCode = (String) session.getAttribute("verifyCode");
		if (verifyCode.equalsIgnoreCase(verifyText)) {
			return true;
		}
		return false;
	}

	@RequestMapping("/regist")
	public String regist(Model model, User form) throws AddressException, MessagingException {
		String code=UUIDUtils.uuid() + UUIDUtils.uuid();
		form.setCode(code);
		form.setState(0);
		//邮件发送
		Properties properties=new Properties();
		properties.setProperty("mail.host", "smtp.163.com");
		properties.setProperty("mail.smtp.auth", "true");
		
		Authenticator auth=new Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("a1919435320","***a941213a");
			}
		};
		
		Session session=Session.getInstance(properties, auth);
		
		MimeMessage msg=new MimeMessage(session);
		msg.setFrom(new InternetAddress("a1919435320@163.com"));//发件人
		msg.setRecipients(RecipientType.TO, form.getEmail());//设置收件人
		msg.setSubject("来自信安实验室的激活邮件");
		msg.setContent("<a href='http://localhost/dave_spring/active.action?code="+code+"'>点击激活</a>", "text/html;charset=utf-8");
		
		Transport.send(msg);
		
		userService.addUser(form);
		return "index";
	}

	@RequestMapping("/active")
	public String active(Model model, String code) {
		User user = userService.findUserByProperties(code);
		if (user == null) {
			model.addAttribute("msg", "该激活码无效");
			return "jsp/active";
		} else if (user.getState() != 0) {
			model.addAttribute("msg", "该用户已经激活，请不要那么逗逼");
			return "jsp/active";
		}
		user.setUid(user.getUid());
		user.setState(1);
		userService.updateState(user);
		model.addAttribute("msg", "true");
		return "jsp/active";
	}
	@RequestMapping("/login")
	public String login(Model model, HttpSession session, User form) {

		try {
			userService.login(form);
			session.setAttribute("user", form);
			return "index";
		} catch (CquptException e) {
			model.addAttribute("msg", e.getMessage());
			return "login";
		}
	}
	@RequestMapping("/createVerifyCode")
	public void createVerifyCode(Model model, HttpServletResponse response,
			HttpSession session) {
		try {
			VerifyCode verifyCode = new VerifyCode();
			BufferedImage image = verifyCode.getImage();
			session.setAttribute("verifyCode", verifyCode.getText());
			VerifyCode.output(image, response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("findAllUser")
	public String findAllUser(Model model,HttpSession session) {
		
		List<User>userList=userService.findAllUser();
		model.addAttribute("userList", userList);
		System.out.println(userList);
		return "adminjsp//handle//admin_findUser";
	}
	
	@RequestMapping("deleteUser")
	public String deleteUser(Integer uid) {
		
		userService.deleteUser(uid);
		return "adminjsp//handle//admin_index";
	}
	
}
