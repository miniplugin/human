package kr.or.test;

public class Step1 {

	public static void main(String[] args) {
		System.out.println("------------------------------------");
		System.out.println("클래스를 사용하지 않는 내장변수 자료형 소스");
		// 필드 field(변수)
		String name;
		int age;
		String phoneNum;
		name = "홍길동";
		age = 45;
		phoneNum = "000-0000-0000";
		printMember(name, age, phoneNum);
		name = "성춘향";
		age = 100;
		phoneNum = "111-1111-1111";
		printMember(name, age, phoneNum);
		name = "각시탈";
		age = 3;
		phoneNum = "222-2222-2222";
		printMember(name, age, phoneNum);
		System.out.println("------------------------------------");
		System.out.println("------------------------------------");
		System.out.println("클래스를 사용하지 않는 내장배열 자료형 소스");
		// 필드 field(배열변수)
		String[] names = {"홍길동","성춘향","각시탈"};
		int[] ages = {45,100,3};
		String[] phoneNums = null;
		phoneNums = new String[] {"000-0000-0000","111-1111-1111","222-2222-2222"};
		printMember(names, ages, phoneNums);
		System.out.println("------------------------------------");

	}
	// 매개변수를 받아서 출력하는 형태로 작성
	public static void printMember(String name, int age, String phoneNum) {
			System.out.println("------------");
			System.out.println(name);
			System.out.println(age + "세");
			System.out.println(phoneNum);
	}
	// 매개변수로 배열을 받아서 출력하는 형태로 작성
	public static void printMember(String[] names, int[] ages, String[] phoneNums) {
		for (int i=0; i<3; i++) {	
		System.out.println("------------");
			System.out.println(names[i]);
			System.out.println(ages[i] + "세");
			System.out.println(phoneNums[i]);
		}
	}

}
