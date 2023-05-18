package kr.go.haman.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
//json으로 값을 제대로 넘기려면 org.json말고 net.sf.json으로 (54번째줄 참고) 즉, 내보낼때만 사용하란뜻
import org.junit.Test;

@WebServlet("/JSONTest3.do")
public class JSONTest3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String msg = "";
    JSONObject json = new JSONObject();
    JSONArray json2 = new JSONArray();
	TestDAO dao = new TestDAO();
	ArrayList<Test02> samList = new ArrayList<>();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
		
        jsonTest3(request, response);
	}
	
	public void jsonTest3() throws IOException{
		samList = dao.getSelectAll();

		for(int i=0;i<samList.size();i++){
			JSONObject obj = new JSONObject();
			Test02 sample = samList.get(i); 
			obj.put(i+"",sample);
			json2.put(obj);
		}
	}
	
	public void jsonTest3(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		ArrayList<Test02> data = dao.getSelectAll();

		PrintWriter out = response.getWriter();
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("data", data);
		
		net.sf.json.JSONObject json3 = new net.sf.json.JSONObject();
		//
		json3.putAll(map);
		out.println(json3.toString());	
	}
	
	@Test
	public void test() throws IOException {
		System.out.println("JSON Test3");
		jsonTest3();
		
		ArrayList<Test02> sList = new ArrayList<Test02>();
		for(int i=0;i<samList.size();i++){
			JSONObject obj = new JSONObject();
			obj = (JSONObject) json2.get(i);
			Test02 s = (Test02) obj.get(i+"");

			System.out.println("아이디 : "+s.getId());
			System.out.println("비밀번호 : "+s.getPw());
			System.out.println("가입일 : "+s.getRegdate());
			System.out.println("숫자 : "+s.getNum());
			sList.add(s);
		}
	}
}
