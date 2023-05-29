package kr.go.haman.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQL8 {
	static String driver = "com.mysql.cj.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/haman?serverTimezone=Asia/Seoul";
	static String user = "root";
	static String pass = "1234";
	
	//유저한개 불러오기
		final static String USER1_SELECT_FROM_ID = "select * from user1 where id=?";
	//모든 상황에서 페이징 처리 가능하게끔
		final static String ALL_TABLE_PAGE = "select * from ? order by ? desc LIMIT ?,?";
		
	//페이징처리
		final static String PHOTOG_PAGE = "SELECT * FROM photog ORDER BY pno desc LIMIT ?,?";
		final static String PHOTOG_PAGE_COUNT = "select count(*) as cnt from photog";
		
		final static String NOTICE_PAGE = "SELECT * FROM notice ORDER BY nno desc LIMIT ?,?";
		final static String NOTICE_PAGE_COUNT = "select count(*) as cnt from notice";
		
		final static String ACCOM_PAGE = "SELECT * FROM accom ORDER BY ano desc LIMIT ?,?";
		final static String ACCOM_PAGE_COUNT = "select count(*) as cnt from accom";
		
		final static String FOOD_PAGE = "SELECT * FROM food ORDER BY fno desc LIMIT ?,?";
		final static String FOOD_PAGE_COUNT = "select count(*) as cnt from food";
	//리뷰
		final static String REVIEW_SELECT_FROM_ID_WNO = "select * from review where id=? and wno=?";
		final static String REVIEW_SELECT_DESC_LIMIT = "SELECT * FROM review ORDER BY rno DESC LIMIT 1";
		final static String REVIEW_INSERT = "insert into review values(?,?,?,?,?)";
	
	//숙소테이블 리뷰포인트 업데이트
		final static String REVIEW_UPDATE_ACCOM = "update accom set point=point+?,views=views+1 where ano=?";
		
		
	//공지사항
		final static String NOTICE_SELECT_ALL = "SELECT * FROM notice ORDER BY nno desc";
		final static String NOTICE_SELECT_ONE = "select * from notice where nno=?";
		final static String NOTICE_SELECT_DESC_LIMIT = "SELECT * FROM notice ORDER BY nno DESC LIMIT 1";
		final static String NOTICE_INSERT = "insert into notice values(?,?,?,?,?,?,?,?,default,default)";
		final static String NOTICE_UPDATE_NOFILE = "update notice set name=?, title=?,content=? where nno=?";
		final static String NOTICE_UPDATE_FILE1 = "update notice set name=?, title=?,content=?,file1=? where nno=?";
		final static String NOTICE_UPDATE_FILE2 = "update notice set name=?, title=?,content=?,file2=? where nno=?";
		final static String NOTICE_UPDATE_FILE3 = "update notice set name=?, title=?,content=?,file3=? where nno=?";
		final static String NOTICE_UPDATE_FILE1_FILE2 = "update notice set name=?, title=?,content=?,file1=?,file2=? where nno=?";
		final static String NOTICE_UPDATE_FILE1_FILE3 = "update notice set name=?, title=?,content=?,file1=?,file3=? where nno=?";
		final static String NOTICE_UPDATE_FILE2_FILE3 = "update notice set name=?, title=?,content=?,file2=?,file3=? where nno=?";
		final static String NOTICE_UPDATE_FILE1_FILE2_FILE3 = "update notice set name=?, title=?,content=?,file1=?,file2=?,file3=? where nno=?";
		final static String NOTICE_DELETE_FROM_NNO = "delete from notice where nno=?";
		final static String NOTICE_VIEW_PLUS = "update notice set views=views+1 where nno=?";
		
		
	//민원
		final static String COMPLAIN_SELECT_ALL = "SELECT * FROM complain where comsw=1 order by cno desc";
		final static String COMPLAIN_SELECT_ALL2 = "SELECT * FROM complain where comsw=1 or comsw=3 order by cno desc";
		final static String COMPLAIN_SELECT_DESC_LIMIT = "SELECT * FROM complain ORDER BY cno DESC LIMIT 1";
		final static String COMPLAIN_SELECT_BY_ID = "SELECT * FROM complain where id=? order by cno desc LIMIT 0,10";
		final static String COMPLAIN_SELECT_FROM_REFNO = "SELECT * FROM complain where refno=?";
		final static String COMPLAIN_SELECT_FROM_CNO = "SELECT * FROM complain where cno=?";
		final static String COMPLAIN_UPDATE_COMSW = "update complain set comsw=3 where cno=?";
		
		final static String COMPLAIN_SELECT_REPLY = "SELECT * FROM complain where refno=? and comsw=2";
		final static String COMPLAIN_INSERT = "insert into complain values(?, ?, ?,?, ?, ?,?,?,?,default,DEFAULT,?)";
		final static String COMPLAIN_INSERT_REPLY = "insert into complain values(?, ?, ?,?, ?, ?,?,?,?,default,2,?)";
		final static String COMPLAIN_DELETE = "delete from complain where refno=?";
		final static String COMPLAIN_DELETE_REPLY = "delete from complain where cno=?";
		
		
	//포토갤러리
		final static String PHOTO_SELECT_ALL = "SELECT * FROM photog ORDER BY pno desc";
		final static String PHOTO_SELECT_ONE = "select * from photog where pno=?";
		final static String PHOTO_SELECT_DESC_LIMIT = "SELECT * FROM photog ORDER BY pno DESC LIMIT 1";
		final static String PHOTO_INSERT = "insert into photog values(?,?,?,?,?,?,?,default,default)";
		final static String PHOTO_DELETE_FROM_PNO = "delete from photog where pno=?";
		final static String PHOTO_UPDATE_NOFILE = "update photog set title=?,content=? where pno=?";
		final static String PHOTO_UPDATE_FILE1 = "update photog set title=?,content=?,file1=? where pno=?";
		final static String PHOTO_UPDATE_FILE2 = "update photog set title=?,content=?,file2=? where pno=?";
		final static String PHOTO_UPDATE_FILE1_FILE2 = "update photog set title=?,content=?,file1=?,file2=? where pno=?";
		
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,user,pass);
		return conn;
	}
	
	public static void close(PreparedStatement pstmt, Connection conn){
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs,PreparedStatement pstmt, Connection conn){
		if(rs!=null){
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
