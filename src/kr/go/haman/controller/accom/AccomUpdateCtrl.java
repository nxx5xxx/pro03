package kr.go.haman.controller.accom;

import java.io.IOException;
import java.net.URLEncoder;
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

@WebServlet("/AccomUpdate.do")
public class AccomUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String ano = request.getParameter("ano");
		
		AccomDAO dao = new AccomDAO();
		Accom accom = new Accom();
		accom = dao.updateAccom(ano);
		
		//한글 파일 이름 인코딩 처리
		String file1 = accom.getFile1().substring(5); 
		String filepath1 = accom.getFile1().substring(0,4);
		file1 = URLEncoder.encode(file1, "UTF-8");	
		
		request.setAttribute("file1", file1);
		request.setAttribute("filepath1", filepath1);
		request.setAttribute("accom", accom);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub4/accom/accomupdate.jsp");
		view.forward(request, response);
	}

}
