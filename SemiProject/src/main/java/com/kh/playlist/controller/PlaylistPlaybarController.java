package com.kh.playlist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/playbar.pl")
public class PlaylistPlaybarController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PlaylistPlaybarController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	

        String musName = request.getParameter("musName");
        String musArt = request.getParameter("musArt");
        String musTime = request.getParameter("musTime");
        String filePath = request.getParameter("filePath");
        String changeName = request.getParameter("changeName");

        // 콘솔에 받은 음악 정보를 출력합니다.
        System.out.println("플레이리스트 곡 정보: " + musName + " - " + musArt + " - " + musTime + " - " + filePath);

        // 클라이언트에게 필요한 경우 응답을 보낼 수 있습니다.
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write("{\"musName\": \"" + musName + "\", \"musArt\": \"" + musArt + "\", \"musTime\": \"" + musTime + "\", \"filePath\": \"" + filePath + "\"}");
    }
}
