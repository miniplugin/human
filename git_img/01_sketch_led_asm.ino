/*
   이 스케치는 인라인 어셈블리어 사용을 시험하기 위한 예제
   주)-어셈블리어 테스트용으로만 사용 실제 delay가 이루어 지진 않습니다.
   Node MCU 기술참조: http://cholla.mmto.org/esp8266/xtensa.html
 */

void setup() {
  // 여기에 초기화 부분을 넣어 주세요. 이것은 한번만 실행됩니다:
  // 시리얼 통신 속도를 설정합니다:
  Serial.begin(115200);
  // 시작 안내문을 출력합니다:
  Serial.println("delayUser 예제");
  Serial.println("----------------------");
  pinMode(LED_BUILTIN, OUTPUT);

}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  Serial.println("delayUser 전 LED_BUILTIN 출력");
  // 인라인 어셈블리어 사용
  asm("  nop");
  asm("  movi  a2, 1000"); //delay count 1000을 a2에게 전달한다.
  asm("myloop:");
  asm("  addi   a2, a2, -1"); //a2=a2-1
  asm("  bnez   a2, myloop"); //myloop로 이동 a2가 0이 될때까지 myloop반복
  delay(1000);
  // 인라인 어셈블리어 사용
  asm("  nop");
  asm("  movi  a3, 1000"); //delay count 1000을 a2에게 전달한다.
  asm("myloop2:");
  asm("  addi   a3, a3, -1"); //a2=a2-1
  asm("  bnez   a3, myloop2"); //myloop로 이동 a2가 0이 될때까지 myloop반복
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);
  Serial.println("delayUser 후 LED_BUILTIN 출력");
  
}
