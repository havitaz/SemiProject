package com.kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.music.model.service.MusicService;
import com.kh.music.model.service.MusicServiceImpl;
import com.kh.music.model.vo.Music;

/**
 * Servlet implementation class ManagerSearchController
 */
@WebServlet("/search.mu")
public class ManagerSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String keyword = request.getParameter("keyword");
			
			HashMap<String, String> map = new HashMap<>();
			map.put("keyword", keyword);
			
			MusicService mService =new MusicServiceImpl();
			ArrayList<Music> list = mService.selectSearchMusic(map);
			
			request.setAttribute("list", list);
			request.setAttribute("keyword", keyword);

			request.getRequestDispatcher("WEB-INF/views/manager/managerMusic.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
