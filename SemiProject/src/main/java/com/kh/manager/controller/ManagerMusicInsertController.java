package com.kh.manager.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.template.Attachment;
import com.kh.common.template.MyFileRenamePolicy;
import com.kh.music.model.service.MusicServiceImpl;
import com.kh.music.model.vo.Music;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ManagerInsertController
 */
@WebServlet("/insert.mu")
public class ManagerMusicInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMusicInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/icon/musicAlbumCover/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			String musName = multiRequest.getParameter("musName");
			String musArt = multiRequest.getParameter("musArt");
			String musGen = multiRequest.getParameter("musGen");
			String musTime = multiRequest.getParameter("musTime");
			String albumPath = multiRequest.getParameter("albumPath");
			
			Music m = new Music();
			m.setMusName(musName);
			m.setMusArt(musArt);
			m.setMusGen(musGen);
			m.setMusTime(musTime);
			m.setAlbumPath(albumPath);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/icon/musicAlbumCover/");
			}
			
			
			int result = new MusicServiceImpl().insertMusic(m, at);
			
			if (result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "노래 추가 완료");
				
				request.getRequestDispatcher("WEB-INF/views/manager/managerMusic.jsp").forward(request, response);
			} else {
				
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "노래 추가 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
