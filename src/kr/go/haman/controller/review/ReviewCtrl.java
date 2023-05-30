package kr.go.haman.controller.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.haman.dto.Review;
import kr.go.haman.model.ReviewDAO;


@WebServlet("/ReviewCtrl.do")
public class ReviewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review rv =new Review();
		ReviewDAO rdao = new ReviewDAO();
		
		String wno = request.getParameter("wno");
		rv.setWno(wno);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sid");
		rv.setId(id);
		rv = rdao.selectReview(rv);
		int sw=0;
		if(rv.getRno()== null){
			//아직 별점을 안 준 게시글
			request.setAttribute("sw", sw);
			request.setAttribute("wno", wno);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/review.jsp");
			view.forward(request, response);
		}else{
			sw=1;
			request.setAttribute("sw", sw);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/review.jsp");
			view.forward(request, response);
		}
		
		
		
	}

}
