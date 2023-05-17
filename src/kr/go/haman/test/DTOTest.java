package kr.go.haman.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.go.haman.util.MySQL8;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class DTOTest {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "select * from test01";
	
	public ArrayList<Test01> getTest(){
		ArrayList<Test01> testList = new ArrayList<>();
		
		try {
			conn= MySQL8.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Test01 test = new Test01();
				test.setId(rs.getString("id"));
				test.setPw(rs.getString("pw"));
				test.setRegdate(rs.getString("regdate"));
				test.setNum(rs.getInt("num"));
				testList.add(test);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		MySQL8.close(rs, pstmt, conn);
		return testList;
	}
		
	@Before
	public void before(){
		System.out.println("---test01불러오기-----");
	}
	@Test
	public void test() {
		ArrayList<Test01> testList = new ArrayList<>();
		testList = getTest();
		for(Test01 data : testList){
			System.out.println(data.toString());
		}
	}	
	@After
	public void after(){
		System.out.println("---test01불러오기종료-----");
	}

}
class Test01{
	private String id;
	private String pw;
	private String regdate;
	private int num;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Test01 [id=" + id + ", pw=" + pw + ", regdate=" + regdate
				+ ", num=" + num + "]";
	}
	
	
}