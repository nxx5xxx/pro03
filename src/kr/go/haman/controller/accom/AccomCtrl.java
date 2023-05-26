package kr.go.haman.controller.accom;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Accom;
import kr.go.haman.dto.Notice;
import kr.go.haman.model.AccomDAO;
import kr.go.haman.model.NoticeDAO;
import kr.go.haman.vo.PageVO;

@WebServlet("/Accom.do")
public class AccomCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		AccomDAO accomdao = new AccomDAO();
	
		NoticeDAO notdao =new NoticeDAO();
		ArrayList<Accom> accomList = new ArrayList<>();
		PageVO pvo =new PageVO();
		pvo.setNowPage(1);
		//System.out.println("나우페이지 값"+request.getParameter("nowPage"));
		if(request.getParameter("nowPage")!=null){
			 pvo.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}
		int vR = 5;
		int vP = 5;
		pvo.setViewRecord(vR);
		pvo.setViewPage(vP);
		accomList = accomdao.getSelectAllForPage(pvo);
		request.setAttribute("AccomList", accomList);
		//pvo = pagedao.getPageNum(pvo);
		pvo.getAllPage();
		pvo.getAllPageBlock();
		pvo.getStartPage();
		pvo.getNowBlockLastPage();
		pvo.getNext();
		pvo.getPriv();
		request.setAttribute("pvo", pvo);
/*		System.out.println(pvo.getAllPage());
		System.out.println(pvo.getAllPageBlock());
		System.out.println(pvo.getStartPage());
		System.out.println(pvo.getNowBlockLastPage());
		System.out.println(pvo.getNext());
		System.out.println(pvo.getPriv());*/
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub4/accom/accom.jsp");
		view.forward(request, response);
	}

}
