package kr.go.haman.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import kr.go.haman.dto.Notice;
import kr.go.haman.dto.Photog;
import kr.go.haman.vo.PageVO;


public class NoticeDAO {
	private Connection conn = null;
	private PreparedStatement pstmt =null;
	private ResultSet rs =null;
	
	public ArrayList<Notice> getSelectAllForPage(PageVO pvo){
		ArrayList<Notice> noticeList = new ArrayList<>();
		try{
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.NOTICE_PAGE);
			//System.out.println(pvo.getNowRecord());
			pstmt.setInt(1, pvo.getNowRecord()-1);
			pstmt.setInt(2, pvo.getViewRecord());
			rs = pstmt.executeQuery();
			while(rs.next()){
				Notice notice = new Notice();
				notice.setNno(rs.getString("nno"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setId(rs.getString("id"));
				notice.setName(rs.getString("name"));
				notice.setFile1(rs.getString("file1"));
				notice.setFile2(rs.getString("file2"));
				notice.setFile3(rs.getString("file3"));
				notice.setRegdate(rs.getString("regdate"));
				notice.setViews(rs.getInt("views"));
				noticeList.add(notice);
			}
			
			pvo = getPageNum(pvo);
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return noticeList;
	}
	
	public PageVO getPageNum(PageVO pvo){
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.NOTICE_PAGE_COUNT);
			rs = pstmt.executeQuery();
			if(rs.next()){
				pvo.setAllRecord(rs.getInt(1));
			}
			
			
			
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return pvo;
	}

	public ArrayList<Notice> getSelectAll(){
		ArrayList<Notice> noticeList = new ArrayList<>();
		try{
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.NOTICE_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Notice notice = new Notice();
				notice.setNno(rs.getString("nno"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setId(rs.getString("id"));
				notice.setName(rs.getString("name"));
				notice.setFile1(rs.getString("file1"));
				notice.setFile2(rs.getString("file2"));
				notice.setFile3(rs.getString("file3"));
				notice.setRegdate(rs.getString("regdate"));
				notice.setViews(rs.getInt("views"));
				noticeList.add(notice);
				
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return noticeList;
	}
	
	public Notice getSelectOne(String nno){
		Notice notice = new Notice();
		try {
			conn = MySQL8.getConnection();
			updateView(nno);
			pstmt = conn.prepareStatement(MySQL8.NOTICE_SELECT_ONE);
			pstmt.setString(1, nno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				notice.setNno(rs.getString("nno"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setId(rs.getString("id"));
				notice.setName(rs.getString("name"));
				notice.setFile1(rs.getString("file1"));
				notice.setFile2(rs.getString("file2"));
				notice.setFile3(rs.getString("file3"));
				notice.setRegdate(rs.getString("regdate"));
				notice.setViews(rs.getInt("views"));
			}
			
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return notice;
		
	}
	public void updateView(String nno){

		try {
			pstmt = conn.prepareStatement(MySQL8.NOTICE_VIEW_PLUS);
			pstmt.setString(1, nno);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("view plus의 SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("view plus의 식별할수 없는 오류가 발생했습니다.");
		}
	}
	
	public void insertNotice(Notice notice){
		int intNno = 0;
		String noticeNno="";
		int sw = 0;
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.NOTICE_SELECT_DESC_LIMIT);
			rs = pstmt.executeQuery();
			if(rs.next()){
				intNno = Integer.parseInt(rs.getString("nno"))+1;
				noticeNno = intNno + "";
			}else{
				noticeNno = "20001";
			}
			
			pstmt = conn.prepareStatement(MySQL8.NOTICE_INSERT);
			pstmt.setString(1, noticeNno);
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
			pstmt.setString(4, notice.getId());
			pstmt.setString(5, notice.getName());
			pstmt.setString(6, notice.getFile1());
			pstmt.setString(7, notice.getFile2());
			pstmt.setString(8, notice.getFile3());
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("공지사항 등록이 잘 되었습니다");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 JDBC 파일이 잘못되었습니다");
		}catch(SQLException e){
			System.out.println("SQL 구문이 잘못되었습니다");
		}catch(Exception e){
			System.out.println("식별할 수 없는 오류가 발생하였습니다");
		}
		MySQL8.close(rs, pstmt, conn);
	}
	
	public void updateNotice(Notice notice,int filesw){
		int sw = 0;
		try {
			conn = MySQL8.getConnection();
			if(filesw==100){
				pstmt = conn.prepareStatement(MySQL8.NOTICE_UPDATE_FILE1);
				pstmt.setString(4, "data/notice/"+notice.getFile1());
				pstmt.setString(5, notice.getNno());
			}else if(filesw==10){
				pstmt = conn.prepareStatement(MySQL8.NOTICE_UPDATE_FILE2);
				pstmt.setString(4, "data/notice/"+notice.getFile2());
				pstmt.setString(5, notice.getNno());
			}else if(filesw==1){
				pstmt = conn.prepareStatement(MySQL8.NOTICE_UPDATE_FILE3);
				pstmt.setString(4, "data/notice/"+notice.getFile3());
				pstmt.setString(5, notice.getNno());
			}else if(filesw==110){
				pstmt = conn.prepareStatement(MySQL8.NOTICE_UPDATE_FILE1_FILE2);
				pstmt.setString(4, "data/notice/"+notice.getFile1());
				pstmt.setString(5, "data/notice/"+notice.getFile2());
				pstmt.setString(6, notice.getNno());
			}else if(filesw==101){
				pstmt = conn.prepareStatement(MySQL8.NOTICE_UPDATE_FILE1_FILE3);
				pstmt.setString(4, "data/notice/"+notice.getFile1());
				pstmt.setString(5, "data/notice/"+notice.getFile3());
				pstmt.setString(6, notice.getNno());
			}else if(filesw==11){
				pstmt = conn.prepareStatement(MySQL8.NOTICE_UPDATE_FILE2_FILE3);
				pstmt.setString(4, "data/notice/"+notice.getFile2());
				pstmt.setString(5, "data/notice/"+notice.getFile3());
				pstmt.setString(6, notice.getNno());
			}else if(filesw==111){
				pstmt = conn.prepareStatement(MySQL8.NOTICE_UPDATE_FILE1_FILE2_FILE3);
				pstmt.setString(4, "data/notice/"+notice.getFile1());
				pstmt.setString(5, "data/notice/"+notice.getFile2());
				pstmt.setString(6, "data/notice/"+notice.getFile3());
				pstmt.setString(7, notice.getNno());
			}else{
				pstmt = conn.prepareStatement(MySQL8.NOTICE_UPDATE_NOFILE);
				pstmt.setString(4, notice.getNno());
			}
			pstmt.setString(1, notice.getName());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println(notice.getTitle()+"글이 수정되었습니다");
			}
			
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 JDBC 파일이 잘못되었습니다");
		}catch(SQLException e){
			System.out.println("SQL 구문이 잘못되었습니다");
		}catch(Exception e){
			System.out.println("식별할 수 없는 오류가 발생하였습니다");
		}
		MySQL8.close(pstmt, conn);
	}
	public void deleteNotice(Notice notice){
		int sw = 0;
		try {
			conn = MySQL8.getConnection();
			pstmt =conn.prepareStatement(MySQL8.NOTICE_DELETE_FROM_NNO);
			pstmt.setString(1, notice.getNno());
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("글 번호 : " +notice.getNno()+" 삭제가 잘 실행 되었습니다");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 JDBC 파일이 잘못되었습니다");
		}catch(SQLException e){
			System.out.println("SQL 구문이 잘못되었습니다");
		}catch(Exception e){
			System.out.println("식별할 수 없는 오류가 발생하였습니다");
		}
		MySQL8.close(pstmt, conn);
	}
}

	



/*} catch(ClassNotFoundException e) {
	System.out.println("오라클JDBC 파일이 잘못되었습니다");
} catch(SQLException e) {
	System.out.println("SQL구문이 잘못되었습니다");
} catch(Exception e){
	System.out.println("식별할수 없는 오류가 발생했습니다.");
}*/