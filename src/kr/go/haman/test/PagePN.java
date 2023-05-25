package kr.go.haman.test;

import java.util.Scanner;

import org.junit.Test;

public class PagePN {
	int allRecord = 26; //모든레코드수
	//한 페이지당 보이게 할 레코드
	int viewRecord = 4;
	//총 페이지수
	int allPage = allRecord/viewRecord + 1 ;
	//몇 페이지씩 보여주게 할지 (예 1~5까지 또는 1~10까지)
	int allPageDivide = 5;
	//눈에 보일 페이지그룹수
	int viewPageGroup = allPage/allPageDivide;
	//남은 페이지 수
	int pageRem = allPage%allPageDivide;
	
	Scanner sc = new Scanner(System.in);
	@Test
	public void test() {
		System.out.println("총 레코드 수를 입력하세요");
		int aR = sc.nextInt();
		System.out.println("한 페이지당 보이게 할 레코드 수를 입력하세요");
		int vR = sc.nextInt();
		System.out.println("몇 페이지씩 보여줄지 입력하세요");
		int aPD = sc.nextInt();
		System.out.println("현재 페이지 번호를 입력하세요");
		int nP = sc.nextInt();
		
		int aP = aR/vR+1;
		int vPG = aP/aPD;
		//int pR = aP%aPD;
		int pB = aP/aPD +1;
		int nB = nP/vR + 1;
		int nPS = (nB-1)*vR+1;
		System.out.println("총 페이지수"+aP);
		System.out.println("총 페이지 블록수"+pB);
		System.out.println("눈에 보일 페이지 그룹수"+vPG);
		//System.out.println("마지막 페이지번호"+pR);
		System.out.println("현재 블록 수" +nB);
		System.out.println("현재 페이지의 시작번호"+nPS);
		
	}

}
/*페이징처리

1.
모든 레코드를 불러와 번호를 매김

그 컬럼들을 한페이지당 불러올 셀 숫자로 나눔

예 : 한페이지에 4칸을 보이게 하려면

26개의 레코드를 불러왔다면
26/4 = 6 나머지 2

6 + 1 해서 총 7개의 페이지

페이지를 몇개씩 보여줄지 결정함

예: 5개씩

7/5 = 다음페이지 1개. 자바로 ㄱ*/