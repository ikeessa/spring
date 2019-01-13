<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>



<%@include file="../include/header.jsp"%>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 리스트 페이지
		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i> 게시판 목록
					</h4>
					<div class="form-group">
						<div class="col-sm-12" align="center">
							<button type="button" id="btn_save"
								class="btn btn-primary pull-right"
								onclick="location.href='/bbs/write'">글쓰기</button>
						</div>
					</div>
					<hr>
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
										<td><a href="/bbs/read?bid=${bvo.bid}">${bvo.subject}</a></td>
										<td>${bvo.writer}</td>
										<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm"
												value="${bvo.regdate}" /></td>
										<td class="numeric">${bvo.hit}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</section>
					<%-- <jsp:include page="paging.jsp" flush="true">
						<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
						<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
						<jsp:param name="startPageNo" value="${paging.startPageNo}" />
						<jsp:param name="pageNo" value="${paging.pageNo}" />
						<jsp:param name="endPageNo" value="${paging.endPageNo}" />
						<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
						<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
					</jsp:include> --%>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->

	</section>
	<! --/wrapper -->
</section>
<!-- /MAIN CONTENT -->

<script>
	var result = '${result}';

	if (result == 'Success') {
		alert("정상 처리 되었습니다!!!");
	}
</script>

<%@include file="../include/footer.jsp"%>