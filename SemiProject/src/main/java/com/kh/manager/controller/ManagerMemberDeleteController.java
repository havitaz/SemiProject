package com.kh.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberServiceImpl;

/**
 * Servlet implementation class ManagerMemberDeleteController
 */
@WebServlet("/delete.me")
public class ManagerMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			int memberNo = Integer.parseInt(request.getParameter("meno"));
			
			int result = new MemberServiceImpl().deleteMember(memberNo);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "회원이 성공적으로 강제 탈퇴되었습니다.");
				response.sendRedirect(request.getContextPath() + "/member.bt");
			} else {
				request.setAttribute("alertMsg", "회원 강제 탈퇴에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
