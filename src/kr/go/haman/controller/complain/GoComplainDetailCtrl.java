package kr.go.haman.controller.complain;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Complain;
import kr.go.haman.model.ComplainDAO;


@WebServlet("/GoComplainDetail.do")
public class GoComplainDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cno = request.getParameter("cno");
		Complain comp = new Complain();
		ComplainDAO compdao = new ComplainDAO();
		comp = compdao.getSelectFromCno(cno);
		
		Complain reply = new Complain();
		reply = compdao.getSelectReply(cno);
		request.setAttribute("comp", comp);
		request.setAttribute("reply", reply);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub1/complain/complainDetail.jsp");
		view.forward(request, response);
	}

}
