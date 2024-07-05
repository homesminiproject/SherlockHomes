셜록홈즈 부동산 웹페이지 미니프로젝트<br>

구현 영상 주소 : https://www.youtube.com/watch?v=4fGePRgmP64 <br><br><br>

# SherlockHomes(셜록홈즈)
부동산 웹 프로젝트<br>
<b>기간 : 2024.04.10 ~ 2018.12.19(10일 간 일 8시간)</b><br>
<b>환경 : Apache Tomcat 8.0, Chrome 브라우저</b><br>
<b>주제 : 부동산 거래 </b><br>
<b>개발 : Eclipse Photon, Oracle</b><br>
<b>사용 언어 : JAVA(JDK 1.8), Oracle SQL(11g Express), Html5, CSS3, Javascript, JSP&Servlet</b><br>
<b>사용 기술 : JDBC, MVC모델2, jQuery, Ajax, Open API(다음카카오,네이버), Mail API, hightchart</b><br>
<b>디자인 프레임워크 : Material Design Lite</b><br>

# 프로젝트 상세내용
## 주제 선정 이유
<pre>
* 최근 사회적인 전세 사기를 줄이기 위한 프로젝트로
  전세사기는 국가 및 공인중개사 모두 책임을 지지 않고 있는 현 상황에서 최소한이라도 전세 사기를 조장하는 부동산 업자들ㅇ게
불이익을 주고 임차인을 보호하는 것을 목표로 선정하게 되었습니다.<br>
</pre>

## 목적
<pre>
1. 매물 열람 시, 다른 매물과 세분화된 매물 비교 불편함<br>
 - 관심목록에 있는 매물끼리 실시간 비교 가능<br>
2. 관리자만 열람할 수 있는 허위 매물 리스트<br>
 - 신고된 허위매물을 다른 세입자도 열람 가능<br>
3. 기존 웹에서는 제공하지 않는 계약서 서비스<br>
 - 거래 계약서까지 제공<br>
</pre>

## 요구사항 분석
![image](https://github.com/homesminiproject/SherlockHomes/assets/78581994/e8ba4ff8-4c78-4698-a0f8-1df154a9f213)

## Exerd 테이블 명세
![Uploading image.png…]()


## 구동 화면
* 골라방 메인화면<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/01.%EB%A1%9C%EA%B7%B8%EC%9D%B8%2C%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%20%EB%B0%8F%20%EB%A9%94%EC%9D%B8%EB%A9%94%EB%89%B4/1-1.%EB%A9%94%EC%9D%B8%ED%99%94%EB%A9%B4.jpg)
* 방 검색<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/02.%EB%B0%A9%20%EC%B0%BE%EA%B8%B0/1-2.%EB%B0%A9%20%EA%B2%80%EC%83%89.jpg)
* 방 비교하기<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/03.%EA%B4%80%EC%8B%AC%EB%AA%A9%EB%A1%9D/3.%EB%B0%A9%20%EB%B9%84%EA%B5%90%ED%95%98%EA%B8%B0.jpg)
* 방 등록하기<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/04.%EB%B0%A9%20%EB%82%B4%EB%86%93%EA%B8%B0/1.%EB%B0%A9%20%EB%82%B4%EB%86%93%EA%B8%B0.jpg)
* 계약서<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/05.%EA%B1%B0%EB%9E%98%20%EA%B4%80%EB%A6%AC/2-3.%EA%B1%B0%EB%9E%98%20%EC%A7%84%ED%96%89%EC%83%81%ED%99%A9(%EA%B3%84%EC%95%BD%EC%84%9C).jpg)
* 방 정보 보기<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/06.%EB%A7%A4%EB%AC%BC%20%EC%A0%95%EB%B3%B4/1.%EB%A7%A4%EB%AC%BC%EC%A0%95%EB%B3%B4.jpg)
