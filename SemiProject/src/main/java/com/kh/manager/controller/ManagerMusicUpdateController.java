package com.kh.manager.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.template.Attachment;
import com.kh.common.template.MyFileRenamePolicy;
import com.kh.music.model.service.MusicServiceImpl;
import com.kh.music.model.vo.Music;
import com.oreilly.servlet.MultipartRequest;

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
			
			if(ServletFileUpload.isMultipartContent(request)) {
				
				int maxSize = 10 * 1024 * 1024;
				
				String savePath = request.getSession().getServletContext().getRealPath("/resources/icon/musicAlbumCover/");
				
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
			int musNo = Integer.parseInt(request.getParameter("mno"));
			String musName = multiRequest.getParameter("musName");
			String musArt = multiRequest.getParameter("musArt");
			String musGen = multiRequest.getParameter("musGen");
			String musTime = multiRequest.getParameter("musTime");
			
			Music m = new Music();
			m.setMusName(musName);
			m.setMusArt(musArt);
			m.setMusGen(musGen);
			m.setMusTime(musTime);

			Attachment at = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				//새로 넘어온 첨부파일이 있을때
				new File(savePath + multiRequest.getParameter("originName")).delete();
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/icon/musicAlbumCover/");	
		}
			
			int result =  new MusicServiceImpl().updateMusic(m, at);

			
			if(result > 0) {
				//성공 => /jsp/detail.bo?bno=해당게시글번호
				request.getSession().setAttribute("alertMsg", "성공적으로 수정하였습니다.");
				response.sendRedirect(request.getContextPath() + "/music.bt");
			} else {
				request.setAttribute("errorMsg", "게시글 수정 실패");
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
