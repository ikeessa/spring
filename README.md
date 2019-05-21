# Introduction
대학교 3학년 마치고 휴학중 2018년 IT 회사 인턴으로 일하면서 프로그래밍에 재미를 느끼기 시작하였습니다. </br>
2019년 1월 현재 대학교 4학년 1학기를 마치고 스프링을 공부하면서 취업 활동을 하고 있습니다. </br>
아래의 ASP 프로젝트들은 인턴 생활하면서  공부하면서 만들었습니다.


# 스프링 프로젝트 개발 환경
OS - Win10</br>
IDE - Eclipse(VERSION : Oxygen)</br>
Language - JAVA(VERSION : JDK 1.8),JSTL(2.5),JSP,HTML5,BOOTSTRAP TEMPLATE(DASHGUM)</br>
미들웨어 - TOMCAT(VERSION : 8.0)</br>
DBMS - MySQL (VERSION : 5.6.42)</br>
FRAMEWORK : SPRING@MVC (VERSION :4.1.6)</br>
ORM : MYBATIS (VERSION : 1.2.2)

# Spring Project
1.게시판 만들기
![default](https://user-images.githubusercontent.com/21051557/51041208-c2768580-15fc-11e9-9718-2d440107b396.PNG)
![default](https://user-images.githubusercontent.com/21051557/51041209-c2768580-15fc-11e9-9eb4-6bbd6730e9b9.png)
Spring Framework 와 mysql 을 이용해 게시판 작성 및 목록을 만들고 </br>
기본적인 CRUD 구현을 하였습니다.

# ASP Project

1.게시판 만들기
![default](https://user-images.githubusercontent.com/21051557/50974604-faaf9280-152e-11e9-8bb6-09fd5000e4a0.png)
ASP 언어를 이용해 작성하였고 검색,페이징,파일 업로드 및 다운로드 기능을 구현하였습니다.</br>
https://github.com/ikeessa/asp/blob/master/ASP/list.asp

2.트리 구조 만들기(클릭시 그 안의 트리 내용이 펼쳐짐),파일이 존재할 경우 빨강색
![default](https://user-images.githubusercontent.com/21051557/50974608-faaf9280-152e-11e9-9408-c9958b78042d.png)
ASP 언어를 이용해 작성하여 트리 구조 만들었고 제이쿼리를 이용해 트리 클릭시 하위 트리 내용이 펼쳐지게 하였습니다.</br>
파일이 존재하는가에 대해서는 파일에 확장자명 .png , .jpg 등을 split 으로 잘라서 체크하였습니다.</br>
파일이 존재할 경우 빨강색표시로 나타납니다.</br>
https://github.com/ikeessa/asp/blob/master/ASP/index.do
      

3.엑셀 데이터를 DB에 간편하게 넣을 수 있는 프로그램
![split](https://user-images.githubusercontent.com/21051557/50974609-fb482900-152e-11e9-82c5-fcf5abbdfbb7.png)
처음에 acro editor 를 이용해 db insert value 값에 각각의 엑셀의 열을 넣고 insert 하는 식으로 하였지만 </br>
반복작업이 너무 심해서 프로그램을 만들었습니다.</br>
엑셀의 각 셀이 탭으로 구분 되어있고 줄이 내려가면 엔터로 되어있기 때문에 탭과 엔터를 split으로 잘라서 </br>
해당 내용들을 각 칼럼에 맞게 버튼 클릭시 한꺼번에 insert 되도록 하는 프로그램을 만들었습니다. </br>
https://github.com/ikeessa/asp/blob/master/ASP/insert.do </br>
https://github.com/ikeessa/asp/blob/master/ASP/insert_proc.do

4.기타 업무
![default](https://user-images.githubusercontent.com/21051557/50974606-faaf9280-152e-11e9-910a-cd441c53db03.png)
선임의 기존의 소스와 홈페이지에 적용된 템플릿 소스를 이용해 이러한 폼 등을 새로 만들고 수정하는 작업 등을 하였습니다. </br>
+버튼을 누를시 제이쿼리 클론을 이용해 행이 추가 되는 작업을 하였습니다. </br>
부트 스트랩(템플릿) 뿐만 아니라 ASP,JQuery,AJAX 백엔드 소스도 작성 하였습니다.
