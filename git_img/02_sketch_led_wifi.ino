#include <ESP8266WiFi.h>
const char* ssid     = "SAMSUNG";//WIFI 이름
const char* password = "";//WIFI 비밀번호
void setup() {
  delay(1000);
  WiFi.disconnect();
  WiFi.begin(ssid, password);
  WiFi.setAutoConnect(true); //자동 접속 설정
  WiFi.setAutoReconnect(true); //자동 재접속 설정 
  WiFi.waitForConnectResult();
  delay(1000);
  Serial.begin(115200);
  Serial.print("Connecting to ");
  Serial.println(ssid);
  Serial.println(WiFi.SSID());
  Serial.println(WiFi.localIP());
}
void loop() {}
