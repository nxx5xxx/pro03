package kr.go.haman.controller.accom;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Accom;
import kr.go.haman.dto.Food;
import kr.go.haman.model.AccomDAO;
import kr.go.haman.model.FoodDAO;

@WebServlet("/AccomDel.do")
public class AccomDelCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String ano = request.getParameter("ano");
		AccomDAO dao = new AccomDAO();
		int cnt = dao.deleteAccom(ano);

		if(cnt>=1){
			response.sendRedirect("Accom.do");
		} else { 
			response.sendRedirect("Accom.do");
		}
	}

}
