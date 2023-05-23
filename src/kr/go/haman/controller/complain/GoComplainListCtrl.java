package kr.go.haman.controller.complain;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.haman.dto.Complain;
import kr.go.haman.model.ComplainDAO;


@WebServlet("/GoComplainList.do")
public class GoComplainListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sid");
		System.out.println(id);
		ComplainDAO compdao = new ComplainDAO();
		ArrayList<Complain> compList = new ArrayList<>();
		
		
		if(id.equals("admin")){
			compList = compdao.getSelectAll2();
		}else{
		//Complain comp = new Complain();

		compList = compdao.getSelectById(id);
		}
		
		request.setAttribute("compList", compList);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub1/complain/mycomplainList.jsp");
		view.forward(request, response);
	}

}
