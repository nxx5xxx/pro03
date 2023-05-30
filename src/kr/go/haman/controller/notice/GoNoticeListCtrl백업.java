/*package kr.go.haman.controller.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Notice;
import kr.go.haman.model.NoticeDAO;


@WebServlet("/GoNoticeList.do")
public class GoNoticeListCtrl백업 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		NoticeDAO notdao =new NoticeDAO();
		ArrayList<Notice> notList = new ArrayList<>();
		notList = notdao.getSelectAll();
		
		request.setAttribute("notList", notList );
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub1/notice/noticeList.jsp");
		view.forward(request, response);
	}

}*/
