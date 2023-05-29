package kr.go.haman.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.go.haman.dto.Review;

public class ReviewDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Review selectReview(Review rv){
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.REVIEW_SELECT_FROM_ID_WNO);
			pstmt.setString(1, rv.getId());
			pstmt.setString(2, rv.getWno());
			rs = pstmt.executeQuery();
			if(rs.next()){
				rv.setRno(rs.getString("rno"));
				rv.setWno(rs.getString("wno"));
				rv.setId(rs.getString("id"));
				rv.setPoint(rs.getFloat("point"));
				rv.setContent(rs.getString("content"));
				
			}
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return rv;
	}
	
	public void insertReview(Review rv){
		int intRno = 0;
		String reviewRno="";
		int sw = 0;
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.REVIEW_SELECT_DESC_LIMIT);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//System.out.println("rno desc가 안먹음 이유?몰루");
				intRno = Integer.parseInt(rs.getString("rno"))+1;
				//System.out.println(intRno);
				reviewRno = intRno + "";
			}else{
				reviewRno = "70001";
			}
			
			pstmt = conn.prepareStatement(MySQL8.REVIEW_INSERT);
			//System.out.println("여기가 문제일지도");
			pstmt.setString(1, reviewRno);
			pstmt.setString(2, rv.getWno());
			pstmt.setString(3, rv.getId());
			pstmt.setFloat(4, rv.getPoint());
			pstmt.setString(5, rv.getContent());

			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("리뷰등록이 성공적으로 완료되었습니다");
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
	}
	
	public void updatePoint_forTable(Review rv){
		int wnosw = Integer.parseInt(rv.getWno());
		int sw = 0;
		try {
			conn = MySQL8.getConnection();
			if(wnosw>=60000 && wnosw<70000){
				//숙소테이블일경우
				pstmt = conn.prepareStatement(MySQL8.REVIEW_UPDATE_ACCOM);
				pstmt.setFloat(1, rv.getPoint());
				pstmt.setString(2, rv.getWno());
			}else if(wnosw>=50000 && wnosw<60000){
				//음식점 테이블일경우
			}
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("해당 테이블에 리뷰점수를 잘 더했습니다");
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
	}
}
