package com.kh.playlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	    HttpSession session = request.getSession();
	    
	    // 세션에서 memberNo를 읽어옴
	    int memberNo = (int) session.getAttribute("memberNo");
	    
	    PlaylistService plService = new PlaylistServiceImpl();
	    
	    ArrayList<Playlist> playlist = plService.selectPlaylist(memberNo);

	    session.setAttribute("playlist", playlist); 

	    request.getRequestDispatcher("WEB-INF/views/video/video.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String musName = request.getParameter("musName");
        String musArt = request.getParameter("musArt");
        String musTime = request.getParameter("musTime");
        String albumPath = request.getParameter("albumPath");

        response.getWriter().write("선택된 곡 정보: " + musName + " - " + musArt + " - " + musTime + " - " + albumPath);
	}

}
