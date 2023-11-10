package com.kh.playlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.playlist.model.service.PlaylistService;
import com.kh.playlist.model.service.PlaylistServiceImpl;
import com.kh.playlist.model.vo.Playlist;

/**
 * Servlet implementation class PlaylistController
 */
@WebServlet("/list.pl")
public class PlaylistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaylistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		PlaylistService plService = new PlaylistServiceImpl();
		
		ArrayList<Playlist> list = plService.selectPlaylist(memberNo);

	    request.setAttribute("list", list); 

	    request.getRequestDispatcher("WEB-INF/views/common/menubar-test.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
