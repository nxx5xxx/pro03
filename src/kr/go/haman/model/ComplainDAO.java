package kr.go.haman.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.haman.dto.Complain;

public class ComplainDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<Complain> getSelectAll(){
		ArrayList<Complain> compList = new ArrayList<>();
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_SELECT_ALL);
			while(rs.next()){
				Complain comp = new Complain();
				comp.setCno(rs.getString("cno"));
				comp.setTitle(rs.getString("title"));
				comp.setContent(rs.getString("content"));
				comp.setId(rs.getString("id"));
				comp.setName(rs.getString("name"));
				comp.setCompany(rs.getString("company"));
				comp.setAddr(rs.getString("addr"));
				comp.setTel(rs.getString("tel"));
				comp.setFile1(rs.getString("file1"));
				comp.setRegdate(rs.getString("regdate"));
				comp.setComsw(rs.getInt("comsw"));
				comp.setRefno(rs.getString("refno"));
				compList.add(comp);
				
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return compList;
	}
	
	public ArrayList<Complain> getSelectById(String id){
		ArrayList<Complain> compList = new ArrayList<>();
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_SELECT_BY_ID);
			pstmt.setString(1, id);
			while(rs.next()){
				Complain comp = new Complain();
				comp.setCno(rs.getString("cno"));
				comp.setTitle(rs.getString("title"));
				comp.setContent(rs.getString("content"));
				comp.setId(rs.getString("id"));
				comp.setName(rs.getString("name"));
				comp.setCompany(rs.getString("company"));
				comp.setAddr(rs.getString("addr"));
				comp.setTel(rs.getString("tel"));
				comp.setFile1(rs.getString("file1"));
				comp.setRegdate(rs.getString("regdate"));
				comp.setComsw(rs.getInt("comsw"));
				comp.setRefno(rs.getString("refno"));
				compList.add(comp);
				
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return compList;
	}
	
	public ArrayList<Complain> getSelectFromRefno(String refno){
		ArrayList<Complain> compList = new ArrayList<>();
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_SELECT_FROM_REFNO);
			pstmt.setString(1, refno);
			while(rs.next()){
				Complain comp = new Complain();
				comp.setCno(rs.getString("cno"));
				comp.setTitle(rs.getString("title"));
				comp.setContent(rs.getString("content"));
				comp.setId(rs.getString("id"));
				comp.setName(rs.getString("name"));
				comp.setCompany(rs.getString("company"));
				comp.setAddr(rs.getString("addr"));
				comp.setTel(rs.getString("tel"));
				comp.setFile1(rs.getString("file1"));
				comp.setRegdate(rs.getString("regdate"));
				comp.setComsw(rs.getInt("comsw"));
				comp.setRefno(rs.getString("refno"));
				compList.add(comp);
				
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(rs, pstmt, conn);
		return compList;
	}
	
	public void insertComplain(Complain comp){
		int sw = 0;
		int intcno = 0;
		String cno = "";
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_SELECT_ALL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				intcno = Integer.parseInt(rs.getString("cno"))+1;
				cno = intcno+"";
			}else{
				cno = "30001";
			}
			
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_INSERT);
			pstmt.setString(1,cno);
			pstmt.setString(2,comp.getTitle());
			pstmt.setString(3,comp.getContent());
			pstmt.setString(4,comp.getId());
			pstmt.setString(5,comp.getName());
			pstmt.setString(6,comp.getCompany());
			pstmt.setString(7,comp.getAddr());
			pstmt.setString(8,comp.getTel());
			pstmt.setString(9,"data/complain/"+comp.getFile1());
			//pstmt.setString(1,comp.getRegdate());
			//pstmt.setString(1,comp.getComsw());
			pstmt.setString(10,cno);
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("민원이 정상적으로 등록되었습니다");
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
	
	public void deleteComplain(String cno){
		int sw=0;
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_DELETE);
			pstmt.setString(1, cno);
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("민원이 철회되었습니다");
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(pstmt, conn);
	}
	
	public void insertReply(Complain comp){
		int sw = 0;
		int intcno = 0;
		String cno = "";
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_SELECT_ALL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				intcno = Integer.parseInt(rs.getString("cno"))+1;
				cno = intcno+"";
			}else{
				cno = "30001";
			}
			
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_INSERT_REPLY);
			pstmt.setString(1,cno);
			pstmt.setString(2,comp.getTitle());
			pstmt.setString(3,comp.getContent());
			pstmt.setString(4,comp.getId());
			pstmt.setString(5,comp.getName());
			pstmt.setString(6,comp.getCompany());
			pstmt.setString(7,comp.getAddr());
			pstmt.setString(8,comp.getTel());
			pstmt.setString(9,"data/complain/"+comp.getFile1());
			//pstmt.setString(1,comp.getRegdate());
			//pstmt.setString(1,comp.getComsw());
			pstmt.setString(10,comp.getCno()); //질문에 대한comp.cno의 값 jsp에서 받아와줘야함
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("민원이 정상적으로 등록되었습니다");
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
	
	public void deleteReply(String cno){
		int sw=0;
		try {
			conn = MySQL8.getConnection();
			pstmt = conn.prepareStatement(MySQL8.COMPLAIN_DELETE_REPLY);
			pstmt.setString(1, cno);
			sw = pstmt.executeUpdate();
			if(sw>0){
				System.out.println("답변이 철회되었습니다");
			}
			
		} catch(ClassNotFoundException e) {
			System.out.println("오라클JDBC 파일이 잘못되었습니다");
		} catch(SQLException e) {
			System.out.println("SQL구문이 잘못되었습니다");
		} catch(Exception e){
			System.out.println("식별할수 없는 오류가 발생했습니다.");
		}
		MySQL8.close(pstmt, conn);
	}
}
