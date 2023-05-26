package kr.go.haman.controller.photog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Photog;
import kr.go.haman.model.PhotogDAO;
import kr.go.haman.vo.PageVO;


@WebServlet("/PhotoList.do")
public class PhotoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Photog> ptList = new ArrayList<>();
		PageVO pvo =new PageVO();
		PhotogDAO ptd = new PhotogDAO();
		pvo.setNowPage(1);
		//System.out.println("나우페이지 값"+request.getParameter("nowPage"));
		if(request.getParameter("nowPage")!=null){
			 pvo.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}
		int vR = 4;
		int vP = 5;
		pvo.setViewRecord(vR);
		pvo.setViewPage(vP);
		ptList = ptd.getSelectAllForPage(pvo);
		request.setAttribute("ptl", ptList);
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
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub4/photog/photoList.jsp");
		view.forward(request, response);
	}

}
