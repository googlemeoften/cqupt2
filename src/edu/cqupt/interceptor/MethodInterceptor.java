package edu.cqupt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.cqupt.po.admin.Admin;

/**
 * 
 * <p>Description:拦截器，防止某些人直接访问一下方法（比如：添加操作：删除操作。。。。）</p>
 * @author dave
 * @date 2015-9-6
 */
public class MethodInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		String url = request.getRequestURI();
		if (url.contains("add") || url.contains("delete")
				|| url.contains("download")) {
			Admin admin = (Admin) request.getSession(true).getAttribute(
					"session_admin");
			System.out.println(admin);
			if (admin != null) {
				return true;
			} else {
				request.setAttribute("msg", "请登录管理员账号");
				request.getRequestDispatcher("../admin_login.jsp").forward(
						request, response);
				return false;
			}
		}

		return true;
	}

}
