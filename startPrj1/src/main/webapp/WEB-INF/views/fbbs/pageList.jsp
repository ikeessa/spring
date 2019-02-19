<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@include file="../include/header.jsp" %>

<!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 리스트 페이지</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      	<!-- <form class="form-horizontal style-form" method="get" action="/bbs/pageList"> -->
                      		<%-- <input type="hidden" name="page" value="${pCri.page}" />
                			<input type="hidden" name="numPerPage" value="${pCri.numPerPage}" /> --%>	
		                      <div class="form-group">
	                              <label class="col-sm-2 col-sm-2 control-label">
	                              	<h4><i class="fa fa-angle-right"></i> 게시판 목록</h4>
	                              </label>
	                              <div type="hidden" class="col-sm-5">
	                              </div>
	                              <div class="col-sm-1">
								    <select name="findType" class="form-control">
									  <option value="title_content"
									  	<c:out value="${fCri.findType =='title_content'? 'selected' : ''}"/>>제목+내용</option>
									  <option value="writer"
									  	<c:out value="${fCri.findType =='writer'? 'selected' : ''}"/>>작성자</option>
									  <option value="re_content"
									  	<c:out value="${fCri.findType =='re_content'? 'selected' : ''}"/>>댓글 내용</option>
									  <option value="re_writer"
									  	<c:out value="${fCri.findType =='re_writer'? 'selected' : ''}"/>>댓글 작성자</option>
									</select>
								  </div>
	                              <div class="col-sm-2">
	                                  <input type="text" name="keyword" id="findword" class="form-control" value="${fCri.keyword}">
	                              </div>
	                              <div class="col-sm-1">
	                              	<button id="findBtn" class="btn btn-theme03">검색 </button>
	                              </div>
	                              <div class="col-sm-1">
	                              	<button class="btn btn-theme02" onclick="window.location.href='/bbs/write${pagingMaker.makeURI(pagingMaker.pageCri.page)}'">글쓰기 </button>
	                              </div>
							</div>
						<!-- </form> -->
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
	                              <tr>
	                                  <th>글번호</th>
	                                  <th>제목</th>
	                                  <th>작성자</th>
	                                  <th>작성일</th>
	                                  <th class="numeric">조회수</th>
	                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${list}" var="bvo">
	                              <tr>
	                                  <td>${bvo.bid}</td>
	                                  <td><a href="/bbs/read${pagingMaker.makeURI(pagingMaker.pageCri.page)}&bid=${bvo.bid}">${bvo.subject}</a></td>
	                                  <td>${bvo.writer}</td>
	                                  <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${bvo.regdate}"/></td>
	                                  <td class="numeric">${bvo.hit}</td>
	                              </tr>
	                           </c:forEach>   
                              </tbody>
                          </table>
                          </section>
                  </div><!-- /content-panel -->
                  
                  <div class="showback" align="center">      					
						<div class="btn-group">
							<c:if test="${pagingMaker.prev}">
							  <a href="pageList${pagingMaker.makeURI(pagingMaker.startPage-1)}">
							  	<button type="button" class="btn btn-theme03">◀</button>
							  </a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="pNum">
							  <a href ="pageList${pagingMaker.makeURI(pNum)}">
								<button type="button" class="<c:out value="${pagingMaker.pageCri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
							  </a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
							  <a href ="pageList${pagingMaker.makeURI(pagingMaker.endPage+1)}">
							    <button type="button" class="btn btn-theme03">▶ </button>
							  </a>
							</c:if>   
						</div>      				
      			  </div>
      			  
               </div><!-- /col-lg-4 -->
               
               			
		  	</div><!-- /row -->

		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
      </body>
      </html>
	<%@include file="../include/footer.jsp" %>
      <script>
      		$('#findBtn').click(function(e){
      			console.log("클릭");
      			self.location="pageList"+"${pagingMaker.makeURISearch(1)}"
      			+"&keyword="+$("#findword").val()+"&findType="+$(":selected").val();
      		});
      	console.log('starpage:'+${pagingMaker.startPage});
      	console.log('endpage:'+${pagingMaker.endPage});
      
      	var result = '${result}';
      	
      	if(result == 'Success'){
      		alert("정상 처리 되었습니다!!!");
      	}
      </script>
      
