package kr.go.haman.controller.food;

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

import kr.go.haman.dto.Food;
import kr.go.haman.model.FoodDAO;

@WebServlet("/FoodUpdatePro.do")
public class FoodUpdateProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String savePath = "/data/food/";	
		int uploadFileSizeLimit = 10 * 1024 * 1024;	
		String encType = "UTF-8";		
		ServletContext context = getServletContext();	
		String uploadFilePath = context.getRealPath(savePath);  
		
		String fileName = "";
		
		FoodDAO dao = new FoodDAO();
		Food food = new Food();
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			fileName = multi.getFilesystemName("fileSel");
			if(fileName==null){ System.out.print("첨부 파일 없음"); } 
			food.setFno(multi.getParameter("fno"));
			food.setTitle(multi.getParameter("title"));
			food.setTel(multi.getParameter("tel"));
			food.setAddr("("+multi.getParameter("postcode")+") "+multi.getParameter("address1")+", "+multi.getParameter("address2"));
		} catch (Exception e) { System.out.print("예외 발생 : " + e); }
		
		food.setFile1(fileName);
		
		int cnt = dao.updateFoodPro(food);
		if(cnt==0){ String msg = "신규 음식점이 수정되지 못했습니다."; 
			request.setAttribute("msg", msg);
			response.sendRedirect("FoodUpdate.do?fno="+food.getFno());
		} else { response.sendRedirect("Food.do"); }
	}
}
