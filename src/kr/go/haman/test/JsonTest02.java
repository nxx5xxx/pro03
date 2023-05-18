package kr.go.haman.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.junit.Test;


@WebServlet("/JsonTest02.do")
public class JsonTest02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TestDAO testdao = new TestDAO();
	JSONObject jsonOb = new JSONObject();

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		jsonTest02(request,response);
	}
	public void jsonTest02(String id){
		Test02 test = testdao.getSelectOne(id);
		
		jsonOb.put("id",test.getId());
		jsonOb.put("pw", test.getPw());
		jsonOb.put("regdate",test.getRegdate());
		jsonOb.put("num", test.getNum());
	}
	
	public void jsonTest02(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		String id = request.getParameter("id");
		//System.out.println(id);
		Test02 test = testdao.getSelectOne(id);

		jsonOb.put("id",test.getId());
		jsonOb.put("pw", test.getPw());
		jsonOb.put("regdate",test.getRegdate());
		jsonOb.put("num", test.getNum());
		PrintWriter out = response.getWriter();
		out.println(jsonOb);
	}
	
	@Test
	public void test() {
		System.out.println("JSON Test2");
		jsonTest02("lee");
		System.out.println("아이디 : "+jsonOb.get("id"));
		System.out.println("비밀번호 : "+jsonOb.get("pw"));
		System.out.println("가입일 : "+jsonOb.get("regdate"));
		System.out.println("숫자 : "+jsonOb.get("num"));
	}
}
