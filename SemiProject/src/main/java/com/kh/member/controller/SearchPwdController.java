package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberServiceImpl;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class SearchPwdController
 */
@WebServlet("/searchPwd.me")
public class SearchPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Member m = new Member();
		m.setMemberId(request.getParameter("memberId"));
		m.setEmail(request.getParameter("email"));
		m.setPhone(request.getParameter("phone"));
		
		Member searchMemberPwd = new MemberServiceImpl().searchMemberPwd(m);
		
		if(searchMemberPwd == null) {
			
			request.setAttribute("errorMsg", "찾고자하는 회원이 없습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
	         session.setAttribute("alertMsg", "회원님의 비밀번호는 {" + searchMemberPwd.getMemberPwd() + "} 입니다.");
	         request.getRequestDispatcher("WEB-INF/views/video/video.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
