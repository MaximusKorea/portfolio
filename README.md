CGV 영화예매사이트 포트폴리오

<개요>

 - Spring Framework를 기반으로 한 영화예매 사이트

 - 웹 프로젝트에서 생성한 화면
   1. 관리자(회원, 영화, 상영스케쥴, 상품, 공지사항 및 1:1문의, 영화대여관리)
   2. 메인(회원가입, 로그인, 아이디-비밀번호찾기, 공지사항, 영화예매, 상품구입, 리뷰, SHOP&GAME)
   3. 로그인 했을 시  고객센터, 마이페이지(정보수정, 예매내역, 주문내역, 회원탈퇴, 포인트사용내역)
      메뉴가 보여지며 예매, 대여 시 카드결제 
 
   4. 웹 화면에서 페이징 처리, 첨부파일 업로드, Ajax를 이용한 데이터 처리,
      카카오 API를 이용해 우편번호, 지도, 로그인과 예매 및 대여 시 카드결제 기능이 되도록 구현,
      CSS, Bootstrap, JavaScript, jQuery, Ajax 로 View 단을 처리

- 개발 인원 : 5명
- 기여한 부분 : 메인 화면 일부, 로그인 , 회원가입, 아이디 찾기, 비밀번호 찾기

<개발 환경>
- OS : Windows 10
- DB : Oracle 11g
- 언어 : Java, jQuery, Ajax, Json
- 도구 : eclipse, Bootstrap, Spring, MyBatis, kakao developers, I'mport

<개발 파트>
- 기여한 부분 : 메인 화면 일부, 로그인, 회원가입, 아이디 찾기, 비밀번호 찾기

--Main--

![image](https://user-images.githubusercontent.com/78652436/127478820-4ba8530d-4096-4bb1-a242-3d21f5fbb833.png)

1. 클릭 시 메인이동 
2. 페이지 이동을 위한 메뉴 바
3. 페이지 이동을 위한 메뉴 바
4. 슬라이드 배너
5. Float 배너
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
![image](https://user-images.githubusercontent.com/78652436/127479346-b7e0ec62-4137-4eee-af5f-30566f2bcdf5.png)

1. 트레일러 예고편 플레이 가능
2. 상영 예정인 영화 메인에 표시
3. 예매완료한 예매율 표시, 영화이름 선택 시 트레일러 동영상 변경됨
4. 현재 위치 날씨, 세계 날씨 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
![image](https://user-images.githubusercontent.com/78652436/127479882-4e3d6a52-f521-4e55-bcce-a2a44f0dbe3d.png)

1. 메뉴 클릭 시 하단 배너 오픈
2. 클릭한 배너 표시
3. 기본 광고 배너 표시
4. Include 메인 하단 표시(링크, 사이트맵 추가)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--회원가입--

![image](https://user-images.githubusercontent.com/78652436/127480231-909f95a8-f19c-4620-ad4b-8d62be053e78.png)

1. 필수 입력필드 체크
2. 우편번호 팝업
3. 회원가입 / 취소

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--로그인--

![image](https://user-images.githubusercontent.com/78652436/127480417-d975776b-9855-4f71-af7f-c3a7382744e9.png)

1. 로그인 필수 입력 체크
2. 자동 로그인 방지
3. 카카오계정 로그인

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
![image](https://user-images.githubusercontent.com/78652436/127480610-f9ec4132-1600-4a58-b0da-3aae2599cb93.png)

1. 카카오계정으로 로그인
2. 회원가입 없이 사이트 로그인 가능

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--아이디 찾기--

![image](https://user-images.githubusercontent.com/78652436/127480816-aec3b83b-6f50-4c54-b8e5-e0981a815b08.png)

1. 필수 입력 필드 체크
2. 아이디 찾기 시 팝업 호출

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--비밀번호--

![image](https://user-images.githubusercontent.com/78652436/127480976-cbe402ca-fb20-4369-8caf-08687899aa05.png)

1. 필수 입력 필드 체크
2. 비밀번호 찾기 시 팝업 호출
3. 이메일 일치 시 Email로 비밀번호 전송
