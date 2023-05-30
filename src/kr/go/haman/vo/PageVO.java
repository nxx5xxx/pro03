package kr.go.haman.vo;

public class PageVO {
	//해당 테이블 이름
	private String tbName;
	//기준 컬럼명
	private String colName;
	//현재 레코드
	private int nowRecord;
	
	//총 레코드 수(글 수)
	private int allRecord;
	//총 페이지 수 (글 수의 집합이 페이지
	private int allPage;
	//총 페이지 블록 수  (페이지의 집합이 블록) 
	private int allPageBlock;
	//한페이지당 보여질 글 수
	private int viewRecord;
	//한 블록당 보여질 페이지 수 (예 : 5라고 하면 1 2 3 4 5 다음  , 이전 6 7 8 9 10 다음)
	private int viewPage;
	//현재 페이지 번호
	private int nowPage;
	//현재 블록
	private int nowPageBlock;
	//현재 블록 기점 시작 페이지 번호
	private int startPage;
	//현재 블록 기점 마지막 페이지번호
	private int nowBlockLastPage;
	//이전 다음 없을시 X
	private String priv;
	private String next;
	
	
	public String getTbName() {
		return tbName;
	}
	public void setTbName(String tbName) {
		this.tbName = tbName;
	}
	
	public String getColName() {
		return colName;
	}
	public void setColName(String colName) {
		this.colName = colName;
	}
	
	public int getNowRecord() {
		if(nowPage!=1){
			nowRecord=(nowPage-1) * viewRecord+1;
		}else{
		nowRecord=1;
		}
		return nowRecord;
	}
	public void setNowRecord(int nowRecord) {
		//nowRecord=nowPage * viewRecord;
		this.nowRecord = nowRecord;
	}
	public int getAllRecord() {
		return allRecord;
	}
	public void setAllRecord(int allRecord) {
		this.allRecord = allRecord;
	}
	public int getAllPage() {
		allPage = allRecord / viewRecord;
		if(allRecord % viewRecord!=0){
		 allPage += 1;
		}
		return allPage;
	}
	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}
	public int getAllPageBlock() {
		allPageBlock = allPage/viewPage;
		if(allPage%viewPage!=0){
		allPageBlock += 1;
		}
		return allPageBlock;
	}
	public void setAllPageBlock(int allPageBlock) {
		this.allPageBlock = allPageBlock;
	}
	public int getViewRecord() {
		return viewRecord;
	}
	public void setViewRecord(int viewRecord) {
		this.viewRecord = viewRecord;
	}
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowPageBlock() {
		return nowPageBlock;
	}
	public void setNowPageBlock(int nowPageBlock) {
		this.nowPageBlock = nowPageBlock;
	}
	public int getStartPage() {
		if(nowPage%viewPage==0){
			startPage = (nowPage/viewPage-1) * viewPage+1;
		}else{
			startPage = nowPage/viewPage * viewPage + 1;
		}
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getNowBlockLastPage() {
		nowBlockLastPage = startPage + viewPage - 1;
		if(nowBlockLastPage>=allPage){
			nowBlockLastPage=allPage;
		}
		return nowBlockLastPage;
	}
	public void setNowBlockLastPage(int nowBlockLastPage) {
		this.nowBlockLastPage = nowBlockLastPage;
	}
	public String getPriv() {
		if(startPage==1){
			priv = " X ";
		}else{
			priv = "이전 ";
		}
		return priv;
	}
	public void setPriv(String priv) {
		this.priv = priv;
	}
	public String getNext() {
		if(nowBlockLastPage>=allPage){
			next = " X ";
		}else{
			next = "다음";
		}
		return next;
	}
	public void setNext(String next) {
		this.next = next;
	}
	
	
	
	
}
