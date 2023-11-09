package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import com.kh.member.model.MemeberServiceImpl.MemberServiceImpl;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class SerachId
 */
@WebServlet("/searchId.me")
public class SerachIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerachIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Member m = new Member();
		m.setEmail(request.getParameter("email"));
		m.setPhone(request.getParameter("phone"));
		
		Member searchMember = new MemberServiceImpl().searchMember(m);

		if(searchMember == null) {
			
			request.setAttribute("errorMsg", "찾고자하는 회원이 없습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "환영합니다" + searchMember.getMemberId() + "님");
			request.getRequestDispatcher("WEB-INF/views/common/menubar.jsp").forward(request, response);
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
