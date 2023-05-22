package kr.go.haman.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;





import kr.go.haman.dto.Photog;

public class PhotogDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<Photog> getSelectAll(){
		ArrayList<Photog> photoList = new ArrayList<>();
		try{
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.PHOTO_SELECT_ALL);
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
	
	public Photog getSelectOne(String nno){
		Photog photo = new Photog();
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.PHOTO_SELECT_ONE);
			pstmt.setString(1, nno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				photo.setPno(rs.getString("pno"));
				photo.setTitle(rs.getString("title"));
				photo.setContent(rs.getString("content"));
				photo.setId(rs.getString("id"));
				photo.setName(rs.getString("name"));
				photo.setFile1(rs.getString("file1"));
				photo.setFile2(rs.getString("file2"));
				photo.setRegdate(rs.getString("regdate"));
				photo.setViews(rs.getInt("views"));
			}
			
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return photo;
	}
	
	public void insertPhotog(Photog photo){
		int intPno = 0;
		String photoPno="";
		int sw = 0;
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.PHOTO_SELECT_DESC_LIMIT);
			rs = pstmt.executeQuery();
			if(rs.next()){
				intPno = Integer.parseInt(rs.getString("nno"))+1;
				photoPno = intPno + "";
			}else{
				photoPno = "40001";
			}
			
			pstmt = conn.prepareStatement(MySQL8.PHOTO_INSERT);
			pstmt.setString(1, photoPno);
			pstmt.setString(2, photo.getTitle());
			pstmt.setString(3, photo.getContent());
			pstmt.setString(4, photo.getId());
			pstmt.setString(5, photo.getName());
			pstmt.setString(6, "data/photog/"+photo.getFile1());
			pstmt.setString(7, "data/photog/"+photo.getFile2());
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("포토갤러리 글 등록이 잘 되었습니다");
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
	
	public void deletePhotog(Photog photo){
		int sw = 0;
		try {
			conn = MySQL8.getConnection();
			pstmt =conn.prepareStatement(MySQL8.PHOTO_DELETE_FROM_PNO);
			pstmt.setString(1, photo.getPno());
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("포토갤러리 글 삭제가 잘 실행 되었습니다");
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
