package com.kh.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.music.model.service.MusicService;
import com.kh.music.model.service.MusicServiceImpl;
import com.kh.music.model.vo.Music;

/**
 * Servlet implementation class ManagerUpdateController
 */
@WebServlet("/update.mu")
public class ManagerMusicUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMusicUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			int musNo = Integer.parseInt(request.getParameter("mno"));
			String musName = request.getParameter("musName");
			String musArt = request.getParameter("musArt");
			String musGen = request.getParameter("musGen");
			
			
			Music m = new Music(musNo, musName, musArt, musGen);
			System.out.println(m);
			
			int result =  new MusicServiceImpl().updateMusic(m);
			System.out.println(result);

			request.setAttribute("alertMsge", "성공적으로 수정");
			response.sendRedirect(request.getContextPath() + "/music.bt");
			

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
