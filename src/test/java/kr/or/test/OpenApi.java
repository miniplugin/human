package kr.or.test;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class OpenApi {
    public static void main(String[] args) {
        BufferedReader br = null;
        try{            
            String urlstr = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA40/HRDPOA40_1.jsp"
                    + "?authKey=68SzgzuXkSkv6QApdKjZmNOSvj4UsOLy&returnType=XML&outType=1&pageNum=1"
                    + "&pageSize=20&srchTraStDt=20150101&srchTraEndDt=20150631&sort=ASC&sortCol=TR_NM_i";
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
            System.out.println(result);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
