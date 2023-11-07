package com.kh.music.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.template.Pagenation;
import com.kh.music.model.service.MusicServiceImpl;
import com.kh.music.model.vo.Music;

/**
 * Servlet implementation class MusicListController
 */
@WebServlet("/list.mu")
public class MusicListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//-----페이징처리-----
		int listCount = new MusicServiceImpl().selectListCount();
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Music> list = new MusicServiceImpl().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("WEB-INF/views/musicList/TOP100.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
