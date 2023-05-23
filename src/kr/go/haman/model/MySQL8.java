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
	//공지사항
		final static String NOTICE_SELECT_ALL = "SELECT * FROM notice ORDER BY nno desc";
		final static String NOTICE_SELECT_ONE = "select * from notice where nno=?";
		final static String NOTICE_SELECT_DESC_LIMIT = "SELECT * FROM notice ORDER BY nno DESC LIMIT 1";
		final static String NOTICE_INSERT = "insert into notice values(?,?,?,?,?,?,?,?,default,default)";
		final static String NOTICE_UPDATE_NOFILE = "update notice set title=?,content=? where nno=?";
		final static String NOTICE_UPDATE_FILE1 = "update notice set title=?,content=?,file1=? where nno=?";
		final static String NOTICE_UPDATE_FILE2 = "update notice set title=?,content=?,file2=? where nno=?";
		final static String NOTICE_UPDATE_FILE3 = "update notice set title=?,content=?,file3=? where nno=?";
		final static String NOTICE_UPDATE_FILE1_FILE2 = "update notice set title=?,content=?,file1=?,file2=? where nno=?";
		final static String NOTICE_UPDATE_FILE1_FILE3 = "update notice set title=?,content=?,file1=?,file3=? where nno=?";
		final static String NOTICE_UPDATE_FILE2_FILE3 = "update notice set title=?,content=?,file2=?,file3=? where nno=?";
		final static String NOTICE_UPDATE_FILE1_FILE2_FILE3 = "update notice set title=?,content=?,file1=?,file2=?,file3=? where nno=?";
		final static String NOTICE_DELETE_FROM_NNO = "delete from notice where nno=?";
		
		
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
		final static String PHOTO_INSERT = "insert into notice values(?,?,?,?,?,?,?,default,default)";
		final static String PHOTO_DELETE_FROM_PNO = "delete from photog where pno=?";
		
	
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
