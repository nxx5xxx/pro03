package kr.go.haman.test;

public class Test02{
	private String id;
	private String pw;
	private String regdate;
	private int num;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Test01 [id=" + id + ", pw=" + pw + ", regdate=" + regdate
				+ ", num=" + num + "]";
	}
	
	
}