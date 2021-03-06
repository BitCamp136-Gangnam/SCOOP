![logo](https://user-images.githubusercontent.com/54266124/74079985-1fec3880-4a82-11ea-9679-62d269bf151b.png)
# SCOOP
 SCOOP은 약 6주간 준비한 비트캠프 2조(팀명: 400과 500사이)의 파이널 프로젝트입니다. 6개월 간의 배운 것을 총 활용해서 만든 프로젝트이며, 6명의 팀원이 함께 만들었습니다.
<br><br>
 SCOOP(Social Cooperation)은 ‘여러 기업들의 프로젝트 진행에 최적화된 협업툴’ 입니다. 기업들은 SCOOP에서 프로젝트를 생성하여 효율적으로 일정 관리 및 자료 공유를 할 수 있으며, 이로써 원활한 프로젝트 진행이 가능합니다.
<br><br>
SCOOP은 https://www.collabee.co (콜라비)를 모티브로 하는 사이트로 ‘콜라비’의 칸반 방식이 가진 장점과 ‘잔디’의 실시간 커뮤니테이션이 가능하다는 장점을 모두 취합니다. 뿐만 아니라 일정 진행률을 한눈에 파악할 수 있도록 차트를 제공하여 프로젝트의 현황을 좀 더 쉽게 파악합니다.
<br><br>
 SCOOP에서 제공하는 주요 기능은 칸반, 채팅, 협업공간 관리, 멘션, 파일 공유, 캘린더 등이 있습니다.
<br><br><br>
## 주제선정배경
기존에 사용되는 여러 가지 협업툴들은 각기 다른 강점들을 가지고 있지만 몇 가지 아쉬운 점들이 있었습니다.<br><br>

- <콜라비 – 채팅 기능이 없어서 실시간 커뮤니케이션이 힘들다.>
예를 들어, 콜라비의 경우 멘션 기능을 제공하기 때문에 편리하게 카테고리 분류가 가능했지만 채팅 기능이 없어서 팀원들과 실시간 커뮤니케이션을 하기에는 무리가 있습니다.<br><br>
- <Trello – 다양한 업무의 기한들을 한 번에 파악하기 힘들다>
Trello의 경우 칸반 형식을 제공하기 때문에 직관적으로 업무의 상황들을 파악하긴 쉽습니다. 하지만 일정관리 부분에 있어서는 사용자들에게 익숙한 캘린더 이미지가 아닌 텍스트 형식을 제공하고 있습니다.<br>

그렇기에 여러 가지 업무들을 마감 기한을 기준으로 업무를 파악하여 사용자가 원하는 대로 업무를 수정하기란 쉽지 않습니다. <br><br>

- <Slack - 사이드 바에 업무들이 정렬되어 업무간 관계 파악이 힘들다>
또 다른 예시로는 Slack이 있습니다. Slack은 기본적으로 동료간 의사소통에 큰 강점을 가지고 있지만 업무들의 정보나 업무들 간의 관계를 파악하는 것은 제한적입니다.<br>

이렇듯 많이 사용되는 대표적인 협업툴인 콜라비와 Trello, Slack은 각각의 협업툴이 취하고 있는 형태에서 그 강점이 나오고 있으나 반대로 그 형태로 인한 단점들이 존재합니다.<br>

위에서 짚고 넘어갔듯이 ‘Trello’는 칸반 형식 덕분에 업무들의 상황을 직관적으로 파악할 수 있지만 일정 관리 측면이 취약하고, ‘콜라비’는 멘션과 칸반 기능으로 일정 관리는 비교적 편리하지만 채팅 기능이 없는 점이 아쉽습니다. ‘Slack’의 경우 의사소통 강화를 위해 메신저 형태를 띄고 있지만 이로 인해 업무간 관계를 파악하기가 어렵습니다.<br>

SCOOP은 이러한 점에 착안하여 콜라비, Trello에서 가능한 직관적인 업무 파악과 함께 Slack의 동료간 실시간 커뮤니케이션의 용이함을 모두 챙긴 협업툴입니다.<br>

## Target
- 개발 입문자, 학생 : 직관적인 UI로 인하여 협업툴을 사용하기 편리하다.
- 기업 : 간편한 단축키를 사용하며 빠르게 협업이 가능하다.

<br>

## 프로젝트 기본 설정
- 기본색 : #E71D36(울트라 레드), #FFF(화이트), #000 (검정)
- 기본 폰트 : font-family : "BinggraeMelona"
- DB설정 : Document폴더 안에 DB폴더 안에 DDL.txt의 DDL문을 실행시키고 난 뒤 Trigger.txt의 Trigger을 하나씩 실행시킨다.
<br> 그리고 root-context.xml파일의 url, username, password를 알맞게 변경한다.
<br>

## SCOOP 메인화면<br>
![main](https://user-images.githubusercontent.com/54266124/74079444-fb409280-4a7a-11ea-8ef1-34fad0c11a08.png)
- SCOOP의 메인 화면에서는 자신이 속한 협업공간의 새로운 이슈가 올라온 순서대로 보여주고, 협업공간들의 일정 진행도를 한눈에 볼 수 있게 Chart js를 이용하여 데이터를 보여주고 있습니다.

## SCOOP 주요기능<br>
### 1. 이슈작성 <br>
![issuemake](https://user-images.githubusercontent.com/54266124/74079596-ecf37600-4a7c-11ea-8161-307e5aff01a4.png)
- 첫번째는 이슈 작성으로 이슈 설명을 입력하는 부분에서 @를 입력하면 멘션, 구글드라이브, 파일, 할 일, 일정을 사용할 수 있게 됩니다. 그리고 또한 이슈 설명에 링크를 작성하면 자동으로 <a>태그를 달아 링크로 이동할 수 있게하였으며 이는 파일함(Ctrl + .)에 저장되게 됩니다.
- 멘션은 선택한 협업공간의 멤버를 언급하여 알람을 줄 수 있고, 구글 드라이브는 GooglePicker API를 사용하여 파일들을 업로드할 수 있게 하였고, 파일은 여러 파일들을 업로드하고 다운로드 받을 수 있게 구현하였고 파일도 파일함(Ctrl + .)에 저장됩니다. 할 일은 협업공간의 멤버를 선택하여 할 일을 주어 알람이 가게하였고, 일정은 DatePicker를 사용하여 날짜를 선택할 수 있게 하였습니다.<br>
 
### 2. 캘린더 <br>
![calendar](https://user-images.githubusercontent.com/54266124/74079840-35f8f980-4a80-11ea-94e0-0fd5b70c6d6a.png)
- 두번째는 캘린더로 FullCalendar를 사용했습니다. 이슈작성에서 일정을 선택하여 글을 작성하면 캘린더에 자동으로 반영이되고 또한 캘린더에서 일정을 추가 할 경우에도 이는 새로운 이슈작성과 동일하게 됩니다.
- 캘린더는 모든 협업공간에서 일어나는 일정을 한눈에 볼 수 있어 편리하고, 마우스를 갖다 대면 이슈의 상세설명을 볼 수 있으며 클릭하면 내용을 수정할 수 있는 모달이 나와 편리합니다. 또한 캘린더의 이슈를 Drag&Drop만 해도 비동기로 일정을 변경할 수 있고 이슈를 늘리거나 줄여서 비동기로 일정을 변경할 수도 있습니다. <br>

### 3. 칸반 <br>
![kanban](https://user-images.githubusercontent.com/54266124/74079944-7d33ba00-4a81-11ea-987b-97522f2c86cc.png)
- 세번째는 칸반으로 현재 협업공간에서 일어나는 이슈들의 진행도를 한 눈에 볼 수 있어 편리합니다. 이슈들을 Drag&Drop만 해도 이슈의 진행도를 비동기로 변환할 수 있어 간단하고 이슈를 클릭하면 상세페이지로 이동하게 했습니다. 또한 메인페이지의 차트의 데이터는 칸반과 연동이 됩니다.<br>
### 4. 채팅 <br>
![chatting](https://user-images.githubusercontent.com/54266124/74080193-a7d34200-4a84-11ea-9939-8418da602bdd.png)
- 네번째는 채팅으로 자신이 속해있는 협업공간 별로 채팅방이 존재하고 입장하면 같은 협업공간 멤버들끼리 채팅을 나눌 수 있어 실시간 커뮤니케이션을 가능하게 하였습니다. 채팅은 SpringWebsocket을 사용하여 구현하였습니다.<br>

## SCOOP 설계
### E-R 모델링
![1](https://user-images.githubusercontent.com/54266124/74016777-59676a00-49d6-11ea-9b5b-753bf9a714d5.PNG)
![2](https://user-images.githubusercontent.com/54266124/74016788-5bc9c400-49d6-11ea-8212-8a38d73dd31e.PNG)

<br>

### Oracle Trigger
![trigger](https://user-images.githubusercontent.com/54266124/74080680-1e267300-4a8a-11ea-9e0c-ebf2ca248446.png)
- INSERT_TRI_ROLE : 새로운 회원이 가입할 경우 자동으로 'ROLE_UESR'라는 권한을 줌
- INSERT_TRI_SETTING : 새로운 회원이 가입할 경우 알람기능은 꺼져있는 상태를 줌
- INSERT_TRI_TPMEMBER : 회원이 새로운 협업공간을 만들면 협업공간의 멤버로 등록하게 해줌
- INSERT_TISSUE_ALERT : 회원이 협업공간에서 새로운 이슈를 작성할 경우 같은 협업공간의 멤버들에게 새로운 이슈로 등록되게 해줌
- INSERT_REPLY_ALERT : 회원이 이슈에서 댓글을 작성할 경우 같은 협업공간의 멤버들에게 새로운 댓글로 등록되게 해줌
- INSERT_PJNOTICE_ALERT : 협업공간의 팀장이 새로운 협업공간 공지사항을 작성할 경우 같은 협업공간의 멤버들에게 새로운 공지사항으로 등록되게 해줌
<br>

### Class Diagram
#### 회원가입, 로그인
![login](https://user-images.githubusercontent.com/54266124/74080902-123bb080-4a8c-11ea-99a2-b3f93f5dd6fb.PNG)
#### 협업공간
![project](https://user-images.githubusercontent.com/54266124/74080905-14057400-4a8c-11ea-91c7-63f7b051648b.PNG)
#### 이슈작성
![issue](https://user-images.githubusercontent.com/54266124/74080908-149e0a80-4a8c-11ea-87fa-91d8c11ec916.PNG)

## 사용기술
### Front
- JavaScript, HTML, CSS
- jQuery, Ajax, Bootstrap
- EL, JSTL
- Chart.js, FullCalendar, Flatpickr
- SweetAlert, FontAwesome
### Back
- Java
- SpringFramework, Mybatis, Spring Security, Spring Websocket, Spring Locale
- Node.js, Jackson-Core
- Velocity, JavaMailSender
### Server
- Apache Tomcat, aws
### DB
- Oracle
### OpenAPI
- 네이버 로그인 API, 구글 로그인 API
- GooglePicker API, 카카오주소API
- 아임포트 API, 데이터크롤링RestAPI, 채널톡 API
### Tool
- SpringToolSuite4, Eclipse, VisualStudioCode
- exERD, SourceTree
## 형상관리 및 도구
### Git : SourceTree, GitBash
![sourcetree](https://user-images.githubusercontent.com/54266124/74081116-ba527900-4a8e-11ea-9ea5-a1feea5197fb.png)
