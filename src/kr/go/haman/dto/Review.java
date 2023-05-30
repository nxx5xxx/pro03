package kr.go.haman.dto;

public class Review {
	private String rno;
	private String wno;
	private String id;
	private float point;
	private String content;
	@Override
	public String toString() {
		return "Review [rno=" + rno + ", wno=" + wno + ", id=" + id
				+ ", point=" + point + ", content=" + content + "]";
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public String getWno() {
		return wno;
	}
	public void setWno(String wno) {
		this.wno = wno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public float getPoint() {
		return point;
	}
	public void setPoint(float point) {
		this.point = point;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
