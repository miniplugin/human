package kr.or.human;

public class MemberVO {
	// 자료형 클래스 : 자료를 저장하는 Member 클래스

	// 필드 field(변수)
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
