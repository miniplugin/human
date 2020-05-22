## 화면구현 (v3.0.0)
 
---

- [학습목차](https://github.com/miniplugin/human)
- 능력단위 요소: 2001020225_16v4

---

### 학습개요(아래)

- 응용소프트웨어를 개발하기 위한 기초기술 소개와 활용.

### 학습목표(아래)

- UI 요구사항을 확인하여 설계한 UI 설계를 기반으로 화면을 구현할 수 있다.

### 핵심키워드(아래)

- UI(User Interface), UI요구사항, UI표준, UI설계서, 소프트웨어 아키텍처(Software Architecture),
HTML/CSS, JavaScript, 웹 접근성(Web Accessibility), 웹 호환성(Cross Browsing), UI테스트 

### UI 설계 확인하기(아래)

- 카카오 오븐에서 제작한 와이어프레임 화면설계의 폼의 흐름을 확인하고 제약사항과 화면의 폼 흐름을 구현에 반영하
도록 설계를 확인한다.
- 실습결과: 5개메뉴 및 5개페이지 (HOME, WE ARE, WORK, BLOG, CONTACT) 확인.
- 유즈케이스실습참조: https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:dev2:imp:editor:uml_editor:use_case_diagram_editor
- 유즈케이스실습결과: 전자정부표준프레임웍 Hello World MVC 프로젝트에서 실습.

### UI 구현하기(아래)

- 벤치마킹 웹 사이트1: http://edu19.dothome.co.kr/metro/sub.php/CATEGORY/2/MENU_CODE/001001006
- 위 벤치마킹 사이트1 콘텐츠를 본인 것으로 대체할 이미지를 준비한다.( https://pixabay.com/ko/ 무료이미지를 사용 )
- 위 벤치마킹 사이트1 기준으로 본인의 콘텐츠를 html로 제작하여 구조화 시킨다.( Hello World MVC 프로젝트 home.jsp기준 )
- 벤치마킹 웹 사이트2: http://edu19.dothome.co.kr/metro/sub.php/CATEGORY/2/MENU_CODE/001001007
- 벤치마킹 웹 사이트3: http://edu19.dothome.co.kr/study_response4.html
- 위 벤치마킹 웹사이트3 기준으로 CSS와 자바스크립트를 이용하여 퍼블리싱 한다.

### 참고자료 출처(아래)

- 위에 사용된 소프트웨어는 자유SW 또는 GNU / LGPL / MIT license 입니다.
- [NCS학습모듈] https://ncs.go.kr/unity/th03/ncsSearchMain.do :/정보통신/정보기술/정보기술개발/화면 구현
- [카카오오븐-화면설계 온라인 툴] 무료회원가입필요 https://ovenapp.io/
- [픽사베이-무료이미지 사용] https://pixabay.com/ko/
- [강사자료] http://edu19.dothome.co.kr/metro/index.html
- html 기본태그 연습(아래)

```
<!-- head 태그 안에 들어가는 내용 시작 -->
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scaleable=no">
<title>html5 테스트 입니다.</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<style></style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//위 jquery 자바스크립트 사용 기본형식(아래)
$(document).ready(function($) {
	alert();//여기에 사용자 액션 내용을 입력하시면 됩니다.
})
</script>
</head>
<!-- head 태그 안에 들어가는 내용 끝 -->
<!-- body 태그 안에 들어가는 내용 시작 -->
<body>
	<h1>HTML 이란?</h1>
	<h2>HTML 의 역사</h2>
	<h3>팀 버너스리에 대해</h3>
	<h4>HTML 의 태그</h4>
	<h5>HTML 의 태그</h5>
	<a href="www.conol.tistory.com"> conol 티스토리로 가자! </a>
	<img src="/images/conol.jpg" alt="">
	<p>
		<strong>이것은</strong> 문단입니다.<br> <b>이것은</b> 문단입니다.
	</p>
	<p>
		이것은&nbsp;&nbsp;&nbsp;&nbsp; &amp; &lt; &gt; &gt; &copy; &nbsp;&nbsp;&nbsp;&nbsp;문단입니다.
	<hr>
	이것은 문단입니다.
	</p>
	<ul>
		<li>리스트 1</li>
		<li>리스트 2</li>
	</ul>
	<ol>
		<li>리스트 1</li>
		<li>리스트 2</li>
	</ol>
	<div>
		<h2>회원가입폼 입니다.</h2>
		<form method="GET" action="http://localhost:8080/"
			class="adminlogin_form">
			성별을 선택해 주세요
			<select name="score">
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select> 
			<br>
			<input type="text" name="userid" preholder="user ID"> <input
				type="password" name="password" preholder="user password"> <input
				type="file"> <br> 본인소개글 작성:
			<textarea name="contents" cols="100" rows="5">여기에 글을 입력</textarea>
			<input type="submit" name="submit" value="회원가입" class="login">
		</form>
	</div>
	<br>
	<br>
	<br>
	<table summary="00학교 00반 성적표" style="border: 1px solid black">
		<!-- 인라인 스타일 주기 -->
		<caption>이 테이블은 학생들의 성적표 입니다.</caption>
		<tr>
			<th>이름</th>
			<th>성적</th>
		</tr>
		<tr>
			<td>김일국</td>
			<td>15</td>
		</tr>
		<tr>
			<td colspan="2">BBB</td>
		</tr>
		<tr>
			<td>CCC</td>
			<td>C</td>
		</tr>
	</table>
</body>
```