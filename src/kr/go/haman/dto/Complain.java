package kr.go.haman.dto;

public class Complain {
	private	String	cno;
	private	String	title;
	private	String	content;
	private	String	id;
	private	String	name;
	private	String	company;
	private	String	addr;
	private	String	tel;
	private	String	file1;
	private	String	regdate;
	private	int	comsw;
	private String refno;
	@Override
	public String toString() {
		return "Complain [cno=" + cno + ", title=" + title + ", content="
				+ content + ", id=" + id + ", name=" + name + ", company="
				+ company + ", addr=" + addr + ", tel=" + tel + ", file1="
				+ file1 + ", regdate=" + regdate + ", comsw=" + comsw
				+ ", refno=" + refno + "]";
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
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
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getComsw() {
		return comsw;
	}
	public void setComsw(int comsw) {
		this.comsw = comsw;
	}
	public String getRefno() {
		return refno;
	}
	public void setRefno(String refno) {
		this.refno = refno;
	}
	
}
