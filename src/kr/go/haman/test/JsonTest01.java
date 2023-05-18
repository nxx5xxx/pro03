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


@WebServlet("/JsonTest01.do")
public class JsonTest01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	JSONObject jsonOb = new JSONObject();

	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		jsonTest01(request,response);
	}

	public void jsonTest01() throws IOException{
		String result = "서블릿을 연결하지않은 자바 앱 데이터";
		jsonOb.put("result",result);
	}
	
	public void jsonTest01(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		String result = "자바 앱 데이터";
		jsonOb.put("result",result);
		PrintWriter out = response.getWriter();
		out.println(jsonOb);
	}
	
	@Test
	public void test() throws IOException {
		System.out.println("JSON Test01");
		jsonTest01();
		System.out.println(jsonOb.get("result"));
	}
	
}
