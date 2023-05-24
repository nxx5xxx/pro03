package kr.go.haman.controller.food;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.model.FoodDAO;

@WebServlet("/FoodDel.do")
public class FoodDelCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String fno = request.getParameter("fno");
		FoodDAO dao = new FoodDAO();
		int cnt = dao.deleteFood(fno);

		if(cnt>=1){
			response.sendRedirect("Food.do");
		} else { 
			response.sendRedirect("Food.do");
		}
	}
}
