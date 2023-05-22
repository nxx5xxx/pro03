package kr.go.haman.dto;

public class User1 {
	private	String	id;
	private	String	name;
	private	String	pw;
	private	String	addr;
	private	String	tel;
	private	String	email;
	private	String	regdate;
	@Override
	public String toString() {
		return "User1 [id=" + id + ", name=" + name + ", pw=" + pw + ", addr="
				+ addr + ", tel=" + tel + ", email=" + email + ", regdate="
				+ regdate + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	

}
