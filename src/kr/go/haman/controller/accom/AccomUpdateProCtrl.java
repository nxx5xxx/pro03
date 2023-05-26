package kr.go.haman.controller.accom;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.go.haman.dto.Accom;
import kr.go.haman.dto.Food;
import kr.go.haman.model.AccomDAO;
import kr.go.haman.model.FoodDAO;

@WebServlet("/AccomUpdatePro.do")
public class AccomUpdateProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String savePath = "/data/accom/";	
		int uploadFileSizeLimit = 10 * 1024 * 1024;	
		String encType = "UTF-8";		
		ServletContext context = getServletContext();	
		String uploadFilePath = context.getRealPath(savePath);  
		
		String fileName = "";
		
		AccomDAO dao = new AccomDAO();
		Accom accom = new Accom();
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			fileName = multi.getFilesystemName("fileSel");
			if(fileName==null){ System.out.print("첨부 파일 없음"); } 
			accom.setAno(multi.getParameter("ano"));
			accom.setTitle(multi.getParameter("title"));
			accom.setTel(multi.getParameter("tel"));
			accom.setAddr("("+multi.getParameter("postcode")+") "+multi.getParameter("address1")+", "+multi.getParameter("address2"));
		} catch (Exception e) { System.out.print("예외 발생 : " + e); }
		
		accom.setFile1(fileName);
		
		int cnt = dao.updateAccomPro(accom);
		if(cnt==0){ String msg = "신규 숙박시설이 수정되지 못했습니다."; 
			request.setAttribute("msg", msg);
			response.sendRedirect("AccomUpdate.do?fno="+accom.getAno());
		} else { response.sendRedirect("Accom.do"); }
	}
}
