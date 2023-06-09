package kr.go.haman.dto;

public class Food {
	private	String	fno;
	private	String	title;
	private	String	addr;
	private	String	tel;
	private	String	file1;
	private	String	regdate;
	private	int	views;
	private float point;
	
	@Override
	public String toString() {
		return "Food [fno=" + fno + ", title=" + title + ", addr=" + addr
				+ ", tel=" + tel + ", file1=" + file1 + ", regdate=" + regdate
				+ ", views=" + views + ", point=" + point + "]";
	}
	public String getFno() {
		return fno;
	}
	public void setFno(String fno) {
		this.fno = fno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public float getPoint() {
		return point;
	}
	public void setPoint(float point) {
		this.point = point;
	}
	

}
