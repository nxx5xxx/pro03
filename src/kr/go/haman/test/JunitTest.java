package kr.go.haman.test;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class JunitTest {
//테스트는 우마 > 런에스 > junit test
	@Before
	public void before(){
		System.out.println("테스트 시작");
	}
	
	@Test
	public void test() {
		System.out.println("테스트1");
	}
	
	@Test
	public void test2(){
		System.out.println("테스트2");
	}
	
	@After
	public void after() {
		System.out.println("테스트 끝");
	}

}
