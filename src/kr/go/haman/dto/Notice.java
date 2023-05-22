package kr.go.haman.dto;

public class Notice {
	private	String	nno;
	private	String	title;
	private	String	content;
	private	String	id;
	private	String	name;
	private	String	file1;
	private	String	file2;
	private	String	file3;
	private	String	regdate;
	private	int	views;
	@Override
	public String toString() {
		return "Notice [nno=" + nno + ", title=" + title + ", content="
				+ content + ", id=" + id + ", name=" + name + ", file1="
				+ file1 + ", file2=" + file2 + ", file3=" + file3
				+ ", regdate=" + regdate + ", views=" + views + "]";
	}
	public String getNno() {
		return nno;
	}
	public void setNno(String nno) {
		this.nno = nno;
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
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
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
	

}
