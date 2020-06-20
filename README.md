## 임베디드 애플리케이션 구현 (v15.0.0)
 
---

- [학습목차](https://github.com/miniplugin/human)
- 능력단위 요소: LM2001020323_16v4 + LM2001020324_17v5  
- 임베디드 애플리케이션 구현 환경 구축 + 임베디드 애플리케이션 구현

---

### 학습목표(아래)

- 기술 스펙 검토, 개발 환경 구축, 프로그래밍, 버전 관리 등을 수행할 수 있다.

### 핵심키워드(아래)

- 임베디드 운영 체제, 교차 개발 환경, 오픈소스, 소스코드 버전 관리, GUI 프로그래밍, 툴체인, 디버깅

### 기술 명세 검토(아래)

- 아두이노 IDE 개발툴 사용해서 스케치프로그램 작성
- 안드로이드 스튜디오 IDE 개발툴 사용(세부명세는 AndroidManifest.xml 에 명시)
- <uses-sdk android:minSdkVersion="12" />
- <uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
- <uses-permission android:name="android.permission.BLUETOOTH"/>
- 자바호환버전: 1.8: build.gradle 파일에 명시
- 수행작업확인(아래)

```
1. 스마트 폰(블루투스)으로 에서 아두이노 디바이스의 LED 신호를 제어하는 프로그램을 작성하시오.
2. 작성한 프로그램을 빌드하여 제대로 실행되는지 확인하시오.
  1) 1번 버튼 : 0.5초 간격으로 LED 깜박임.
  2) 2번 버튼 : 3초간으로 계속 깜박임l.
  3) 3번 버튼 : 누르고 있는 동안 ON.
  4) 4번 버튼 : 누르고 ON/ 다시 누르면 OFF.
  5) 5번 버튼 : LED 2개가 교대로 깜박이게.

3. 빌드를 완료한 프로그램을 스마트폰과 아두이노의 연결된 상태에서 실행을 확인하시오.
4. 스마트폰과 아두이노와 블루투스의 인터페이스가 정확한지 확인하시오.
5.  github에 저장소를 만들고 add, commit 및 push 명령어를 이용하여 저장소에 소스코드를 
   업로드하시오.
6. github에 v2.0.0 이라는 태그를 만들고 해당 태그에 소스코드를 업로드하시오.
7. 디바이스 드라이브가 실행되는 결과  2개 이상을 캡쳐 하시오(하드웨어)
```

### 애플리케이션 개발 환경 구축하기(아래)

- 하드웨어준비: 노드MCU 보드, HC-06블루투스 모듈보드, 점퍼선 6개, 외부 LED1개, 안드로이드폰(삼성갤럭시S1이상)
- 아두이노 IDE 설치 및 PC와 연결확인: UART통신
- 안드로이드 스튜디오 설치: https://developer.android.com/studio/install

### 애플리케이션 구현하기(아래)

-  노드MCU 프로그램 제작하기(SamrtNodeMCU.ino)

```
// 업로드시 와이파이보드 RX, TX핀을 제거하고 업로드
char rxVal;//스마트폰->노드MCU 전송값 변수 선언
int LED_USER = 14;//외부 LED 변수 선언
void setup() //프로그램 초기 1회만 실행됨
{
  //시리얼 모니터 설정(아래)
  Serial.begin(9600);//디버그용 통신연결-아두이노내장 시리얼모니터에서 사용
  Serial1.begin(9600);//불루투스보드와 통신연결-전송속도9600으로 해도 스트링문자열 전송정상입니다.
  Serial.write("스마트노드MCU 프로젝트");//디버그용 시리얼모니터에 제목출력
  Serial.println();//자바의 System.out.println()과 같음
  //노드MCU 보드 핀 설정(아래)
  pinMode(LED_BUILTIN, OUTPUT);//MCU보드의 하단 led 켜기 선언
  pinMode(14, OUTPUT);//외부 led 켜기 선언 GPIO14번=D5
  digitalWrite(LED_BUILTIN, LOW);//MCU보드의 하단 led OFF
  digitalWrite(LED_USER, LOW);//외부 led OFF
}//End setup()

void loop()                 //MCU보드 전원이 꺼질때까지 무한 실행됨
{
 static boolean flag = true;// flag 가 참일 경우
 if(Serial1.available())//불루투스보드와 통신연결이 되었을때 if 실행
 {
  rxVal = Serial1.read();                          
  Serial.println(int(rxVal));   //Serial Monitor로 수신값 출력
  switch(rxVal)
  {
    case '1' :                  // rxVal 이 1 일 경우
       for(int i=0; i<3; i++)   // 0부터 2까지 3회 반복
         {
          digitalWrite(LED_BUILTIN, HIGH);// MCU보드의 하단 led ON
          delay(500);           // 0.5초 기다림
          digitalWrite(LED_BUILTIN, LOW); // MCU보드의 하단 led OFF
          delay(500);
         }
         break;                 // switch문 종료
    case '2' :                  // rxVal 이 2 일 경우
       for(int i=0; i<3; i++)   // 0부터 2 까지 3회 반복
         {
          digitalWrite(LED_BUILTIN, HIGH);// MCU보드의 하단 led ON
          delay(3000);          // 3초 동안 기다림
          digitalWrite(LED_BUILTIN, LOW); // MCU보드의 하단 led OFF
          delay(3000);          // 3초 동안 기다림
         }
         break;                 // switch문 종료
    case '3' :                  // rxVal 이 3 일 경우
         digitalWrite(LED_BUILTIN, HIGH);  // MCU보드의 하단 led ON
         delay(30);             // 0.03초 동안 기다림
         digitalWrite(LED_BUILTIN, LOW);  // MCU보드의 하단 led OFF
         break;                 // switch문 종료
    case '4' :                  // rxVal 이 4 일 경우 - 토글Toogle기능(똑딱이)
        {
          switch(flag)          // flag 가 참이면 
          {
            case true;
              digitalWrite(LED_BUILTIN, HIGH);// MCU보드의 하단 led ON
              flag=false;           // flag 변수에 거짓값 저장
              break;                // 내부 switch문 종료
            case false:            // flag가 거짓이면
              digitalWrite(LED_BUILTIN, LOW);// MCU보드의 하단 led OFF
              flag=true;           // flag 변수에 참값 저장
              break;               // 내부 switch문 종료
         }
         break;                   // switch문 종료
       }
    case'5' :                     //rxVal 이 5 이면
        for(int i=0; i<3; i++)    // 0부터 2 까지 3회 반복
         {
          digitalWrite(LED_USER, LOW);  // 외부 led OFF
          digitalWrite(LED_BUILTIN, HIGH);  // MCU보드의 하단 led ON
          delay(500);                   // 0.5 초 후 
          digitalWrite(LED_USER, HIGH);  // 외부 led ON
          digitalWrite(LED_BUILTIN, LOW);   // MCU보드의 하단 led OFF
          delay(500);                  // 0.5초 후 반복 (x 3회)
         }                             // 3회 후 반목분 종료
        digitalWrite(LED_USER, LOW);   // 외부 led OFF
        digitalWrite(LED_BUILTIN, LOW);// MCU보드의 하단 led OFF
        break;                         // switch문 종료
    case 's' :                         //rxVal 이 s 일 경우 모든 led 꺼짐
        digitalWrite(LED_USER, LOW);   // 외부 led OFF
        digitalWrite(LED_BUILTIN, LOW);// MCU보드의 하단 led OFF 
        break;                         // switch문 종료
  }// End switch문
 }// End if문
}// End loop문

```

- 안드로이드 스튜디오를 사용해서 앱만들기 핵심파일3개(아래)
 [앱 명세파일 download this](git_img/AndroidManifest.xml)
 [화면처리파일 download this](git_img/activity_main.xml)
 [자바프로그램처리 download this](git_img/MainActivity.java)
  
```
앱 명세파일 : AndroidManifest.xml
화면처리파일: activity_main.xml
자바프로그램처리: MainActivity.java
```

### 결과확인(준비중)


### 참고자료 출처(아래)
- 학습모듈: https://ncs.go.kr/unity/th03/ncsSearchMain.do 20.정보통신 > 01.정보기술 > 02.정보기술개발 > 03.임베디드SW 엔지니어링
- 노드MUC보드 참고자료: https://s3.ap-northeast-2.amazonaws.com/mechaimage/book/NodeMCU.pdf