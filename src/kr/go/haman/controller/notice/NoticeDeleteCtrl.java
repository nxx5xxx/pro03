package kr.go.haman.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Notice;
import kr.go.haman.model.NoticeDAO;


@WebServlet("/NoticeDelete.do")
public class NoticeDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Notice notice = new Notice();
		NoticeDAO notdao = new NoticeDAO();
		
		notice.setNno(request.getParameter("nno"));
		notdao.deleteNotice(notice);
		
		response.sendRedirect("GoNoticeList.do");
	}

}
