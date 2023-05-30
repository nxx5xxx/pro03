package kr.go.haman.controller.accom;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Accom;
import kr.go.haman.model.AccomDAO;


@WebServlet("/GoAccomMap.do")
public class GoAccomMap extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String ano = request.getParameter("ano");
		Accom acom = new Accom();
		AccomDAO adao = new AccomDAO();
		
		acom = adao.updateAccom(ano);
		String addr = acom.getAddr();
		if(addr.length()>8){
		int addr2start = addr.indexOf(", ");

		addr = acom.getAddr().substring(8,addr2start);
		
		addr = addr.replace(" ", "+");
		//System.out.println(addr);
		//이거 안해주면 jsp내에서 임포트를java.net.URLEncoder해줘야합니다
		String encaddr = URLEncoder.encode(addr, "UTF-8");
		response.sendRedirect("https://www.google.co.kr/maps/dir//"+encaddr);
		}else{
			System.out.println("우편코드가 없는 주소입니다");
		}
		
		
	}

}
