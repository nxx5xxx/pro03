/*package kr.go.haman.controller.photog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Photog;
import kr.go.haman.model.PhotogDAO;


@WebServlet("/PhotoList.do")
public class PhotoList백업 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Photog> ptList = new ArrayList<>();
		PhotogDAO ptd = new PhotogDAO();
		ptList = ptd.getSelectAll();
		request.setAttribute("ptl", ptList);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub4/photog/photoList.jsp");
		view.forward(request, response);
	}

}
*/