package kr.go.haman.controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Notice;
import kr.go.haman.model.NoticeDAO;


@WebServlet("/GoNoticeDetail.do")
public class GoNoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nno = request.getParameter("nno");

		Notice notice = new Notice();
		NoticeDAO notdao = new NoticeDAO();
		String fileName = null;
		notice = notdao.getSelectOne(nno);
		if(notice.getFile2()!=null){
			if(notice.getFile2().length()>11){
				fileName = notice.getFile2().substring(12);
				
			}
		}
		request.setAttribute("fileName", fileName);
		request.setAttribute("notice", notice);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub1/notice/noticeDetail.jsp");
		view.forward(request, response);
	}

}
