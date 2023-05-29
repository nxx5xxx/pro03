package kr.go.haman.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.haman.dto.Review;
import kr.go.haman.model.ReviewDAO;


@WebServlet("/ReviewInsert.do")
public class ReviewInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sid");
		System.out.println("리뷰넣기실행");
		Review rv = new Review();
		ReviewDAO rdao = new ReviewDAO();
		rv.setId(id);
		rv.setPoint(Float.parseFloat(request.getParameter("point")));
		rv.setWno(request.getParameter("wno"));
		rv.setContent(request.getParameter("content"));
		rdao.insertReview(rv);
		rdao.updatePoint_forTable(rv);
		
	}

}
