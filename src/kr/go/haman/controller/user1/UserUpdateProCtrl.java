package kr.go.haman.controller.user1;

import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crypto.util.AES256;

import kr.go.haman.dto.User1;
import kr.go.haman.model.User1DAO;

@WebServlet("/UserUpdatePro.do")
public class UserUpdateProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		User1 user = new User1();
		String key = "%03x";
		
		String id = request.getParameter("id");
		String hpw = request.getParameter("hpw");
		String pw = request.getParameter("pw");
		String ppw = request.getParameter("ppw");
		
		String passwd = "";
		if(ppw!=null){
			try {
				passwd = AES256.encryptAES256(ppw, key);
			} catch (InvalidKeyException | NoSuchAlgorithmException
					| InvalidKeySpecException | NoSuchPaddingException
					| InvalidParameterSpecException | BadPaddingException
					| IllegalBlockSizeException e1) {
				e1.printStackTrace(); }
			} else {
				try {
					passwd = AES256.encryptAES256(hpw, key);
			} catch (InvalidKeyException | NoSuchAlgorithmException
					| InvalidKeySpecException | NoSuchPaddingException
					| InvalidParameterSpecException | BadPaddingException
					| IllegalBlockSizeException e1) {
				e1.printStackTrace(); }
			}
		user.setId(request.getParameter("id"));
		user.setName(request.getParameter("name"));
		user.setPw(passwd);
		user.setAddr("("+request.getParameter("postcode")+") "+request.getParameter("address1")+", "+request.getParameter("address2"));
		user.setTel(request.getParameter("tel"));
		user.setEmail(request.getParameter("email"));
		
		User1DAO dao = new User1DAO();
		int cnt = 0;
		if(pw!=hpw){
			cnt = dao.updateUser1(user);
		} else {
			cnt = dao.updateUser2(user);
		}
		
		if(cnt>=1){
			response.sendRedirect("MyPage.do");
		} else {
			response.sendRedirect("UpdateUser.do?id="+id);
		}
	}
}
