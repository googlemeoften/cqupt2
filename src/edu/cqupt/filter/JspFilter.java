package edu.cqupt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.cqupt.po.admin.Admin;

/**
 * 
 * <p>Description:对jsp页面进行过滤，防止别人非法进入管理员页面</p>
 * @author dave
 * @date 2015-9-6
 */
public class JspFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String url = request.getRequestURI();
		if (url.contains("handle")) {
			Admin admin = (Admin) request.getSession(true).getAttribute(
					"session_admin");
			if (admin == null) {
				request.setAttribute("msg", "亲,你好没有登录,请登录以后进行操作");
				request.getRequestDispatcher("../admin_login.jsp")
						.forward(arg0, arg1);
				return;
			}
		}

		chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
