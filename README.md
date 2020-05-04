## 프로그래밍언어활용 (v4.0.0)
 
---

- [학습목차](https://github.com/miniplugin/human)
- 능력단위 요소: 2001020215_15v3

---

### 학습목표(아래)

- 응용소프트웨어 개발에 사용되는 프로그래밍 언어의 기초 문법을 적용하고 언어의 특징과 라이브러리를 활용하여 기본 응용소프트웨어를 구현할 수 있다.

### 핵심키워드(아래)

- 변수, 데이터 타입, 연산자, 조건문, 반복문, 사용자 정의 자료형, 추상화, 프로그래밍 최적화, 언어 특성, 라이브러리

### 기본 문법 활용하기 + 언어특성 활용하기(아래)

- 클래스 연습: 사용자 정의 자료형 사용하기(아래).
- Hello World MVC 프로젝트에서 src/test/java 패키지에 아래 3개의 클래스 생성한다.
- 실습1: 3개의 클래스 - MainControler,  MemberVO, ActionService 를 생성.
- 실습2: 여러명의 회원 정보(MemberVO)를 전달받고(MainControl), 출력(ActionService)하는 메소드 선언하기.
- 실습결과: 아래처럼 출력 되도록 프로그램 작성.

```
------------
홍길동
45세
000-0000-0000
------------
성춘향
100세
111-1111-1111
------------
각시탈
3세
222-2222-2222
```

### 외부 라이브러리-모듈 이용연습: 서버타임 출력하기(아래)

- 클래스 연습: 사용자 정의 자료형 사용하기(아래).
- Hello World MVC 프로젝트에서 src/test/java 패키지에 아래 3개의 클래스 생성한다.
- 실습1: 3개의 클래스 - MainControler,  MemberVO, ActionService 를 생성.
- 실습코드: 여러명의 회원 정보(MemberVO)를 전달받고(MainControl), 출력(ActionService)하는 메소드 선언하기.

```
<!-- 서버시간 가져오기 pom.xml -->
<dependency>
    <groupId>commons-net</groupId>
    <artifactId>commons-net</artifactId>
    <version>3.6</version>
</dependency>
<!-- MainControl 클래스에 아래 내용 추가하 후 에러 상황 처리하기를 이용해서 외부 라이브러리 사용방법 확인 -->
	System.out.println("-서버타임 출력하기-");
	NTPUDPClient timeClient = new NTPUDPClient();
	timeClient.setDefaultTimeout(1000);
	timeClient.open();
	InetAddress address = InetAddress.getByName(TIME_SERVER);
    TimeInfo timeInfo = timeClient.getTime(address);
    //서버로부터 시간 가져오는 코드
    long returnTime = timeInfo.getMessage().getTransmitTimeStamp().getTime();
    Date date = new Date(returnTime);
    LocalDateTime localDateTime = 
            date.toInstant()
            .atZone(ZoneId.systemDefault())
            .toLocalDateTime();//date to LocalDateTime
    
    System.out.println("Server 시간: " + localDateTime);//서버 시간!
    System.out.println("로컬 PC 시간: " + LocalDateTime.now());
```
- 실습결과: 아래처럼 출력 되도록 프로그램 작성.

```
-서버타임 출력하기-
Server 시간: 2020-05-04T16:01:39.261
로컬 PC 시간: 2020-05-04T16:00:29.890
```

### 참고자료 출처(아래)

- 위에 사용된 소프트웨어는 자유SW 또는 GNU / LGPL / MIT license 입니다.