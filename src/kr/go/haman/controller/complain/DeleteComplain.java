package kr.go.haman.controller.complain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.model.ComplainDAO;


@WebServlet("/DeleteComplain.do")
public class DeleteComplain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cno = request.getParameter("cno");
		ComplainDAO compdao = new ComplainDAO();
		compdao.deleteComplain(cno);
		
		response.sendRedirect("GoComplainList.do");
	}

}
