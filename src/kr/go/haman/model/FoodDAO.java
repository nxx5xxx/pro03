package kr.go.haman.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.haman.dto.Food;

public class FoodDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//전체 목록
	public ArrayList<Food> getFoodList() {
		ArrayList<Food> foodList = new ArrayList<Food>();
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.FOOD_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Food food = new Food();
				food.setFno(rs.getString("fno"));
				food.setTitle(rs.getString("title"));
				food.setAddr(rs.getString("addr"));
				food.setTel(rs.getString("tel"));
				food.setFile1(rs.getString("file1"));
				food.setRegdate(rs.getString("regdate"));
				food.setViews(rs.getInt("views"));
				foodList.add(food);
			}
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return foodList;
	}

	//FNO 고유번호 생성
	public String createFNO(){
		String fno = "";
		try {			
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.FOOD_FNOGENERATOR);
			rs = pstmt.executeQuery();
			if(rs.next()){
				fno = rs.getString("fno");
				int tmp = Integer.parseInt(fno)+1;
				fno = tmp + "";
			} else { fno = "50001"; }
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return fno;
	}
	
	//글 등록
	public int insertFood(Food food){
		int cnt = 0;
		String fno = createFNO();
		try {			
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.FOOD_INSERT);
			pstmt.setString(1, fno);
			pstmt.setString(2, food.getTitle());
			pstmt.setString(3, food.getAddr());
			pstmt.setString(4, food.getTel());
			pstmt.setString(5, food.getFile1());
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//글 수정(수정할 정보 뿌리기)
	public Food updateFood(String fno){
		Food food = new Food();
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.FOOD_SELECT_ONE);
			pstmt.setString(1, fno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				food.setFno(rs.getString("fno"));
				food.setTitle(rs.getString("title"));
				food.setAddr(rs.getString("addr"));
				food.setTel(rs.getString("tel"));
				food.setFile1(rs.getString("file1"));
				food.setRegdate(rs.getString("regdate"));
				food.setViews(rs.getInt("views"));
			}
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return food;
	}
	
	//글 수정(1.파일 변경 2.파일 미변경)
	public int updateFoodPro(Food food){
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			if(food.getFile1()==null){
				pstmt = conn.prepareStatement(MySQL.FOOD_UPDATE2);
				pstmt.setString(1, food.getTitle());
				pstmt.setString(2, food.getAddr());
				pstmt.setString(3, food.getTel());
				pstmt.setString(4, food.getRegdate());
				pstmt.setString(5, food.getFno());
			} else {
				pstmt = conn.prepareStatement(MySQL.FOOD_UPDATE1);
				pstmt.setString(1, food.getTitle());
				pstmt.setString(2, food.getAddr());
				pstmt.setString(3, food.getTel());
				pstmt.setString(4, food.getFile1());
				pstmt.setString(5, food.getRegdate());
				pstmt.setString(6, food.getFno());
			}
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//글 삭제
	public int deleteFood(String fno){
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.FOOD_DELETE);
			pstmt.setString(1, fno);
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//조회수 +1
	@SuppressWarnings("unused")
	private void upReadCount(String fno) {
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.FOOD_VIEWSUP);
			pstmt.setString(1, fno);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
	}
}
