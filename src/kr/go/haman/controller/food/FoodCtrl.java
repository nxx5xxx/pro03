package kr.go.haman.controller.food;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Food;
import kr.go.haman.dto.Notice;
import kr.go.haman.model.FoodDAO;
import kr.go.haman.model.NoticeDAO;
import kr.go.haman.vo.PageVO;

@WebServlet("/Food.do")
public class FoodCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		FoodDAO fooddao = new FoodDAO();
		ArrayList<Food> foodList = new ArrayList<Food>();
		PageVO pvo =new PageVO();
		pvo.setNowPage(1);
		if(request.getParameter("nowPage")!=null){
			 pvo.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}
		int vR = 5;
		int vP = 5;
		pvo.setViewRecord(vR);
		pvo.setViewPage(vP);
		foodList = fooddao.getSelectAllForPage(pvo);
		request.setAttribute("foodList", foodList);
		pvo.getAllPage();
		pvo.getAllPageBlock();
		pvo.getStartPage();
		pvo.getNowBlockLastPage();
		pvo.getNext();
		pvo.getPriv();
		request.setAttribute("pvo", pvo);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub4/food/food.jsp");
		view.forward(request, response);
	}

}
