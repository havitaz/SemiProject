package com.kh.playlist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.playlist.model.service.PlaylistServiceImpl;
import com.kh.playlist.model.vo.Playlist;

/**
 * Servlet implementation class PlayListInsertController
 */
@WebServlet("/insert.pl")
public class PlayListInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlayListInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 현재페이지에대한 cpage정보 int
		 * 현재 로그인한 유저의 userNo int 
		 * add아이콘을 누른 항목(노래)에대한 musNo
		 */
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int musNo = Integer.parseInt(request.getParameter("musNo"));
		
		Playlist p = new Playlist();
		p.setMemberNo(memberNo);
		p.setMusNo(musNo);
		
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		
		int result = new PlaylistServiceImpl().insertPlayList(p);
		
		if(result > 0) {
			response.sendRedirect("list.mu?cpage=" + cpage);
		} else {
			request.setAttribute("errorMsg", "재생목록에 추가 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
