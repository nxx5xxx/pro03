package kr.go.haman.test;

import java.util.Scanner;

public class Page {

	public static void main(String[] args) {
		//총 레코드 수(글 수)
		int allRecord;
		//총 페이지 수 (글 수의 집합이 페이지
		int allPage;
		//총 페이지 블록 수  (페이지의 집합이 블록) 
		int allPageBlock;
		//한페이지당 보여질 글 수
		int viewRecord;
		//한 블록당 보여질 페이지 수 (예 : 5라고 하면 1 2 3 4 5 다음  , 이전 6 7 8 9 10 다음)
		int viewPage;
		//현재 페이지 번호
		int nowPage;
		//현재 블록
		int nowPageBlock;
		//현재 블록 기점 시작 페이지 번호
		int startPage;
		//현재 블록 기점 마지막 페이지번호
		int nowBlockLastPage;

		
		Scanner sc = new Scanner(System.in);
		System.out.println("총 레코드(글) 수를 입력하세요");
		allRecord = sc.nextInt();
		System.out.println("한 페이지당 보여질 글 수를 입력하세요");
		viewRecord = sc.nextInt();
		System.out.println("한 블록당 보여질 페이지 수를 입력하세요");
		viewPage = sc.nextInt();
		System.out.println("현재 페이지 번호를 입력하세요");
		nowPage = sc.nextInt();
		
		
		//총 페이지수  = 총 글수 / 한페이지당 보여질 글 수  + 1
		//한페이지당 보여질 글 수의 배수일때 경우의수도 포함해야함
		allPage = allRecord / viewRecord;
		if(allRecord % viewRecord!=0){
		 allPage += 1;
		}
		//총 블록 수  = 총 페이지수 / 한 블록당 보여질 페이지 수 + 1
		//한블록당 보여질 페이지수의 배수일경우도 생각 
		allPageBlock = allPage/viewPage;
		if(allPage%viewPage!=0){
		allPageBlock += 1;
		}
		//현재 페지이 번호 기점으로 블록에 표시될 시작 페이지번호
		//int로 하니 나머지가 없는걸 염두해서 단, 블록당보여질 페이지수의 배수면 안됨
		// 시작페이지 번호 = (현재 페이지 / 한 블록당 보여질 페이지수 ) * 한블록당 보여질 페이지수  +1
		
		
		if(nowPage%viewPage==0){
			startPage = (nowPage/viewPage-1) * viewPage+1;
		}else{
			startPage = nowPage/viewPage * viewPage + 1;
		}

		// 마지막 페이지번호 = 시작페이지번호 + 한 블록당 보여질 페이지수 - 1;
		nowBlockLastPage = startPage + viewPage - 1;
		if(nowBlockLastPage>=allPage){
			nowBlockLastPage=allPage;
		}
		System.out.println("총 페이지 수는 "+allPage);
		System.out.println("총 블록 수는 "+allPageBlock);

		System.out.println("현재 블록 기점으로 시작 페이지번호는 "+startPage);
		
		System.out.println("현재 블록 기점으로 마지막 페이지 번호는 "+nowBlockLastPage);
		
		
		if(startPage==1){
			System.out.print("첫 페이지 입니다  ");
		}else{
			System.out.print("이전 ");
		}
		for(int x=startPage;x<=nowBlockLastPage;x++){
			System.out.print( x + " ");
		}
		
		if(nowBlockLastPage>=allPage){
			System.out.println(" 마지막 페이지 입니다 ");
		}else{
			System.out.println("다음");
		}
		
	}

}
