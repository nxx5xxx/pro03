package kr.go.haman.controller.photog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Photog;
import kr.go.haman.model.PhotogDAO;


@WebServlet("/GoPhotoUpdate.do")
public class GoPhotoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String pno = request.getParameter("pno");
		
		Photog pt = new Photog();
		PhotogDAO ptd = new PhotogDAO();
		

		
		pt = ptd.getSelectOne(pno);
		
		if(pt.getFile1()!=null){
			if(pt.getFile1().length()>11){
				String fileName1 = pt.getFile1().substring(12);
				request.setAttribute("fileName1", fileName1);
			}
		}
		if(pt.getFile2()!=null){
			if(pt.getFile2().length()>11){
				String fileName2 = pt.getFile2().substring(12);
				request.setAttribute("fileName2", fileName2);
			}
		}

		request.setAttribute("pt", pt);
		

		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub4/photog/photoUpdate.jsp");
		view.forward(request, response);
	}

}
