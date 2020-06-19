## 통합구현 (v5.0.0)
 
---

- [학습목차](https://github.com/miniplugin/human)
- 능력단위 요소: 2001020206_16v4

---

### 학습목표(아래)
- 모듈 간의 분산이 이루어진 경우를 포함하여 단위 모듈 간의 데이터 관계를 분석한다.
- 이를 기반으로 한 메커니즘 모듈 간의 효율적인 연계를 구현하여 검증할 수 있다.

### 핵심키워드(아래)
- 연계 데이터, 연계 메커니즘, 송수신 현황 모니터링, 데이터 보안, 연계 모듈, EAI(Enterprise Application
Integration)/ESB(Enterprise Service Bus), 엔터티 관계도(ERD: Entity Relationship Diagram), 연계(인
터페이스) 정의서, 연계(인터페이스) 설계서

### 연계 데이터 구성하기(아래)
- HRD-Net 로그인 > 회원정보 > 오픈API신청 > 인증키 확인
- HRD-Net 연계데이터 구성 및 Online 테스트페이지 확인: http://www.hrd.go.kr/hrdp/ap/papco/PAPCO0700T.do

### 연계 메커니즘 구성하기(아래)
- [연계시스템 예시_원격모니터링시스템_Agent(중계)시스템으로 매커니즘 이해 PDF보기](/git_img/example.pdf).

### 내외부 연계 모듈 구현하기(아래)
- Hello World MVC 프로젝트에서 src/test/java 패키지에 OpenApi.java 클래스로  통합과정 실업자훈련 목록 API모듈구현.
- 콘솔창에서 xml 이쁘게 출력하기 위해서 위 패키지에 XmlUtils.java 클래스 추가.
- 아래 2개의 소스를 합쳐서 5초마다 원격데이터를 가져오는 결과를 만든다.

```
//외부연계  소스
BufferedReader br = null;
    try{            
        String urlstr = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA40/HRDPOA40_1.jsp"
                + "?authKey=발급받은인증키&returnType=XML&outType=1&pageNum=1"
                + "&pageSize=10&srchTraStDt=20200101&srchTraEndDt=20200631&sort=ASC&sortCol=TR_NM_i";
        URL url = new URL(urlstr);
        HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
        urlconnection.setRequestMethod("GET");
        //br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
        br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"euc-kr"));
        String result = "";
        String line;
        while((line = br.readLine()) != null) {
            result = result + line + "\n";
        }
        //System.out.println(result);
        String formatXml = XmlUtils.formatXml(result.toString());
        System.out.println(formatXml);
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
    
//연계주기(반복실행) 소스
	// 실행간격 지정(5초)
    	int sleepSec = 5;
    	// 주기적인 작업을 위한 
    	final ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
    	exec.scheduleAtFixedRate(new Runnable(){ 
    		public void run(){ 
    			try { 
    				// 콘솔에 현재 시간 출력
		         Calendar cal = Calendar.getInstance();
				System.out.println(cal.getTime()); 
    			} catch (Exception e) { 
    				e.printStackTrace(); 
    				// 에러 발생시 Executor를 중지시킨다 
    				exec.shutdown(); 
    				} 
    			} 
    		}, 0, sleepSec, TimeUnit.SECONDS); 
```


### 참고자료 출처(아래)
- 위에 사용된 소프트웨어는 자유SW 또는 GNU / LGPL / MIT license 입니다.
- HRD-Net 오픈API(정부3.0서비스): http://www.hrd.go.kr/hrdp/ap/papao/PAPAO0100D.do
- [연계시스템 예시_원격모니터링시스템_Agent(중계)시스템이해 PDF보기](/git_img/example.pdf)
- eclipse xmlutil pretty print(콘솔창에서 xml 이쁘게 출력)방법 : https://bryan7.tistory.com/83

```
- <!-- 2020.06.19 에러 처리 (아래) 
    1. DailyRollingFileAppender 에서 로그파일 날짜 형식은 MaxMaxFileSize, MaxBackupIndex의 옵션이 적용되지 않는다.
	기존 log4j 1.2.15버전의 버그(Log4j : ERROR Failed to rename 기존로그파일 to 신규로그파일명 )
	- 이유: Log4J를 여러 인스턴스가 공유해서 사용할 경우
	log4j-1.3alpha-8 스타일로 변경 - 패키지 변경 및 policy 처리로 구조 변경 됨 
	기술참조: https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:rte:fdl:logging&s%5B%5D=log4j
	라이브러리: http://archive.apache.org/dist/logging/log4j/
	2. log4jdbc 드라이버 사용에러는 /src/main/resources/log4jdbc.log4j2.properties 생성필요함.
	3. 메이븐 업데이트시 자바버전 1.6으로 변경되는 문제 -> pom.xml build 항목의 1.6을 1.8로 변경.
-->
```

- 위에서 log4j 1.2.15버전 -> log4j-1.3alpha-8버전으로 바꿀때, 다운로드 속도가 느릴때 [download this](git_img/log4j-1.3alpha-8.jar)