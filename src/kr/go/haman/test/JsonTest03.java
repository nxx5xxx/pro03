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
import org.junit.Test;


@WebServlet("/JsonTest03.do")
public class JsonTest03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	JSONObject json = new JSONObject();
	JSONArray jsonArray = new JSONArray();
	TestDAO testdao = new TestDAO();
	ArrayList<Test02> testList = new ArrayList<>();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		jsonTest03(request,response);
	}
	
	public void jsonTest03(){
		testList = testdao.getSelectAll();
		for(int i=0;i<testList.size();i++){
			JSONObject obj = new JSONObject();
			Test02 test = testList.get(i);
			obj.put(i+"", test);
			jsonArray.put(obj);
			
		}
	}
	
	public void jsonTest03(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ArrayList<Test02> data = testdao.getSelectAll();
		
		PrintWriter out = response.getWriter();
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("data", data);
		
		net.sf.json.JSONObject jsonNetsf = new net.sf.json.JSONObject();
		
		jsonNetsf.putAll(map);
		out.println(jsonNetsf.toString());
	}
	
	@Test
	public void test(){
		System.out.println("JSON Test3");
		jsonTest03();
		
		ArrayList<Test02> testList2 = new ArrayList<>();
		for(int i=0;i<testList.size();i++){
			JSONObject obj = new JSONObject();
			obj = (JSONObject) jsonArray.get(i);
			Test02 test = (Test02) obj.get(i+"");
			System.out.println("아이디 : "+test.getId());
			System.out.println("비밀번호 : "+test.getPw());
			System.out.println("가입일 : "+test.getRegdate());
			System.out.println("숫자 : "+test.getNum());
			System.out.println();
			testList2.add(test);
		}
	}
}



/*json은 맵이라 json으로 받앗을때 리스트로 바꿔줘야함
리스트로 바꾸는법
//제이슨 오브젝트는 하나의 객체밖에 처리가안된다 (리스트는 여러개의 객체가 묶인것-어레이리스트)
//그래서 JSONArray라는것을 사용해야한다 
사용법 ) JSONArray json2  = new JSONArray()

//먼저 json오브젝트로 하나씩 분리한 다음 넣어주는데
// json은 맵이라서
~json2.get(i)
~obj.get(i+"");  //키값이 String이라 int를 String화 시켜줘야한다 그 과정에 i+""
ex) int a = 0 ; String b = a+"";

///////////////////////////////////
리스트를쓸려면 JSONObject를 추가할때 org말고 net으로 하는게 낫다 
//net은 데이터를 잘 전송받는 대신
//컬럼의 순서가 정확히오지않는다(set으로 생각하면된다)
//보통 바이트수가 작은것이 먼저온다 */