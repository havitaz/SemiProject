package com.kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.music.model.service.MusicServiceImpl;

/**
 * Servlet implementation class ManagerDeleteController
 */
@WebServlet("/delete.mu")
public class ManagerMusicDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMusicDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			int musNo = Integer.parseInt(request.getParameter("mno"));
			
			int result =  new MusicServiceImpl().deleteMusic(musNo);

			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "노래가 성공적으로 삭제되었습니다.");
				response.sendRedirect(request.getContextPath() + "/music.bt");
			} else {
				request.setAttribute("alertMsg", "노래 삭제 실패하였습니다.");
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
