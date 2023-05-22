package kr.go.haman.model;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import com.crypto.util.AES256;

import kr.go.haman.dto.User1;

public class User1DAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String key = "%03x";
	String qpw;
	
	//회원 전체 목록(관리자용)
	public ArrayList<User1> getUserList() throws InvalidKeyException, NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeySpecException, InvalidAlgorithmParameterException, BadPaddingException, IllegalBlockSizeException{
		ArrayList<User1> userList = new ArrayList<User1>();
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.USER1_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				User1 user = new User1();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				//비밀번호 암호화한 거 복호화해서 출력
				qpw = AES256.decryptAES256(rs.getString("pw"), key);
				int k = qpw.length(); //암호 글자수의 길이
				String vpw = qpw.substring(0, 3); //비번 3글자만 보여주기
				String hpw = "";
				for(int i=0; i<k-3; i++){ hpw+="*"; }	//3글자 외 나머지는 *로 채워서 출력
				user.setPw(vpw+hpw);
				user.setHpw(qpw);
				user.setAddr(rs.getString("addr"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setRegdate(rs.getString("regdate"));
				userList.add(user);
			}
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return userList;
	}

	//로그인
	public int loginPass(String id, String pw) throws InvalidKeyException, NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeySpecException, InvalidAlgorithmParameterException, BadPaddingException, IllegalBlockSizeException{
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.USER1_LOGIN);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				qpw = AES256.decryptAES256(rs.getString("pw"), key);
				System.out.println("비밀번호: "+qpw);
				if(pw.equals(qpw)){ cnt = 1; }
				else { cnt = 0; }
			} else { cnt = 9; }
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return cnt;
	}
	
	//아이디 중복 확인
	public int idCheck(String id){
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.USER1_LOGIN);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){ cnt = 1; }
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return cnt;
	}
	
	//마이페이지 회원 정보 보기
	public User1 myPage(String id) throws InvalidKeyException, NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeySpecException, InvalidAlgorithmParameterException, BadPaddingException, IllegalBlockSizeException{
		User1 user = new User1();
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.USER1_LOGIN);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				//비밀번호 암호화한 거 복호화해서 출력
				qpw = AES256.decryptAES256(rs.getString("pw"), key);
				int k = qpw.length(); //암호 글자수의 길이
				String vpw = qpw.substring(0, 3); //비번 3글자만 보여주기
				String hpw = "";
				for(int i=0; i<k-3; i++){ hpw+="*"; }	//3글자 외 나머지는 *로 채워서 출력
				user.setPw(vpw+hpw);
				user.setHpw(qpw);
				user.setAddr(rs.getString("addr"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setRegdate(rs.getString("regdate"));
			}
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(rs, pstmt, conn); }
		return user;
	}
	
	//비번 바꾸는 회원정보 수정
	public int updateUser1(User1 user){
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.USER1_UPDATE1);
			pstmt.setString(1, user.getPw());
			pstmt.setString(2, user.getAddr());
			pstmt.setString(3, user.getTel());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getId());
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//비번 안 바꾸는 회원정보 수정
	public int updateUser2(User1 user){
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.USER1_UPDATE2);
			pstmt.setString(1, user.getAddr());
			pstmt.setString(2, user.getTel());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getId());
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//회원가입
	public int insertUser(User1 user) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidParameterSpecException, UnsupportedEncodingException, BadPaddingException, IllegalBlockSizeException{
		int cnt = 0;
		String passwd = "";
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.USER1_INSERT);
			pstmt.setString(1, user.getId());
			passwd = AES256.encryptAES256(user.getPw(), key);
			pstmt.setString(2, passwd);
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getAddr());
			pstmt.setString(5, user.getTel());
			pstmt.setString(6, user.getEmail());
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
	
	//회원탈퇴
	public int deleteUser(String id){
		int cnt = 0;
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.USER1_DELETE);
			pstmt.setString(1, id);
			cnt = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) { e.printStackTrace();
		} catch (SQLException e) { e.printStackTrace();
		} finally { MySQL.close(pstmt, conn); }
		return cnt;
	}
}
