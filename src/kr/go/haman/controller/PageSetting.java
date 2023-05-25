package kr.go.haman.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Photog;
import kr.go.haman.model.PageDAO;
import kr.go.haman.vo.PageVO;


@WebServlet("/GoPageSetting.do")
public class PageSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PageDAO서부터 해도되고 여기서부터 해도되는데 위에서부터 순서대로 해야해요
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//이부분부터 만아래 !!!라고 써있는 주석까지 복사해서 해당 게시글에 붙여넣고 수정할거 수정해서 쓰면돼요
		
		
		ArrayList<String> testList = new ArrayList<>(); //4. 원래쓰던 리스트를 이곳에 넣으면돼요
		
		
		PageVO pvo =new PageVO();
		PageDAO pagedao = new PageDAO();
		pvo.setNowPage(1);
		if(request.getParameter("nowPage")!=null){
			 pvo.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}
		//5. 한 페이지당 보여질 글 수를 적어주세요 (예 : 현재 보는 화면에 보이는 게시글의 총 개수 (예: 10을 적으면 한페이지에 10개가 보이고 다음페이지를 눌러야 또 10개가 보인다)
		int vR = 10;
		//6. 한 블록당 보여질 페이지의 수를 적어주세요 (예 :5개면  1 2 3 4 5 다음 , 3개면 1 2 3 다음 이전 4 5 6 )
		int vP = 5;
		//7. 여기에 테이블명이랑 컬럼명 적으면 PageDAO에서 pstmt.setString 안건드려도돼요
		pvo.setTbName("테이블 명 적어주세요");
		pvo.setColName("컬럼명 적어주세요");
		
		pvo.setViewRecord(vR);
		pvo.setViewPage(vP);
		testList = pagedao.getGood(pvo);
		
		//8. jsp에서 쓰일 리스트이름을 적어주세요 
		request.setAttribute("testList", testList);
		
		pvo.getAllPage();
		pvo.getAllPageBlock();
		pvo.getStartPage();
		pvo.getNowBlockLastPage();
		pvo.getNext();
		pvo.getPriv();
		request.setAttribute("pvo", pvo);
		
	}

}
