package kr.go.haman.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.go.haman.model.MySQL8;

public class TestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	
	public ArrayList<Test02> getSelectAll(){
		ArrayList<Test02> testList = new ArrayList<>();
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM test01");
			rs = pstmt.executeQuery();
			while(rs.next()){
				Test02 test = new Test02();
/*				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("pw"));
				System.out.println(rs.getString("regdate"));
				System.out.println(rs.getInt("num"));*/
				test.setId(rs.getString("id"));
				test.setPw(rs.getString("pw"));
				test.setRegdate(rs.getString("regdate"));
				test.setNum(rs.getInt("num"));
				testList.add(test);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		MySQL8.close(rs, pstmt, conn);
		return testList;
	}
	public Test02 getSelectOne(String id){
		Test02 test = new Test02();
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement("select * from test01 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				test.setId(rs.getString("id"));
				test.setPw(rs.getString("pw"));
				test.setRegdate(rs.getString("regdate"));
				test.setNum(rs.getInt("num"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		MySQL8.close(rs, pstmt, conn);
		return test;
	}
}
