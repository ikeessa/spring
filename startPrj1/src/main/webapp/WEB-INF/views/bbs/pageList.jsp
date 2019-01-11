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
                      <h4><i class="fa fa-angle-right"></i> 게시판 목록</h4>
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
	                                  <td><a href="/bbs/readPage${pagingMaker.makeURI(pagingMaker.cri.page)}&bid=${bvo.bid}">${bvo.subject}</a></td>
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
								<button type="button" class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
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

      <script>
      	var result = '${result}';
      	
      	if(result == 'Success'){
      		alert("정상 처리 되었습니다!!!");
      	}
      </script>
      
<%@include file="../include/footer.jsp" %>