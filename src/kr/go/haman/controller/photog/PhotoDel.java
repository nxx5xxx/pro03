package kr.go.haman.controller.photog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Photog;
import kr.go.haman.model.PhotogDAO;


@WebServlet("/PhotoDel.do")
public class PhotoDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Photog pt = new Photog();
		pt.setPno(request.getParameter("pno"));
		PhotogDAO ptd = new PhotogDAO();
		
		ptd.deletePhotog(pt);
		
		response.sendRedirect("PhotoList.do");
	}

}
