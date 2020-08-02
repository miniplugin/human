#include <ESP8266WiFi.h>
const char* ssid     = "class4";//WIFI 이름
const char* password = "123456789";//WIFI 비밀번호
void setup() {
  Serial.begin(115200);
  delay(1000);
  WiFi.disconnect();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  Serial.println(WiFi.SSID());
  WiFi.setAutoConnect(true); //자동 접속 설정
  WiFi.setAutoReconnect(true); //자동 재접속 설정 
  WiFi.waitForConnectResult();
  Serial.println(WiFi.localIP());
}
void loop() {}
