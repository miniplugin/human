## UI구현 (v6.0.0)
 
---

- [학습목차](https://github.com/miniplugin/human)
- 능력단위 요소: 2001020708_17v2

---

### 학습목표(아래)
- UI 설계 산출물과 GUI 디자인 가이드를 바탕으로 UI 구현표준을 수립하고 UI를 제작할 수 있다.

### 핵심키워드(아래)
- 사용자 중심 인터랙션 디자인(human computer interaction design), html(hyper text markup
language), web, app, css(cascading style sheets), gui(graphic user interface), layout, font,
header, container, footer, color, UI 설계 검토, UI 구현 표준, UI 저작도구, 프로토타입 UI, 단위
테스트, 테스트 케이스

### UI 디자인 가이드 이해(아래)
- 교사가 제시한 나라장터의 제안요청서 파일 검토(아래URL).
- http://www.g2b.go.kr/pt/menu/selectSubFrame.do?framesrc=http://www.g2b.go.kr:8340/search.do?category=TGONG&kwd=%C0%CF%C7%D0%BD%C0%BA%B4%C7%E0%C1%A6
- 기타 교사가 제시한 디자인 제안서 2가지 확인(구글드라이브) 

### UI 구현 표준 검토하기(아래)
- 교사가 제시한 UI디자인 & Development개발 가이드 파일 검토(아래URL).
- https://drive.google.com/file/d/1JsAIwUItL2phlsXEwQ7yK-BOA7mbizJ-/view?usp=sharing

### UI 저작도구 활용하기(아래)
- 교사가 제시한 UI디자인 & Development개발 가이드를 적용할 Home사용자페이지 다운로드 합니다(아래 소스 다운로드).
- 소스: [download this](git_img/home.zip) 다운로드 후 압축을 풀고 webapp/resources 폴더에 넣어 줍니다. 
- 교사가 제시한 Admin관리자페이지는  부트스트랩기반 반응형 Admin-LTE free템플릿 사용(아래 URL).
- URL: https://adminlte.io/ (메인페이지에서 DOWNLOAD 버튼 사용 또는 깃에서 다운로드 https://github.com/ColorlibHQ/AdminLTE )
- Admin-LTE 다운로드 받은 것을 압축풀고 webapp/resources 폴더에 넣어 줍니다.
- 교사가 제시한 부트스트랩 디자인 프레임웍을 다운로드합니다(아래 소스 다운로드).
- 소스: [download this](git_img/bootstrap.zip) 다운로드 후 압축을 풀고 webapp/resources 폴더에 넣어 줍니다.

### UI 제작하기(아래)
- 위에서 교사가 제시한 UI디자인 & Development개발 가이드 파일 검토 후 스프링 MVC웹프로젝트에 제작(퍼블리싱)한다. 
- 교사가 제시한 단위테스트 사항들을 크롬웹브라우저에서 수행한다.

### 참고자료 출처(아래)
- 위에 사용된 소프트웨어는 자유SW 또는 GNU / LGPL / MIT license 입니다.
- 위 작업시 사용된 이미지는 픽사베이 무료이미지만 사용한다 : https://pixabay.com/
- 20200623 메뉴선택시 선택부분만 활성화: 자바스크립트(JQuery)로 처리-학생실습(아래)

```
<!-- footer.jsp 하단에 저장 : 아래 [클래스명을입력]부분을 학생이 채우세요... -->
<script>
$(document).ready(function() {
    var current = location.pathname;
    $('클래스명을입력 li a').each(function(){
        var $this = $(this);
        if($this.attr('href').includes(current) == true){
            $this.addClass('active');
        }else{
        	$this.removeClass('active');
        }
    })
 });
</script>
```

- 관리자페이지 중 회원관리 페이지 제작예시(아래)
![ex_screenshot](./git_img/member_admin.jpg)
- 관리자페이지 중 게시판관리 페이지 제작예시(아래)
![ex_screenshot](./git_img/board_admin.jpg)


#### 스프링에서 사용된 용어 설명(미리보기)
```
======================================
@RequestMapping 을 매서드상단에 붙이면 HTTP 요청을 받아들이는 매서드임을 나타냄.
@Autowired (스프링용) = @Inject-주입하다(자바용): 
 - DI(디펜던시인젝션)컨테이너(등록된 Bean-스프링에서 관리하는 클래스)가 의존성 주입 해야할 클래스.
 - 스프링 4.3버전 이상 부터 즉, 스프링부트2.x(스프링5.x) 부터는 @Autowired 애노테이션을 사용하지 않아도 DI가 가능합니다.
@ComponentScan : 프로젝트에서 생성한 빈(Bean)클래스를 자동으로 DI컨테이너에 자동등록@SpringBootApplication (신)에서는 필요없음.
@Component, @Controller, @Service, @Repository 등 : 
 - 스프링 에서 DI컨테이너(등록된 Bean들)에 자동 등록될 빈(Bean) 클래스 지정.
- @Controller : 스프링 웹MVC 컨트롤러를 의미. 
  웹URI 등록에 사용. 위에 언급한 @RestController (RestFull용)참조.
  jsp와 @Service서비스연결해주는 View 프리젠테이션 레이어 클래스.
- @Service : 도메인(domain=VO,Value Object멤버변수) 와
  DAO(데이터엑세스Repository)를 연결해 주는 비지니스(서비스) 로직 레이어 클래스.
- @Repository : 서비스(비지니스)와 DB엑세스(DAO) 를 연결해 주는 레이어 클래스.
==============================================================================
스프링 웹 프로젝트 코딩 순서는 아래와 같습니다.
==============================================================================
1. DB ERD 작업 및 스키마 및 테이블 생성(이전 포스트 참조)
2. 스프링 Legacy 프로젝트 생성 POM파일+스프링설정(root-context.xml)  및 패키지 구조 정의(이전 포스트 참조)
3. 자바 코딩 시작(아래 나열된 순서대로 작업 합니다.)
   아래 대표 @애노테이션 이름이 있습니다.
 - VO (Db 클래스 멤버변수 정의)파일 생성.
 - DAO(Db엑세스 인터페이스)파일 생성, Implement 구현클래스(@Repository) 파일 생성.
 - db SQL쿼리 구문 Mapper xml 파일 생성.(DAO에서 사용하는 이름태그: <mapper namespace="org.edu.mapper.BoardMapper">)
 - Biz(비지니즈-@Service) 인터페이스 파일 생성, Implement 구현클래스(@Service) 파일 생성
 - JUnit 테스트(@Test)로 Biz(비지니스) CRUD 테스트.
===============================================================================

AOP기능 추가시 사용된 파일목록: 
1.pom.xml (디펜던시추가), 
2.root-context.xml 에 설정내용추가, 
3. org.edu.aop 패키지 클래스 상단에 @Aspect지정,@Component 로 지정
4. 클래스내부 메서드 상단에 @Around로 감싸줌
@Around("execution(* org.edu.service.MemberService*.*(..))")//해당서비스명칭 변경
5. log4j.xml 설정을 info -> debug 로 변경해줌.
```

### REST API 서버+서비스(REST FULL)댓글 처리
### 댓글 리스트
```
<!-- 댓글 목록 반복처리 : 핸들러 플러그인 사용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- 댓글 리스트 빵틀 -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<div class="replyLi" data-rno={{rno}}>
	<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item" >
		<span class="time">
			<i class="fa fa-clock-o"></i>{{regdate}}
		</span>
		<h3 class="timeline-header">
			<strong>{{rno}}</strong> -{{replyer}}
		</h3>
		<div class="timeline-body">{{replytext}}</div>
		<div class="timeline-footer">
			<a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modifyModal">
			Modify
			</a>
		</div>
	</div>
</div>
{{/each}}
</script>
<script>
//댓글 변수 초기화
var bno = ${boardVO.bno};
var printData = function(replyArr, target, templateObject) {
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}
function getPage(pageInfo) {
	$.getJSON(pageInfo, function(data) {
		//console.log(data);//디버그
		printData(data, $("#repliesDiv"), $('#template'));
		$("#modifyModal").modal('hide');
	});
}
//댓글 리스트 실행
$(document).ready(function(){
	getPage("/reply/select/"+bno);
});
</script>
```
### 댓글 입력
```
<script>
$(document).ready(function(){
	//댓글 입력
	$("#replyAddBtn").on("click",function(){
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		  $.ajax({
				type:'post',
				url:'/reply/insert',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({bno:bno, 
									  replyer:replyer, 
									  replytext:replytext}),
				success:function(result){
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						getPage("/reply/select/"+bno);
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});
});
</script>
```
### 댓글 수정/삭제용 모달창 + 변수값 바인딩 및 이벤트
```
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="display:block;">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
	<p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
	<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
	<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function() {
	//선택한 댓글 모달찯에 바인딩
	$(".timeline").on("click", ".replyLi", function(event){
		var reply = $(this);
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
	});
	//...댓글 수정 버튼 이벤트.
	$("#replyModBtn").on("click",function(){
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  $.ajax({
				type:'put',
				url:'/reply/update/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("댓글 수정 result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/reply/select/"+bno);
					}
			}});
	});
	//...댓글 삭제 버튼 이벤트.
	$("#replyDelBtn").on("click",function(){
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  $.ajax({
				type:'delete',
				url:'/reply/delete/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("댓글 삭제 result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/reply/select/"+bno);
					}
			}});
	});	
});
</script>
```

### 페이징 처리(게시판에 사용된 PageVO 클래스 사용-리뷰 후 아래 실습)
```
<!-- 쿼리추가 -->
<select id="selectReply" resultType="org.edu.vo.ReplyVO">
	select * from tbl_reply where bno = #{bno} 
	order by regdate desc
	limit #{pageVO.startNo}, #{pageVO.perPageNum}
</select>
<select id="countRno" resultType="int">
	select count(bno) from tbl_reply where bno = #{bno}
</select>

<!-- DAO + Service 추가 -->
@Override
public List<ReplyVO> selectReply(Integer bno, PageVO pageVO) throws Exception {
	Map<String, Object> paramMap = new HashMap<String, Object>();
	paramMap.put("bno", bno);
	paramMap.put("pageVO", pageVO);
	return sqlSession.selectList(mapperQuery + ".selectReply", paramMap);
}
@Override
public int countRno(Integer bno) throws Exception {
	return sqlSession.selectOne(mapperQuery + ".countRno", bno);
}

<!-- 컨트롤러 slectReply 수정 -->
@RequestMapping(value="/select/{bno}/{page}", method=RequestMethod.GET)
public ResponseEntity<Map<String, Object>> selectReply(@PathVariable("bno") Integer bno, @PathVariable("page") Integer page) {
	ResponseEntity<Map<String, Object>> entity = null;
	try {
		PageVO pageVO = new PageVO();
		pageVO.setPage(page);
		pageVO.setPerPageNum(5);
		pageVO.setTotalCount(replyService.countRno(bno));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyList", replyService.selectReply(bno, pageVO));
		map.put("pageVO", pageVO);
		entity = new ResponseEntity<Map<String, Object>>(map , HttpStatus.OK);
	} catch (Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	}
	return entity;
}

<!-- 뷰페이지 board_view.jsp 수정 -->
//댓글 페이지 변수 초기화
var replyPage = 1;
//페이징 빵틀
var printPageVO = function(pageVO, target) {
	var str = "";
	if (pageVO.prev) {
		str += "<li><a href='"+(pageVO.startPage - 1)+"'> << </a></li>";
	}
	for (var i=pageVO.startPage;i<=pageVO.endPage;i++) {
		str = str + "<li class='page-item " + (pageVO.page==i?'active':'') + "'><a class='page-link' href='"+i+"'>"+i+"</a></li>"; 
	}
	if (pageVO.next) {
		str += "<li><a href='"+(pageVO.endPage + 1)+"'> >> </a></li>";
	}
	target.html(str);
};
//출력부분 수정
function getPage(pageInfo) {
	$.getJSON(pageInfo, function(data){
		//댓글리스트 빵틀 출력
		printReplyList(data.replyList, $("#replyDiv"), $("#template"));//페이징 때문에 data.replyList 로 변경
		//페이징 빵틀 출력(아래)
		printPageVO(data.pageVO, $(".pagination"));
		//getPage함수 호출시 페이지 카운터 계산 결과 넣어줌.
		$("#reply_count").html(data.pageVO.totalCount);
		//$("#modifyModal").modal('hide');
	});
}
//댓글 리스트 출력실행
$(document).ready(function(){
	getPage("/reply/select/" + bno + "/" + replyPage);
	//페이징 버튼 클릭시 이벤트 처리
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("/reply/select/"+bno+"/"+replyPage);
	});
});
//입력,수정,삭제에서 getPage함수 호출하는 매개변수 수정
getPage("/reply/select/"+bno + "/" + replyPage);
```

### 댓글 마무리 작업전 점검사항
- 페이징 처리 pageVO 계산식 10 으로 박혀 있는 상수 -> this.perPageNum 변수로 처리(주, 소수점 아래 변수는 (double)형으로 형변환).
- jsp뷰페이지에서 페이징에 사용된 자바스크립트 아래쪽에 모두 모아서 정리.
- jsp뷰페이지에 countRno 값 출력.

### Git에서 제공하는 도메인 사용하기 순서(포트폴리오용)
1. 포트폴리오 사이트 = Git에서 제공하는 도메인
2. https://github.com/miniplugin(개인폴더) 
 - 핵심은 레포지토리명을 => miniplugin.github.io (레포지토리명)
3. https://miniplugin.github.io (호스트네임)으로 접근가능.

### IE와 크롬에서 모두 첨부파일 이미지 미리보기 가능하게 하는 코드 추가

```
/**
 * 게시물 첨부파일 이미지보기 메서드 구현(IE, 크롬 공통)
 * @throws IOException 
 */
@RequestMapping(value = "/image_preview", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
@ResponseBody
public byte[] getImageAsByteArray(@RequestParam("filename") String fileName, HttpServletResponse response) throws IOException {
	FileInputStream fis = null;
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	fis = new FileInputStream(uploadPath + "/" + fileName);
	int readCount = 0;
	byte[] buffer = new byte[1024];
	byte[] fileArray = null;
while((readCount = fis.read(buffer)) != -1){
	baos.write(buffer,0,readCount);
}
fileArray = baos.toByteArray();
fis.close();
baos.close();
return fileArray;
}
```

#### 스프링시큐리티 + SNS 로그인 구현 (스프링 Hsql 프로젝트 기준, 네이버 로그인 API사용)
- 기술정보: http://blog.naver.com/PostView.nhn?blogId=sam_sist&logNo=220969407741
- 우선 네이버 개발자 센터에서 API이용신청을 합니다. 이용신청하기링크: https://developers.naver.com/apps/#/register
- 1. pom.xml 에 의존성 추가

```
<!-- naver -->
		<dependency>
			<groupId>com.github.scribejava</groupId>
			<artifactId>scribejava-core</artifactId>
			<version>2.8.1</version>
		</dependency>
		<!-- naver 리턴값 json파싱 -->
		<dependency>
      <groupId>com.googlecode.json-simple</groupId>
      <artifactId>json-simple</artifactId>
      <version>1.1</version>
  </dependency>
```
- 2. util패키지에 NaverLoginApi.java 추가

```
import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20{

    protected NaverLoginApi(){
    }

    private static class InstanceHolder{
        private static final NaverLoginApi INSTANCE = new NaverLoginApi();
    }


    public static NaverLoginApi instance(){
        return InstanceHolder.INSTANCE;
    }

    @Override
    public String getAccessTokenEndpoint() {
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
    }                   

    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://nid.naver.com/oauth2.0/authorize";
    }   

}
```
- 3. 컨트롤러 패키지에 NaverLoginController 추가

```
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.edu.util.NaverLoginApi;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

/*
 * 기술정보: http://blog.naver.com/PostView.nhn?blogId=sam_sist&logNo=220969407741 
 */

@Controller
public class NaverLoginController {
	/* 인증 요청문을 구성하는 파라미터 */
	//client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
	//response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
	//redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
	//state: 애플리케이션이 생성한 상태 토큰
	private final static String CLIENT_ID = "1mJg3VXr8DCW4xISOaPJ";
    private final static String CLIENT_SECRET = "Y**********";
    private final static String REDIRECT_URI = "http://127.0.0.1:8080/login_callback";
    private final static String SESSION_STATE = "oauth_state";
    /* 프로필 조회 API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /* 네이버 아이디로 인증  URL 생성  Method */
    public String getAuthorizationUrl(HttpSession session) {

        /* 세션 유효성 검증을 위하여 난수를 생성 */
        String state = generateRandomString();
        /* 생성한 난수 값을 session에 저장 */
        setSession(session,state);        

        /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
        OAuth20Service oauthService = new ServiceBuilder()                                                   
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
                .build(NaverLoginApi.instance());

        return oauthService.getAuthorizationUrl();
    }

    /* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{

        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = getSession(session);
        if(StringUtils.pathEquals(sessionState, state)){

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());

            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }

    /* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    /* http session에 데이터 저장 */
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }

    /* http session에서 데이터 가져오기 */ 
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(NaverLoginApi.instance());

            OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }

}
```
- 4. HomeController.java 에 네이버 로그인 성공시 callback호출 메소드 추가 및 로그인jsp model변수 추가

```
@RequestMapping(value = "/login_callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes rdat)
			throws IOException, ParseException {
		//System.out.println("여기는 callback");//디버그
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginController.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    String apiResult = naverLoginController.getUserProfile(oauthToken);
		//model.addAttribute("result", apiResult);
	    
	    /* Json 데이터 파싱 시작 */
	    /** apiResult json 구조
	    {"resultcode":"00",
	    "message":"success",
	    "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	    **/
	    //String형식인 apiResult를 json형태로 바꿈
	    JSONParser parser = new JSONParser();
	    Object obj = parser.parse(apiResult);
	    JSONObject jsonObj = (JSONObject) obj;
	    //Top레벨 단계 _response 파싱
	    JSONObject response_obj = (JSONObject)jsonObj.get("response");
	    //response의 name값 파싱
	    String username = (String)response_obj.get("name");
	    String useremail = (String)response_obj.get("email");
	    //System.out.println(useremail);//디버그
	    String Status = (String)jsonObj.get("message");
	    //System.out.println("여기" + Status);//디버그
	    /* Json 데이터 파싱 끝 */
	    
	    //SNS로그인이 성공이라면
	    if(Status.equals("success")) {
		    /* 강제로 스프링 시큐리티 인증 처리 */
		    List<SimpleGrantedAuthority> authorities = new ArrayList<>();
	        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
	        Authentication authentication =  new UsernamePasswordAuthenticationToken(useremail, null, authorities);
	        SecurityContextHolder.getContext().setAuthentication(authentication);
	        
		    /* 로그인 세션 저장 */
			session.setAttribute("session_enabled", true);//인증확인
			session.setAttribute("session_userid", useremail);//사용자이메일
			session.setAttribute("session_levels", "ROLE_USER");//사용자권한
			session.setAttribute("session_username", username);//사용이이름
			rdat.addFlashAttribute("msg", "로그인");//result 데이터를 숨겨서 전송
	    } else {
	    	rdat.addFlashAttribute("param.msg", "fail");//result 데이터를 숨겨서 전송
	    	return "redirect:/login";//새로고침 자동 등록 방지를 위해서 아래처럼 처리
	    }
        /* 네이버 로그인 성공 페이지 View 호출 */
		return "redirect:/";//새로고침 자동 등록 방지를 위해서 아래처럼 처리
	}
 
 /**
	 * 로그인 페이지 파일 입니다.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginController.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);

		return "login";
	}
 ```
 
 - 5. login.jsp 에 네이버 로그인 버튼 추가
 
 ```
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
 
 <p class="btn_line">
  <!-- 네이버 로그인 화면으로 이동 시키는 URL -->
  <!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
  <a href="${url}" class="btn_baseColor" style="background:green;width:200px;">네이버ID로 로그인</a>
 </p>
```

### 스프링 프로젝트 jsp파일에 ck에디터 추가하기
[download ck에디터](git_img/ckeditor.zip)

```
<!-- ck 에디터추가 -->
<script type="text/javascript" src="<c:url value='/'/>resources/plugins/ckeditor/ckeditor.js"></script>
<textarea class="ckeditor" name="content">...</textarea>
<!-- 위 textarea 태그에 클래스명(ckeditor) 만 추가하면 작동됩 -->
```
### 전자정부 프로젝트 게시판에 웹에디터 적용은 jsp파일에 위 처럼 적용 후 아래 내용을 수정하면 됨.
- 기존 depends="required" 값제거 -> depends="" 
- src/main/resources/egovframework/validator/let/cop/bbs/EgovNoticeRegist.xml 파일

### JQuery 연습(아래)

<h3>1. jQuery 개요</h3>

<p>&nbsp; -개요 : 자바 스크립트 라이브러리 중 대표적임.</p>

<p>&nbsp;- DOM엘리먼트 하나하나 접근하여 작업을 수행</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;-페이지에 강력한 CSS를 추가</p>

<p>&nbsp; &nbsp; -엘리먼트 속성 변경, 엘리먼트를 추가</p>


<p>&nbsp; -특징 : DOM 엘리먼트셀렉터(DOM: HTML, XML을 제어)</p>

<p>&nbsp;html태그선택&nbsp;: $(&quot;a&quot;),$(&quot;div&quot;)</p>

<p>&nbsp;CSS클래스선택 : $(&quot;.클래스명&quot;), $(&quot;태그, 클래스명&quot;)</p>

<p>&nbsp;CSS ID선택&nbsp;: $(&quot;#id&quot;) --&gt; document.getElementById(&quot;id&quot;)와 같다</p>

<p>&nbsp;중첩구조 : $(&quot;#id&quot;).find(&quot;li&quot;) =&gt; $(&quot;#id li&quot;)</p>

<p><span style="-webkit-font-smoothing: subpixel-antialiased; font-family: Verdana; font-size: 14pt;">&nbsp;jquery 사용법 시작부분</span></p>


<div class="code notranslate" style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; border-width: 1px; border-style: solid; border-color: rgb(212, 212, 212); padding: 5px; background-color: rgb(229, 238, 204); margin: 0px; width: 622px; text-size-adjust: auto;">
<div style="-webkit-font-smoothing: subpixel-antialiased; border-width: 1px; border-style: solid; border-color: rgb(212, 212, 212); padding: 4px; background-color: rgb(255, 255, 255); width: 612px; font-family: &quot;courier new&quot;; font-size: 13px;">&lt;script type=&quot;text/javascript&quot; src=&quot;jquery.js&quot;&gt;&lt;/script&gt;</div>
</div>

<p style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; background-color: rgb(249, 249, 249); text-size-adjust: auto;">&lt;head&gt; 태그 안쪽에 사용 &lt;/head&gt;</p>

<p><br style="-webkit-font-smoothing: subpixel-antialiased;" />
&nbsp;-Ajax 지원 (현재 진행중인 스프링프로젝트 댓글 기능에 사용할 예정)</p>

<p>&nbsp;-사용법(아래)</p>

<p>&nbsp;*$(document).ready(callback)</p>

<p>&nbsp; &nbsp;단축형:&nbsp;jQuery(callback)/$(callback)&nbsp;</p>

<p>&nbsp; $(document).ready(function(){</p>

<p>&nbsp; &nbsp;//사용자 소스 영역</p>

<p>&nbsp; });</p>


<p>&nbsp; $(function() {</p>

<p>&nbsp;&nbsp;//사용자 소스 영역</p>

<p>&nbsp; });</p>

<p>&nbsp; jQuery(document).ready(function() {</p>

<p>&nbsp;&nbsp;//사용자 소스 영역</p>

<p>&nbsp; });</p>

<p>&nbsp; jQuery(function() {</p>

<p>&nbsp;&nbsp;//사용자 소스 영역</p>

<p>&nbsp; });</p>

<h3><span style="-webkit-font-smoothing: subpixel-antialiased; font-family: Verdana; font-size: 14pt;">2. Core</span></h3>

<p>&nbsp; -jquery의 핵심이 되는것을 의미한다 core를 표현하면 &#39;$()&#39; 이렇게 된다</p>

<h3>&nbsp; 1) jQuery( expression, context )</h3>

<p>&nbsp; &nbsp; &nbsp;expression는 String로 표현되고 특정 태그를 찾을때 사용되며, context는 Element나 jQuery으로 인자 값으로 받는다.</p>

<p>&nbsp; &nbsp; &nbsp;즉, $(&quot;input:radio&quot;, document.forms[0]); 이와 같이 사용된다. ==&nbsp;<code style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: Consolas, Menlo, Monaco, &quot;Lucida Console&quot;, &quot;Liberation Mono&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, monospace, sans-serif; vertical-align: baseline; box-sizing: inherit; white-space: inherit;"><span class="pln" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--black-750);">$</span><span class="pun" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--black-750);">(</span><span class="str" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--red-800);">&#39;</span></code>document.forms[0]<code style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: Consolas, Menlo, Monaco, &quot;Lucida Console&quot;, &quot;Liberation Mono&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, monospace, sans-serif; vertical-align: baseline; box-sizing: inherit; white-space: inherit;"><span class="str" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--red-800);">&#39;</span><span class="pun" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--black-750);">).</span><span class="pln" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--black-750);">find</span><span class="pun" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--black-750);">(</span><span class="str" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--red-800);">&#39;input:radio&#39;</span><span class="pun" style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: inherit; color: var(--black-750);">)</span></code></p>

<h3>&nbsp; 2) jQuery( html )</h3>

<p>&nbsp; &nbsp; &nbsp;jQuery는 인자값으로 html 태그를 받아 그 태그를 HTML페이지에 추가를 할 수가 있다.</p>

<p>&nbsp; &nbsp; &nbsp;즉, 이렇게 $(&quot;&lt;div&gt;&lt;p&gt;제이쿼리&lt;/p&gt;&lt;/div&gt;&quot;).appendTo(&quot;body&quot;) 사용이 되기도 하고, &nbsp;</p>

<p>&nbsp; &nbsp; &nbsp;$(&quot;&lt;input/&gt;&quot;).attr(&quot;type&quot;, &quot;checkbox&quot;); 이렇게 사용되기도 한다</p>

<h3>&nbsp; 3) jQuery( elements )</h3>

<p>&nbsp; &nbsp; &nbsp;DOM element(s) 를 인자로 받아 그 지역의 elements를 설정할 수가 있다.(한개 혹은 다수를 지정할 수가 있다.)</p>

<p>&nbsp; &nbsp; &nbsp;$(document.body).css( &quot;background&quot;, &quot;black&quot; ); -&gt; HTML 배경색을 검정색으로 바꾼다.</p>

<p>&nbsp; &nbsp; &nbsp;$(myForm.elements).hide() -&gt; myForm의 이름을 가진 form안의 elements을 숨긴다.</p>

<h3>&nbsp; 4) jQuery( callback ) 인자값을 함수로 지정을 할 수가 있다</h3>

<p>&nbsp; &nbsp; &nbsp;&quot;$(document).ready(function(){....};)&quot;</p>

<h3>&nbsp; 5) each( callback ) 해당 오브젝트에서 어떤 함수처리를 하고 싶을 경우 사용된다</h3>

<p>&nbsp; &nbsp; &nbsp;$(function() {</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; $(document.body).click(function(){</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $(&quot;div&quot;).each(function(args) {</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//....</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; });</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; });</p>

<p>&nbsp; &nbsp;});</p>

```
// resources/board_list.html에 동적으로 클래스 추가하기
$('tbody tr').each(function (index, item) { 
	// 인덱스는 0부터 시작하는 순서값이 저장되어 있음. 
	// item 은 해당 선택자인 tr객체를 나타냅니다. 
	$(item).addClass('tr_0' + index); 
	// item 과 this는 같아서 일반적으로 this를 많이 사용합니다. 
	// $(this).addClass('li_0' + index); 
});

// 스프링@RestController로 리턴받은 값(JSON데이터로변환=ResponseEntity<List<BoardVO>>)
// JSP에서 스프링@RestController로 전송받는 값(JSON데이터로변환=@RequestBody BoardVO vo)
// entity = new ResponseEntity<>(service.selectReplies(bno) <== 기존 model역할과 비슷

// *JSON객체를 선언 (크롬 콘솔에서 실행)
var boardVO = { 
title : '글제목1', content : '글내용1'
}; 
// $.each() 메서드의 첫번째 매겨변수로 위에서 선언한 객체를 전달
$.each(boardVO, function (index, item) { 
	// 첫 번째 index는 배열의 키를 의미하고 
	// 두 번째 item은 해당 키의 값을 의미합니다. 
	var result = ''; 
	result += index +' : ' + item;
	console.log(result); 
});
// 결과(아래)
// title : 글제목1
// content : 글내용2

// *JSON객체배열을 선언 (크롬 콘솔에서 실행)
var tbl_board = [ 
{title : '글제목1', content : '글내용1'},
{title : '글제목2', content : '글내용2'} 
]; 
// $.each() 메서드의 첫번째 매겨변수로 위에서 선언한 배열은 전달
$.each(tbl_board, function (index, item) { 
	// 두 번째 매개변수로는 콜백(호출없이실행)함수인데 콜백함수의 매개변수 중 
	// 첫 번째 index는 배열의 키를 의미하고 
	// 두 번째 item은 해당 키의 값을 의미합니다. 
	var result = ''; 
	result += index +' : ' + item.title + ', ' + item.content;
	console.log(result); 
});
// 결과(아래)
// 0 : 글제목1, 글내용1
// 1 : 글제목2, 글내용2 

```

<h3>&nbsp; 6) size() 해당 오브젝트의 Elements의 수를 알고자 할 때 사용된다.</h3>

<p>&nbsp; &nbsp; &nbsp;$(document.body).click(function () {</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; $(document.body).append($(&quot;&lt;div&gt;&quot;));</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; var n = $(&quot;div&quot;).size();</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; $(&quot;span&quot;).text(&quot;There are &quot; + n + &quot; divs.&quot; + &quot;Click to add more.&quot;);</p>

<p>&nbsp; &nbsp; }).click(); // trigger the click to start</p>

<h3>&nbsp; 7) length() 해당 오브젝트의 Elements의 수를 알고자 할 때 사용된다. size()와 동일하다.</h3>

<p>&nbsp; &nbsp; &nbsp; $(document.body).click(function () {</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$(document.body).append($(&quot;&lt;div&gt;&quot;));</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var n = $(&quot;div&quot;).length;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$(&quot;span&quot;).text(&quot;There are &quot; + n + &quot; divs.&quot; + &quot;Click to add more.&quot;);</p>

<p>&nbsp; &nbsp; &nbsp; }).trigger(&#39;click&#39;); // trigger the click to start</p>

<h3>&nbsp; 8) get()해당 태그의 Elements 들을 Array형태로 리턴한다. 즉, &#39;$(&quot;div&quot;).get()&#39; 하면 모든 div태그 들을 Array 형태로 리턴한다.</h3>

<p>&nbsp; &nbsp; &nbsp;한마디로 하면 DOM의 Elements를 배열로 리턴하는 것이다</p>

<p>&nbsp; &nbsp; &nbsp; function disp(divs) {</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var a = [];</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (var i = 0; i &lt; divs.length; i++) {</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a.push(divs[i].innerHTML);</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $(&quot;span&quot;).text(a.join(&quot; &quot;));</p>

<p>&nbsp; &nbsp; &nbsp; }</p>

<p>&nbsp; &nbsp; &nbsp; disp( $(&quot;div&quot;).get().reverse() ); // div태그의 값들을 읽어 와서 그 값의 순서를 뒤집는다.</p>

<h2 style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 19px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; margin-top: 10px; margin-bottom: 10px; text-size-adjust: auto;"></h2>

<h2 style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 19px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; margin-top: 10px; margin-bottom: 10px; text-size-adjust: auto;">3. Selectors(선택자)</h2>

<table class="reference" style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; background-color: rgb(255, 255, 255); width: 633px; border-collapse: collapse; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; text-size-adjust: auto;">
	<tbody style="-webkit-font-smoothing: subpixel-antialiased;">
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<th align="left" style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; text-align: left; padding: 3px; background-color: rgb(229, 238, 204); vertical-align: top;" width="25%">Syntax</th>
			<th align="left" style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; text-align: left; padding: 3px; background-color: rgb(229, 238, 204); vertical-align: top;" width="75%">Description</th>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(this)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects the current HTML element</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;p:first&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects the first &lt;p&gt; element</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;.intro&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects all elements with class=&quot;intro&quot;</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;#intro&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects the first element with id=&quot;intro&quot;</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;ul li:first&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects the first &lt;li&gt; element of the first &lt;ul&gt;</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;ul li:first-child&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects the first &lt;li&gt; element of every &lt;ul&gt;</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;[href]&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects all elements with an href attribute</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;[href$=&#39;.jpg&#39;]&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects all elements with an href attribute that ends with &quot;.jpg&quot;</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;[href=&#39;#&#39;]&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects all elements with an href value equal to &quot;#&quot;</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;[href!=&#39;#&#39;]&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects all elements with an href value NOT equal to &quot;#&quot;</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(&quot;div#intro .head&quot;)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Selects all elements with class=&quot;head&quot; inside a &lt;div&gt; element with id=&quot;intro&quot;</td>
		</tr>
	</tbody>
</table>

<h3>//CSS ID</h3>

<p>$(&quot;#div1&quot;).css(&quot;border&quot;, &quot;3px solid red&quot;);</p>

<h3>//태그 element</h3>

<p>$(&quot;p&quot;).css(&quot;color&quot;,&quot;blue&quot;);</p>

<h3>//CSS class</h3>

<p>$(&quot;.test&quot;).css(&quot;color&quot;, &quot;green&quot;);</p>

<h3>//*: 모든요소</h3>

<p>$(&quot;*&quot;).css(&quot;font-size&quot;, &quot;15pt&quot;);</p>

<h3>//계층적(조상 -&nbsp;모든 자손)</h3>

<p>$(&quot;form input&quot;).css(&quot;border&quot;, &quot;2px solid blue&quot;);</p>

<h3>//계층적(조상의 1단계 자손만)</h3>

<p>$(&quot;#main &gt; *&quot;).css(&quot;border&quot;, &quot;3px double red&quot;);</p>

<p>E 태그명이 E인 요소(예를 들면 게시판의&nbsp;tr태그)</p>

<p>E:nth-child(n) 부모 요소를 기준으로 n번째 위치한 요소</p>

<p>E:first-child 부모 요소를 기준으로 첫번째 위차한 요소</p>

<p>E:last-child 부모 요소를 기준으로 마지막에 위치한 요소</p>

<p>E:checked checked 속성을 갖는 요소.</p>

<p>E:selected selected 속성을 갖는 요소</p>

<p>E:even 짝수 번째인 요소를</p>

<p>$(&quot;tr:even&quot;).css(&quot;background&quot;, &quot;#00FF00&quot;);</p>

<p>:odd 홀수 번째인 요소를</p>

<p>$(&quot;tr:odd&quot;).css(&quot;background&quot;, &quot;#FF0000&quot;);</p>

<p>:eq(n) 또는 :nth(n) n번째에 해당하는 요소</p>

<p>$(&quot;tr:eq(2)&quot;).css(&quot;color&quot;, &quot;silver&quot;);</p>

<p>:gt(n) n+1번째 보다 큰 요소</p>

<p>$(&quot;tr:gt(3)&quot;).css(&quot;color&quot;, &quot;red&quot;);</p>

<p>:lt(n) n+1번째 보다 작은 요소</p>

<p>:first 또는 :eq(0) 첫번째 요소</p>

<p>$(&quot;tr:first&quot;).css(&quot;background&quot;, &quot;#FFFF00&quot;).css(&quot;color&quot;, &quot;blue&quot;);</p>

<p>:last 마지막 요소</p>

<p>$(&quot;tr:last&quot;).css(&quot;background&quot;, &quot;#00FFFF&quot;);</p>

<p>:parent 대상 요소의 부모 요소</p>

<p>:contains(&#39;문자열&#39;) text 노드값에 &#39;문자열&#39;을 포함하는 요소</p>

<p>$(&quot;tr:contains(&#39;홍&#39;)&quot;).css(&quot;border&quot;, &quot;solid 3px green&quot;);</p>

<p><span style="-webkit-font-smoothing: subpixel-antialiased; font-family: Verdana; font-size: 14pt;">4. Attributes(속성)</span></p>

<p>$(&quot;#btn2&quot;).click(function(){ &nbsp;// 속성 확인하기&nbsp;</p>

<p>&nbsp; &nbsp; var str=$(&quot;#name&quot;).attr(&quot;type&quot;);</p>

<p>&nbsp; &nbsp; alert(str);</p>

<p>});</p>

<p></p>

<p>$(&quot;#btn3&quot;).click(function(){ &nbsp;// 속성 추가하기</p>

<p>&nbsp; &nbsp; $(&quot;#name&quot;).attr(&quot;disabled&quot;,&quot;disabled&quot;); //버튼을 클릭하면 변경불가속성 추가...</p>

<p>});</p>

<p></p>

<p>$(&quot;#btn4&quot;).click(function(){ &nbsp;// 속성 삭제하기</p>

<p>&nbsp; &nbsp; $(&quot;#name&quot;).removeAttr(&quot;disabled&quot;);</p>

<p>});</p>

<p>$(&quot;#btn5&quot;).click(function(){ &nbsp;</p>

<p>&nbsp; &nbsp; $(&quot;p:even&quot;).removeClass(&quot;blue&quot;);&nbsp;//짝수번째 클래스 삭제</p>

<p>&nbsp; &nbsp; $(&quot;p:first&quot;).addClass(&quot;under&quot;); //p태그 첫번째...라인 삽입</p>

<p>});</p>

<p>$(&quot;p&quot;).click(function(){</p>

<p>&nbsp; &nbsp; $(this).toggleClass(&quot;bk&quot;); //토글주기... p태그의 bk스타일 토글&nbsp;</p>

<p>});</p>

<p>$(&quot;#btn6&quot;).click(function(){ &nbsp;</p>

<p>&nbsp; &nbsp; var s = $(&quot;#div1&quot;).html(); &nbsp;//html태그 가져오기.</p>

<p>});</p>

<p>$(&quot;#btn7&quot;).click(function(){ &nbsp;</p>

<p>&nbsp; &nbsp; var s = $(&quot;#div1&quot;).html(&quot;&lt;input type=&#39;text&#39;/&gt;&quot;); &nbsp; //html input태그 변경</p>

<p>});</p>

<p><span style="-webkit-font-smoothing: subpixel-antialiased; font-family: Verdana; font-size: 14pt;">5. Manipulation(조작)</span></p>

<h3>&nbsp;내부삽입</h3>

<h3>&nbsp;1.append(content) - 모든 요소 내부에 컨텐츠를 추가한다.</h3>

<p>&nbsp; &nbsp; $(&quot;p:first&quot;).append(&quot;&lt;b&gt;hello&lt;/b&gt;&quot;);</p>

<h3>&nbsp;2.appendTo(content) - 요소의 내용을 다른 요소에 추가한다.</h3>

<p>&nbsp; &nbsp; $(&quot;span&quot;).appendTo(&quot;#div1&quot;);</p>

<h3>&nbsp;3.prepend(content) - 모든 요소 내부의 선두에 컨텐츠를 삽입한다.</h3>

<p>&nbsp; &nbsp; $(&quot;p&quot;).prepend(&quot;&lt;b&gt;앱&lt;/b&gt;&quot;);</p>

<h3>&nbsp;&nbsp;외부삽입</h3>

<h3>&nbsp;1.after(content) - 각 요소의 뒤로 컨텐츠를 삽입한다</h3>

<h3>&nbsp;2.before(content) - 각 요소의 전에 컨텐츠를 삽입한다.</h3>

<h3>&nbsp; 삭제</h3>

<h3>&nbsp;1.empty() - 요소 집합으로부터 모든 아이 요소를 삭제한다.</h3>

<h3>&nbsp;2.remove([expr]) - DOM으로부터 지정 조건에 합치하는 요소를 모두 삭제한다.</h3>

<h2 style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 19px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; margin-top: 10px; margin-bottom: 10px; text-size-adjust: auto;">jQuery css() Method</h2>

<p style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; background-color: rgb(249, 249, 249); text-size-adjust: auto;">jQuery has one important method for CSS manipulation: css()</p>

<p style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; background-color: rgb(249, 249, 249); text-size-adjust: auto;">The css() method has three different syntaxes, to perform different tasks:</p>

<ul style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; background-color: rgb(249, 249, 249); text-size-adjust: auto;">
	<li style="-webkit-font-smoothing: subpixel-antialiased;">css(<i style="-webkit-font-smoothing: subpixel-antialiased;">property</i>) - Return CSS property value</li>
	<li style="-webkit-font-smoothing: subpixel-antialiased;">css(<i style="-webkit-font-smoothing: subpixel-antialiased;">property,value</i>) - Set CSS property and value</li>
	<li style="-webkit-font-smoothing: subpixel-antialiased;">css({<i style="-webkit-font-smoothing: subpixel-antialiased;">properties</i>}) - Set multiple CSS properties and values</li>
</ul>


<h2 style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 19px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; margin-top: 10px; margin-bottom: 10px; text-size-adjust: auto;">6. jQuery Events(아래 내용중 * 부분이 자주 사용됩니다.)</h2>

<p style="-webkit-font-smoothing: subpixel-antialiased; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; background-color: rgb(249, 249, 249); text-size-adjust: auto;"></p>

<h3></p>

<table class="reference" style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; background-color: rgb(255, 255, 255); width: 633px; border-collapse: collapse; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: verdana, helvetica, arial, sans-serif; text-size-adjust: auto;">
	<tbody style="-webkit-font-smoothing: subpixel-antialiased;">
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<th align="left" style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; text-align: left; padding: 3px; background-color: rgb(229, 238, 204); vertical-align: top;" width="35%">Event Method</th>
			<th align="left" style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; text-align: left; padding: 3px; background-color: rgb(229, 238, 204); vertical-align: top;" width="65%">Description</th>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(document).ready(function)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Binds a function to the ready event of a document<br style="-webkit-font-smoothing: subpixel-antialiased;" />
			(when the document is finished loading)</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(<i style="-webkit-font-smoothing: subpixel-antialiased;">selector</i>).click(function)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Triggers, or binds a function to the click event of selected elements</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(<i style="-webkit-font-smoothing: subpixel-antialiased;">selector</i>).dblclick(function)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Triggers, or binds a function to the double click event of selected elements</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(<i style="-webkit-font-smoothing: subpixel-antialiased;">selector</i>).focus(function)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Triggers, or binds a function to the focus event of selected elements</td>
		</tr>
		<tr style="-webkit-font-smoothing: subpixel-antialiased;">
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">$(<i style="-webkit-font-smoothing: subpixel-antialiased;">selector</i>).mouseover(function)</td>
			<td style="border-style: solid; border-color: rgb(195, 195, 195); -webkit-font-smoothing: subpixel-antialiased; padding: 3px; vertical-align: top;">Triggers, or binds a function to the mouseover event of selected elements</td>
		</tr>
	</tbody>
</table>

<p>&nbsp; $(&quot;#btn1&quot;).bind(&quot;click&quot;, function(event){</p>

<p>&nbsp; &nbsp; alert(&quot;안녕!!&quot;);</p>

<p>&nbsp; })</p>

<p>&nbsp; .bind(&quot;mouseover&quot;, function(event){</p>

<p>&nbsp; &nbsp; alert(&quot;안녕!!&quot;);</p>

<p>&nbsp; });</p>

<p>&nbsp; //이미지위에 마우스가 올려졌을때 그림이 바뀐다</p>

<p>&nbsp; $(&quot;#img1&quot;).mouseover(function(){</p>

<p>&nbsp; &nbsp; $(this).attr(&quot;src&quot;,&quot;&lt;%=cp%&gt;/img/2.jpg&quot;);</p>

<p>&nbsp; });</p>

<p>&nbsp; //이미지위에 올린 마우스를 떼면 원상태로 돌아간다</p>

<p>&nbsp; $(&quot;#img1&quot;).mouseout(function(){</p>

<p>&nbsp; &nbsp; $(this).attr(&quot;src&quot;,&quot;&lt;%=cp%&gt;/img/1.jpg&quot;);</p>

<p>&nbsp; });</p>

<p>&nbsp; //이벤트가 한번 실행되고 해제</p>

<p>&nbsp; $(&quot;#btn3&quot;).one(&quot;click&quot;,function(){</p>

<p>&nbsp; &nbsp; alert(&quot;..............&quot;);</p>

<p>&nbsp; });</p>

<p>//요소에서 포커스를 잃을 경우에 발생하는 이벤트 입니다.</p>

<p>&nbsp; .blur()&nbsp;&nbsp;</p>

<p>// &lt;input /&gt;, &lt;textarea /&gt;, &lt;select /&gt; 요소의 값 변경시 발생하는 이벤트 입니다.</p>

<p>&nbsp;.change()</p>

<p>// *마우스 클릭 시 발생하는 이벤트 입니다.</p>

<p>&nbsp;.click()</p>

<p>//&nbsp;마우스를 더블클릭 했을 경우 발생하는 이벤트 입니다.</p>

<p>&nbsp;.dblclick()</p>

<p>// 요소에 포커스 되었을 때 발생하는 이벤트 입니다.</p>

<p>&nbsp;.focus()</p>

<p>// 마우스가 요소 위에 위치했을 때 발생하는 이벤트 입니다.</p>

<p>&nbsp;.hover()</p>

<p>// 키 입력 시 발생되는 이벤트이며, 모든 키에 대해 적용이 됩니다.</p>

<p>&nbsp;.keydown()</p>

<p>//&nbsp;keydown 이벤트와 동일하게 키 입력 시 발생이 되지만&nbsp;&nbsp;enter, tab등의 특수키에는 이벤트가 발생되지 않습니다</p>

<p>&nbsp;.keypress()</p>

<p>//&nbsp;키 입력 후 발생되는 이벤트 입니다.</p>

<p>&nbsp;.keyup()</p>

<p>//&nbsp;마우스 클릭 시 발생하는 이벤트입니다.</p>

<p>&nbsp;.mousedown()</p>

<p>//&nbsp;선택한 요소의 영역에 마우스가 위치했을 때 발생되는 이벤트 입니다.</p>

<p>&nbsp;.mouseenter()</p>

<p>&nbsp;선택한 요소의 영역에서 마우스가 벗어 났을 때 발생되는 이벤트 입니다.</p>

<p>&nbsp;.mouseleave()</p>

<p>//&nbsp;선택한 요소의 영역에서 마우스가 벗어 났을 때 발생되는 이벤트입니다.</p>

<p>&nbsp;.mouseout()</p>

<p>//&nbsp;마우스 클릭 후 발생되는 이벤트입니다.</p>

<p>&nbsp;.mouseup()</p>

<p>//&nbsp;*DOM화면이 모두 준비 되었을 때 발생하는 이벤트입니다.</p>

<p>&nbsp;.ready()</p>

<p>//&nbsp;*화면이 resize 될 경우 발생하는 이벤트입니다.</p>

<p>&nbsp;.resize()</p>

<p>//&nbsp;*HTML 문서가 스크롤 되었을 때 발생하는 이벤트입니다.</p>

<p>&nbsp;.scroll()</p>

<p>//&nbsp;선택한 개체를 마우스를 통해 선택 하였을 때 발생하는 이벤트입니다.</p>

<p>&nbsp;.select()</p>

<p>// *Form개체에서 Submit이 일어날 때 발생하는 이벤트입니다.</p>

<p>&nbsp;.submit()</p>

