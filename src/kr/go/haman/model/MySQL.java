package kr.go.haman.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQL {
	static String DRIVER = "com.mysql.cj.jdbc.Driver";
	static String URL = "jdbc:mysql://localhost:3306/haman?serverTimezone=Asia/Seoul";
	static String USER = "root";
	static String PASS = "1234";
	
	//회원 user1
	public final static String USER1_SELECT_ALL = "select * from user1";	//회원 전체 목록
	public static final String USER1_SELECT_FROM_ID = "select id, name, addr, tel, email, regdate from user1 where id=?";
	public final static String USER1_LOGIN = "select * from user1 where id=?";	//로그인, 마이페이지 정보 출력
	public final static String USER1_INSERT = "insert into user1 values(?,?,?,?,?,?,default)";	//회원가입
	public final static String USER1_UPDATE1 = "update user1 set pw=?, addr=?, tel=?, email=? where id=?";	//회원정보 수정 비번O
	public final static String USER1_UPDATE2 = "update user1 set addr=?, tel=?, email=? where id=?";	//회원정보 수정 비번X
	public final static String USER1_DELETE = "delete from user1 where id=?";	//회원 탈퇴
	
	//공지사항 notice
	//민원 complain
	//포토갤러리 photog
	
	//함안맛집 food
	public final static String FOOD_SELECT_ALL = "select * from food";	//전체 목록
	public final static String FOOD_SELECT_ONE = "select * from food where fno=?";	//하나의 목록
	public final static String FOOD_INSERT = "insert into food values(?,?,?,?,?,default,default)";	//등록
	public final static String FOOD_UPDATE1 = "update food set title=?, addr=?, tel=?, file1=? where fno=?";	//수정 파일O
	public final static String FOOD_UPDATE2 = "update food set title=?, addr=?, tel=? where fno=?";	//수정 파일X
	public final static String FOOD_DELETE = "delete from food where fno=?";	//회원 탈퇴
	public final static String FOOD_FNOGENERATOR = "select fno from food order by fno desc limit 1";	//FNO 생성
	public final static String FOOD_VIEWSUP = "update food set views=view+1 where fno=?";	//조회수 +1
	
	//숙박시설 accom
	public final static String ACCOM_SELECT_ALL = "select * from accom";	//전체 목록
	public final static String ACCOM_SELECT_ONE = "select * from accom where ano=?";	//하나의 목록
	public final static String ACCOM_INSERT = "insert into accom values(?,?,?,?,?,default,default)";	//등록
	public final static String ACCOM_UPDATE1 = "update accom set title=?, addr=?, tel=?, file1=? where ano=?";	//수정 파일O
	public final static String ACCOM_UPDATE2 = "update accom set title=?, addr=?, tel=? where ano=?";	//수정 파일X
	public final static String ACCOM_DELETE = "delete from accom where ano=?";	//회원 탈퇴
	public final static String ACCOM_ANOGENERATOR = "select ano from accom order by ano desc limit 1";	//FNO 생성
	public final static String ACCOM_VIEWSUP = "update accom set views=view+1 where ano=?";	//조회수 +1
	
	//Test
	public final static String MEMBER_SELECT_ALL = "select * from member";
	public final static String MEMBER_SELECT_ONE = "select * from member where id=?";
	public final static String MEMBER_INSERT = "insert into member values(?,?,?)";
	public final static String MEMBER_UPDATE = "update member set pw=? where id=?";
	public final static String MEMBER_DELETE = "delete from member where id=?";

	//DB 연결
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER);
		Connection conn = DriverManager.getConnection(URL, USER, PASS);
		return conn; }
	
	public static void close(PreparedStatement pstmt, Connection conn){
		if(pstmt!=null){
			try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if(conn!=null){
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } } }
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn){
		if(rs!=null){
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if(pstmt!=null){
			try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if(conn!=null){
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } } }
}
