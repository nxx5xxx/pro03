package kr.go.haman.test;


import java.util.Scanner;

import kr.go.haman.util.AbuseFilter;

import org.junit.Test;

public class AbuseTest {
	AbuseFilter abs = new AbuseFilter();
	Scanner sc = new Scanner(System.in);
	String test = "";
	@Test
	public void test() {
		while(!test.equals("종료")){
			 test = sc.nextLine();
			
			if(abs.filter(test)){
				System.out.println("욕설을 사용하셨습니다");
			}else if(test.equals("종료")){
				System.out.println("테스트 종료");
			}else{
				System.out.println("바른말 감사합니다");
			}

		}
		sc.close();
	}

}
