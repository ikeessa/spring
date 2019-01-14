<%@ codepage="65001" language="VBScript" %>
<%
	<!--#include virtual = "jsonObject.class.asp" -->

   '1.변수 선언
    'option explicit
    dim objDBConn,objRs
    dim dsntest
    dim intSeq,strSql
    dim intNowPage, intTotalCount, intTotalPage, intBlockPage, intPageSize
    dim strsearchWord,strSearchString,strSearchSql,blnSearch
    dim intTemp,intLoop
    dim AscDesc



    '2.받아온 변수 값 저장
    intNowpage = Request.QueryString("page")
    strSearchWord = Request.Querystring("Search_word")
    intpagesize = Request.Querystring("intpagesize")
    strSearchString = Request.Querystring("Search_String")
    AscDesc = Request.Querystring("AscDesc")

	
	
	'3.선언한 변수 초기화
    blnSearch=False
    
    intblockpage=10
    if AscDesc = "" then
    AscDesc = 0
    end if
	
    if intpagesize = "" then
    intpagesize = 200
    end if
	'변수값이 지정되지않아서 일단 len
    if len(intNowpage)=0 then
        intNowpage=1
    end if
    
	'4.sql 조건문 변수에 저장
    if len(strSearchString) <> 0 then
        blnsearch = true
        strSearchSql = " Where " &strSearchWord
        strSearchSql = strSearchSql & " like '%" & strSearchString & "%'" 
    end If

	'5.Totalpage Totalcount 를 변수에 저장시키기 위해 sql문을 열고 (게시물 세기)
	
    'strSql = "Select Count(*)"
    'strSql = strSql & ",Ceiling(cast(Count(*) as float)/" &intpagesize & ")" 
	'게시물 세기에 검색어 조건 넣기
    'strSql = strSql & " from board"
    'if blnSearch then
    'strsql = strsql & StrSearchSql
    'end If

    '6.DB  열기
    set objDBConn = Server.CreateObject("ADODB.connection")
    set objRs = Server.CreateObject("ADODB.recordset")

    dsntest="driver={sql server};server=erns.co.kr;uid=ikeessa;pwd=123456;database=saehim"
    objDBConn.open dsntest
    'objRs.open strSql,objDBConn
	
	'rs를 통해 변수에 값 저장시키고
    'intTotalCount = objRs(0)
    'intTotalPage = objrs(1)
	'변수에 저장시켰고 뒤에 sql문에 rs를 또 적용시켜야 하기 때문에 닫는다
    'objrs.close
	
	'7.sql select top (상위 정렬) intnowpage(현재 페이지) * intpagesize(몇개의 페이지를 화면에 뿌릴건지)
    strSql= "select intseq"
	strSql= strSql & ",strEmail"
    strSql= strSql & ",strName"
    strSql= strSql & ",strSubject" 
    strSql= strSql & ",intCount"
    strSql= strSql & ",dtmReg_Date"
    strSql= strSql & " from board"
		'8.만약 화면에 뿌릴려고 할때 검색어가 있을경우 위에 검색어 sql 조건 변수 활성화
        if blnSearch then
        strSql = strSql & StrSearchSql
        end if
		'9.오름 차순 내림 차순 ascdesc 에 저장된 값을 토대로 if로 sql문 지정      
        if AscDesc =0 then
        strSql= strSql & " order by intSeq desc"
        elseif AscDesc =1 then
        strSql= strSql & " order by intSeq asc"

        elseif AscDesc =2 then
        strSql= strSql & " order by strSubject desc" 
        elseif AscDesc =3 then
        strSql= strSql & " order by strSubject asc"

        elseif AscDesc =4 then
        strSql= strSql & " order by strName desc"
        elseif AscDesc =5 then
        strSql= strSql & " order by strName asc"

        elseif AscDesc =6 then
        strSql= strSql & " order by dtmReg_Date desc"
        elseif AscDesc =7 then
        strSql= strSql & " order by dtmReg_Date asc"

        elseif AscDesc =8 then
        strSql= strSql & " order by intCount desc"
        elseif AscDesc =9 then
        strSql= strSql & " order by intCount asc"
        end if
	'10.html 에서 sql문 데이터 활용을 위해 rs를 열어준다.
    objrs.open strsql,objDBConn 
	'json.loadrecordset strsql
	'json.write()
	'json.data[].stremail

	

	
%>


<!-- #include virtual="remake/SideBar.asp" -->
<!-- Page-header start -->
<!-- card 줄맞추기 -->
<!--   -->

<div class="card-block">
	<!-- 값을 자신에게 쏴주기 위해 Form, url 뒤로 값을 보내주기 때문에 get 방식 -->
	<form name="searchForm" method="get">
		<div class="card">
			<div class="card-block">
				<a href="list.asp"><h2 align="center">새힘이의 게시판</h2></a>
				<!--99 <div style="float:left;"> -->
					<!-- select 변화시 값 제출 onchage="submit()"  -->
					<!--99
					<select name="intpagesize"  onchange="submit()" >
						<option value="10" <% If intpagesize = "10" Then %>selected<%End If%>>10</option>
						<option value="25" <% If intpagesize = "25" Then %>selected<%End If%>>25</option>
						<option value="50" <% If intpagesize = "50" Then %>selected<%End If%>>50</option>          
					</select>
				</div>
				<div style="float:right;">
					<select name="Search_word">
						<option value="strname" <%If strsearchword="strname" Then %>selected<%End If%>>작성자</option>
						<option value="strsubject" <%If strsearchword="strsubject" then %>selected<%End If%>>제목</option>
						<option value="strcontent" <%If strsearchword="strcontent" Then %>selected<%End if%>>내용</option>
					</select>
					<input type="text" name="search_string" size="15" value="<%=strSearchString%>">
					<input type="submit" value="검색">
				</div>
				-->
			</div>				
		</div>
		<div class="card">
			<div class="card-block">
				<table id="asd" class="display" style="width:100%">
					<thead>
						<!-- 전체개수가 0 이상일 경우  -->
						<!--99
						<% if intTotalCount>0 then %>
						
						<div align="right">
							전체게시물 : <%=intTotalCount%> 개 &nbsp;&nbsp;&nbsp;&nbsp;
							현재페이지 : <%=intNowPage%> / <%=intTotalpage%>
						</div>
						
						<% end if %>
						-->
						<!-- 버튼 클릭시 값 제출  -->

						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th> 
							<th>조회</th>
							
							<!--99

							<button onclick="Submit()" name="AscDesc" value="0">↓</button>
							<button onclick="Submit()" name="AscDesc" value="1">↑</button>
							</th>
							<th>제목
							<button onclick="Submit()" name="AscDesc" value="2">↓</button>
							<button onclick="Submit()" name="AscDesc" value="3">↑</button>
							</th>
							<th>작성자
							<button onclick="Submit()" name="AscDesc" value="4">↓</button>
							<button onclick="Submit()" name="AscDesc" value="5">↑</button>
							</th>
							<th>등록일
							<button onclick="Submit()" name="AscDesc" value="6">↓</button>
							<button onclick="Submit()" name="AscDesc" value="7">↑</button>
							</th> 
							<th>조회
							<button onclick="Submit()" name="AscDesc" value="8">↓</button>
							<button onclick="Submit()" name="AscDesc" value="9">↑</button>
							</th>    
						</tr>
						-->
					</thead>
					<tbody>
				

						
				
					<!-- 만약 게시물이 없거나 더 이상 게시물이 없을 경우  -->
					
					<% if objrs.bof or objrs.eof then %>
						<tr align="center">
						<td colspan="5">글이 없습니다.</td>
						</tr>
						<%
							Else
						%>
							
						<%
							'board=objrs.getrows()
							'board_eof=false
							'게시물이 있으면 objrs로 현재 페이지와 페이지 크기에 따라 objrs 이동
							objrs.move(intNowpage-1) * intPageSize
							'계속해라 게시물이 끝날때까지
							do until objRs.eof
						%>
						<tr>
							<!--
							<td><a href="content.asp?seq=<%=objRs(0)%>&page=<%=intNowPage%>&AscDesc=<%=AscDesc%>"><%=objrs(0)%></a></td>
							<td><a href="content.asp?seq=<%=objRs(0)%>&page=<%=intNowPage%>&AscDesc=<%=AscDesc%>"><%=objRs(3)%></a></td>
							<td><a href="content.asp?seq=<%=objRs(0)%>&page=<%=intNowPage%>&AscDesc=<%=AscDesc%>"><%=objRs(1)%></a></td>
							<td><%=left(objrs(5),10)%></td>
							<td><%=objrs(4)%></td>
							-->
							
						</tr>
						<% 
							'다음 objrs로 넘어감
							objrs.movenext
							loop
							end if
							objRs.close
							set objRs = nothing
							objDBConn.close
							set objDBConn = nothing
						%>

						
					</tbody>
				</table>
				<!--
				<table class="table table-borderless">
					<tr>
						<td align="center">
						<%
							'intTemp 1,11,21 inttemp란 변수는 이전 10개 다음10개가 있는지 확인 후 링크 걸어주는 용도로 쓰임
							intTemp = int((intNowPage -1)/intBlockpage) * intBlockpage+1
							
							if intTemp <> 1 Then 
								response.write "<a href=list.asp?page=" & intTemp - intBlockPage & _  
								"&search_word=" & strSearchWord & _
								"&search_string=" & strSearchString & _
								"&intpagesize=" & intpagesize & _
								"&AscDesc=" & AscDesc & _
								" >(이전" & intBlockPage & "개)</a>"
							end if
								'반복문 변수 선언
								intLoop =1
				
								Do until intLoop > intBlockPage or intTemp > intTotalPage
								'intNowpage 값을 다시 받을때 variant 형으로 받기 때문에 정수형으로 만들기 위해 cint
								if intTemp = Cint(intNowPage) then
									'순환문을 통해 나타나는 페이지 중에서 지금 현재의 페이지와 일치하면 링크 안걸고 두껍게
									response.write "<font size= 3><b>" & intTemp & "</b></font>&nbsp;"
								Else
									'순환문 페이지와 현재 페이지가 일치하지 않으면 링크걸고 안두껍게
									Response.write"<a href =list.asp?page=" & intTemp & _ 
									"&search_word=" & strSearchWord & _
									"&search_string=" & strSearchString & _
									"&intpagesize=" & intpagesize & _      
									"&AscDesc=" & AscDesc & _  
									">" & intTemp & "</a>&nbsp;"
								end If
								'페이지 순환문
								intTemp = intTemp + 1
								'조건 순환문
								intLoop = intLoop + 1
								loop
								'Do~Loop 순환문을 빠져나온 intTemp 의 값이 총 페이지 수(intTotalPage) 보다 크다면,
								'(즉 순환문에서 이미 마지막 페이지까지 보여지게 되었다면 119번 줄을 통해 intTemp 값은 총 페이지 수인
								'intTotalPage 보다도 1이 커진 값이 될 것입니다. 이 경우를 말하는 것이지요)
								'잘 이해 안감
								if intTemp=<intTotalpage then
								
									Response.Write "<a href=list.asp?page=" & intTemp & _
									"&search_word=" & strSearchWord & _
									"&search_string=" & strSearchString & _
									"&intpagesize=" & intpagesize & _
									"&AscDesc=" & AscDesc & _
									">(다음" &intBlockpage& "개)</a>"
									end if
							%>
							<div style="float:right;">
							<a href="regist.asp"><button type="button" class="btn w-xs btn-info">글쓰기</button></a>
							</div>   
						</td>
					</tr>
				</table>
				-->
			</div>   
		</div> 
	</form>
</div>
           

	<!-- Page body start -->



<!-- #include virtual="remake/Script.asp" -->

