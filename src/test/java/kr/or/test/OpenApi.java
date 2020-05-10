package kr.or.test;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class OpenApi {
	//외부연계 매서드
	public static void serviceApi() {
		BufferedReader br = null;
        try{            
            String urlstr = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA40/HRDPOA40_1.jsp"
                    + "?authKey=yKt63a6Wtxfq282kkIdQAZVXtSlPW5GF&returnType=XML&outType=1&pageNum=1"
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
		// 콘솔에 현재 시간 출력
        Calendar cal = Calendar.getInstance() ;
		System.out.println(cal.getTime()); 
	}
	//메인 Start매서드
    public static void main(String[] args) {
    	// 실행간격 지정(5초)
    	int sleepSec = 5 ;
    	// 주기적인 작업을 위한 
    	final ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
    	exec.scheduleAtFixedRate(new Runnable(){ 
    		public void run(){ 
    			try { 
    				serviceApi();
    			} catch (Exception e) { 
    				e.printStackTrace(); 
    				// 에러 발생시 Executor를 중지시킨다 
    				exec.shutdown() ; 
    				} 
    			} 
    		}, 0, sleepSec, TimeUnit.SECONDS); 
    }
}
