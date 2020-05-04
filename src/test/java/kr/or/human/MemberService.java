package kr.or.human;

public class MemberService {
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
