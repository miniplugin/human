#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>

ESP8266WebServer server(80);
//int led = 14;

const char pageMain[] PROGMEM = R"=====(
<!doctype html>
<html>
<head>
    <title> GPIO INPUT/OUTPUT DEMO </title>
    <meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <style>
 body {
    background-color: black;
    text-align: center;
 }
 p {
  font-size: 50px;
  color : yellow;
 }
 #state {
    font-size: 80px;
    color : red;
    text-decoration: none;
 }
 </style>
</head>
<body>
    <p>전등 IoT 시스템</p>
    <input type="button" value="켜기" style="WIDTH:200pt; HEIGHT:80pt; font-size:50pt" id="on">
    <input type="button" value="끄기" style="WIDTH:200pt; HEIGHT:80pt; font-size:50pt" id="off">
  <br/>
  <p> LED is now <span id="state"> </span> state. </p>
 <script>
    var state = "on";
 $("#state").text(state);
 $("#on").on("click", function(){
  $.ajax({
      url:"/on",
      method:"get",
      data:"text",
      success:function(result){
        alert(result);
        $("#state").text("on");
      },
      error:function(result){
        alert("API서버가 작동하지 않습니다.");
      }
    });
 });
 $("#off").on("click", function(){
  $.ajax({
      url:"/off",
      method:"get",
      data:"text",
      success:function(result){
        alert(result);
        $("#state").text("off");
      },
      error:function(result){
        alert("API서버가 작동하지 않습니다.");
      }
    });
 });
 </script>
</body>
</html>
)=====";

void setup(void){
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
  delay(1000);
  Serial.begin(115200);
  // 연결 완료 까지 대기
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(WiFi.SSID());
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  if (MDNS.begin("esp8266")) {
    Serial.println("MDNS responder started");
  }

  //접속별 동작 설정
  server.on("/", [](){
    server.send(200, "text/html", pageMain);
  });
  server.on("/on", [](){//ON 으로 접속시 LED를 켭니다.
    digitalWrite(LED_BUILTIN, LOW);
    //server.send(200, "text/json", "{\"success\":\"true\"}");
    //클라이언트에게 응답 데이터 출력
    server.send(200, "text/plain", "전등ON");
  });
  server.on("/off", [](){//OFF 으로 접속시 LED를 끕니다.
    digitalWrite(LED_BUILTIN, HIGH);
    //server.send(200, "text/json", "{\"success\":\"true\"}");
    //클라이언트에게 응답 데이터 출력
    server.send(200, "text/plain", "전등OFF");
  });

  //서버 사용을 시작합니다.
  server.begin();
  Serial.println("HTTP server started");
}

void loop(void){
  server.handleClient();//클라이언트의 요청이 있는 경우 클라이언트와의 연결과 요청에 대한 처리를 하는 함수
}
