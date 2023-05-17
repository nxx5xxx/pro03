package kr.go.haman.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.go.haman.util.MySQL8;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class DBTest {
	private Connection conn =null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "select * from test01";
	
	@Before
	public void before(){
		System.out.println("DB테스트 입니다 ");
	}
	@Test
	public void test() {
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getInt(4));
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		MySQL8.close(rs, pstmt, conn );
	}
	
	@After
	public void after(){
		System.out.println("------------------------");
	}

}
