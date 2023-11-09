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
 * Servlet implementation class ManagerMusicDetailController
 */
@WebServlet("/detail.mu")
public class ManagerMusicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMusicDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int musNo = Integer.parseInt(request.getParameter("mno"));
			
			MusicService mService = new MusicServiceImpl();
			
			//Music m = mService.selectMusic(musNo);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
