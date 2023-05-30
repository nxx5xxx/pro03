package kr.go.haman.controller.user1;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crypto.util.AES256;

import kr.go.haman.dto.User1;
import kr.go.haman.model.User1DAO;


@WebServlet("/UserSignUpPro.do")
public class UserSignUpProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		User1 user = new User1();
		String key = "%03x";
		
		String pw = request.getParameter("pw");
		String passwd = "";
		try { passwd = AES256.encryptAES256(pw, key); } 
			catch (InvalidKeyException | NoSuchAlgorithmException
				| InvalidKeySpecException | NoSuchPaddingException
				| InvalidParameterSpecException | BadPaddingException
				| IllegalBlockSizeException e) { e.printStackTrace(); }
		
		user.setId(request.getParameter("id"));
		user.setName(request.getParameter("name"));
		user.setPw(passwd);
		user.setAddr("("+request.getParameter("postcode")+") "+request.getParameter("address1")+", "+request.getParameter("address2"));
		user.setTel(request.getParameter("tel"));
		user.setEmail(request.getParameter("email"));
		
		User1DAO dao = new User1DAO();
		int cnt = dao.insertUser(user);
		if(cnt>=1){ response.sendRedirect("UserLogin.do"); } 
		else { response.sendRedirect("UserSignUp.do"); }
		
	}

}
