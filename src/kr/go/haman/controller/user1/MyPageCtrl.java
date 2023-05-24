package kr.go.haman.controller.user1;

import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.haman.dto.User1;
import kr.go.haman.model.User1DAO;

@WebServlet("/MyPage.do")
public class MyPageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession ses = request.getSession();
		String id = (String) ses.getAttribute("sid");
		String msg = "";
		
		User1DAO dao = new User1DAO();
		User1 user = new User1();
		
		try {
			user = dao.myPage(id);
		} catch (InvalidKeyException | NoSuchPaddingException
				| NoSuchAlgorithmException | InvalidKeySpecException
				| InvalidAlgorithmParameterException | BadPaddingException
				| IllegalBlockSizeException e) {
			e.printStackTrace();
		}
		
		if(user==null){
			ses.invalidate();
			msg = "로그인 후 이용해 주시기 바랍니다.";
			response.sendRedirect("UserLogin.do?msg="+msg);
		} else {
			msg = "내 정보 페이지를 로딩하였습니다.";
			request.setAttribute("user", user);
			request.setAttribute("msg", msg);
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/user1/mypage.jsp");
			view.forward(request, response);
		}
	}

}
