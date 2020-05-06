package kr.or.test;

public class Step2 {

	public static void main(String[] args) {
		System.out.println("------------------------------------");
		System.out.println("클래스를 사용한 사용자정의 자료형 소스");
		// =========================================== 
        // 클래스 연습: 사용자 정의 자료형 사용하기(아래)
        // ===========================================
		// MemberVO 클래스를 사용하기 위해 new연산자를 이용해 객체(instance) 생성
		MemberVO m1 = new MemberVO();

		// setter 메소드를 이용해 해당 인스턴스 변수(필드)에 값을 넣어준다.
		m1.setName("홍길동");
		m1.setAge(45);
		m1.setPhoneNum("000-0000-0000");

		// 마찬가지로 다른 MemberVO 객체(instance)를 생성해서 값을 넣어준다.
		MemberVO m2 = new MemberVO();
		MemberVO m3 = new MemberVO();

		m2.setName("성춘향");
		m2.setAge(100);
		m2.setPhoneNum("111-1111-1111");

		m3.setName("각시탈");
		m3.setAge(3);
		m3.setPhoneNum("222-2222-2222");

		// 크기가 3인 MemberVO클래스를(사용자정의자료형) 배열객체로 선언하면서, new연산자를 이용해 객체로 생성한다.
		MemberVO[] members = new MemberVO[3];
		// MemberVO배열클래스에 각각의 객체(instance) m1, m2, m3를 넣어준다.
		members[0] = m1;
		members[1] = m2;
		members[2] = m3;
		
		// 출력: MemberService 클래스를 사용하기 위해 new연산자를 이용해 객체(instance) 생성
		MemberService t = new MemberService();
		t.printMembers(members); // 매개변수로 사용자정의자료형인 MemberVO배열을 넘겨준다.
	}
}

class MemberVO {
	// 자료형 클래스 : 자료를 저장하는 Member 클래스

	// 필드 field(멤버변수)
	private String name;
	private int age;
	private String phoneNum;

	// getter, setter 메소드 - 다른 클래스에서도 접근할 수 있도록 접근제한자는 public
	// getName 메소드를 다른 곳에서 호출하면 이 클래스의 필드의 name변수에 저장된 값을 돌려준다.
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
}

class MemberService {
	// 액션-서비스 클래스 - 출력용 메서드 작성

	// 매개변수로 배열을 받아서 출력하는 형태로 작성
	public void printMembers(MemberVO[] members) {

		// 향상된 for문(Enhanced for loop) 사용
		// 배열 members에 들어있는 값을 처음부터 끝까지 차례차례 하나씩 꺼내서 선언된 변수에 m에 담아서 출력한다.
		for (MemberVO m : members) {
			System.out.println("------------");
			System.out.println(m.getName());
			System.out.println(m.getAge() + "세");
			System.out.println(m.getPhoneNum());
		}
	}
}