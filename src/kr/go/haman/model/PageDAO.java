package kr.go.haman.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.haman.dto.Photog;
import kr.go.haman.vo.PageVO;

public class PageDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//테스트중
	//사용법 1. 여기 배열에 원래 리스트 불러오던 값을 넣어줘요
	//예 ) public ArrayList<Notice> ~~~
	// ArrayList<Notice> notiList = new ~~~~~
	public ArrayList<String> getGood(PageVO pvo){
		ArrayList<String> arrList = new ArrayList<>();
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.ALL_TABLE_PAGE);
			pstmt.setString(1, pvo.getTbName());//이곳에 테이블명
			pstmt.setString(2, pvo.getColName());//이곳에 컬럼명 > 두개 다 PageSetting에서 설정했다면 안해도 돼요
			pstmt.setInt(3, pvo.getNowRecord()-1);
			pstmt.setInt(4, pvo.getViewRecord());
			rs = pstmt.executeQuery();
			while(rs.next()){
				//2,이곳에 원래 받아오던 dto명들을 넣어야해요
			}
			//3 페이지셋팅.java로 가서 이어설명
			
			
			pvo = getPageNum(pvo);
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return arrList;
	}
	
	public PageVO getPageNum(PageVO pvo){
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.PHOTOG_PAGE_COUNT);
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
	
	
	//photog 갖고오기
	public ArrayList<Photog> getSelectAll(PageVO pvo){
		ArrayList<Photog> photoList = new ArrayList<>();
		try{
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.PHOTOG_PAGE);
			//System.out.println(pvo.getNowRecord());
			pstmt.setInt(1, pvo.getNowRecord()-1);
			pstmt.setInt(2, pvo.getViewRecord());
			rs = pstmt.executeQuery();
			while(rs.next()){
				Photog photo = new Photog();
				photo.setPno(rs.getString("pno"));
				photo.setTitle(rs.getString("title"));
				photo.setContent(rs.getString("content"));
				photo.setId(rs.getString("id"));
				photo.setName(rs.getString("name"));
				photo.setFile1(rs.getString("file1"));
				photo.setFile2(rs.getString("file2"));
				photo.setRegdate(rs.getString("regdate"));
				photo.setViews(rs.getInt("views"));
				photoList.add(photo);
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
		return photoList;
	}
}
