package kr.go.haman.controller.photog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.haman.dto.Photog;
import kr.go.haman.dto.User1;
import kr.go.haman.model.PhotogDAO;
import kr.go.haman.model.User1DAO;


@WebServlet("/PhotoDetail.do")
public class PhotoDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String pno = request.getParameter("pno");
		
		Photog pt = new Photog();
		PhotogDAO ptd = new PhotogDAO();
		
		pt = ptd.getSelectOne(pno);
		
		request.setAttribute("pt", pt);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub4/photog/photoDetail.jsp");
		view.forward(request, response);
		
	}

}
