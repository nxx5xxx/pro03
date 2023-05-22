package kr.go.haman.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.haman.dto.Accom;
import kr.go.haman.dto.Food;

public class AccomDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//전체 목록
	public ArrayList<Accom> getAccomList() {
		ArrayList<Accom> accomList = new ArrayList<Accom>();
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.ACCOM_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Accom accom = new Accom();
				accom.setAno(rs.getString("ano"));
				accom.setTitle(rs.getString("title"));
				accom.setAddr(rs.getString("addr"));
				accom.setTel(rs.getString("tel"));
				accom.setFile1(rs.getString("file1"));
				accom.setRegdate(rs.getString("regdate"));
				accom.setViews(rs.getInt("views"));
				accomList.add(accom);
			}
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return accomList;
	}

	//ANO 고유번호 생성
	public String createANO(){
		String ano = "";
		try {			
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.ACCOM_ANOGENERATOR);
			rs = pstmt.executeQuery();
			if(rs.next()){
				ano = rs.getString("ano");
				int tmp = Integer.parseInt(ano)+1;
				ano = tmp + "";
			} else { ano = "60001"; }
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return ano;
	}
	
	//글 등록
	public int insertAccom(Accom accom){
		int cnt = 0;
		String ano = createANO();
		try {			
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.ACCOM_INSERT);
			pstmt.setString(1, ano);
			pstmt.setString(2, accom.getTitle());
			pstmt.setString(3, accom.getAddr());
			pstmt.setString(4, accom.getTel());
			pstmt.setString(5, accom.getFile1());
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//글 수정(수정할 정보 뿌리기)
	public Accom updateAccom(String ano){
		Accom accom = new Accom();
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.ACCOM_SELECT_ONE);
			pstmt.setString(1, ano);
			rs = pstmt.executeQuery();
			if(rs.next()){
				accom.setAno(rs.getString("ano"));
				accom.setTitle(rs.getString("title"));
				accom.setAddr(rs.getString("addr"));
				accom.setTel(rs.getString("tel"));
				accom.setFile1(rs.getString("file1"));
				accom.setRegdate(rs.getString("regdate"));
				accom.setViews(rs.getInt("views"));
			}
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return accom;
	}
	
	//글 수정(1.파일 변경 2.파일 미변경)
	public int updateAccomPro(Accom accom){
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			if(accom.getFile1()==null){
				pstmt = conn.prepareStatement(MySQL.ACCOM_UPDATE2);
				pstmt.setString(1, accom.getTitle());
				pstmt.setString(2, accom.getAddr());
				pstmt.setString(3, accom.getTel());
				pstmt.setString(4, accom.getRegdate());
				pstmt.setString(5, accom.getAno());
			} else {
				pstmt = conn.prepareStatement(MySQL.ACCOM_UPDATE1);
				pstmt.setString(1, accom.getTitle());
				pstmt.setString(2, accom.getAddr());
				pstmt.setString(3, accom.getTel());
				pstmt.setString(4, accom.getFile1());
				pstmt.setString(5, accom.getRegdate());
				pstmt.setString(6, accom.getAno());
			}
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//글 삭제
	public int deleteFood(String ano){
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.ACCOM_DELETE);
			pstmt.setString(1, ano);
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//조회수 +1
	@SuppressWarnings("unused")
	private void upReadCount(String ano) {
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.ACCOM_VIEWSUP);
			pstmt.setString(1, ano);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
	}
}
