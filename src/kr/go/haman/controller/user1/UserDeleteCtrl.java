package kr.go.haman.controller.user1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.haman.model.User1DAO;

@WebServlet("/UserDelete.do")
public class UserDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		User1DAO dao = new User1DAO();
		int cnt = dao.deleteUser(id);
		
		HttpSession ses = request.getSession();
		if(cnt>=1){
			ses.invalidate();
			response.sendRedirect(request.getContextPath());
		} else {
			ses.invalidate();
			response.sendRedirect("UserLogin.do");
		}
	}

}
