package com.kh.common.template.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberServiceImpl;
import com.kh.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/login.me")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		if(request.getParameter("memberId").equals("admin")) {
			Member m = new Member();
			m.setMemberId(request.getParameter("memberId"));
			m.setMemberPwd(request.getParameter("memberPwd"));
			
			Member loginUser = new MemberServiceImpl().loginUser(m);
			
			if(loginUser == null) {
				request.setAttribute("errorMsg", "로그인 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(httpRequest, httpResponse);
			} else {
				request.getRequestDispatcher("/WEB-INF/views/manager/managerMusic.jsp").forward(request, response);
			}
			
		}else {
			chain.doFilter(request, response);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
