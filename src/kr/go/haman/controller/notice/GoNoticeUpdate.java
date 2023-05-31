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


@WebServlet("/GoNoticeUpdate.do")
public class GoNoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nno = request.getParameter("nno");

		Notice notice = new Notice();
		NoticeDAO notdao = new NoticeDAO();
		
		notice = notdao.getSelectOne(nno);
		
		if(notice.getFile1()!=null){
			if(notice.getFile1().length()>11){
				String fileName1 = notice.getFile1().substring(12);
				request.setAttribute("fileName1", fileName1);
			}
		}
		
		if(notice.getFile2()!=null){
			if(notice.getFile2().length()>11){
			String fileName2 = notice.getFile2().substring(12);
			request.setAttribute("fileName2", fileName2);
			}
		}
		
		if(notice.getFile3()!=null){
			if(notice.getFile3().length()>11){
				String fileName3 = notice.getFile3().substring(12);
				request.setAttribute("fileName3", fileName3);
			}
		}

		request.setAttribute("notice", notice);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub1/notice/noticeUpdate.jsp");
		view.forward(request, response);
	}

}
