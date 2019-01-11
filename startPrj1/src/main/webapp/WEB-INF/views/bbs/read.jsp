<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<!-- main -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 게시글 조회
		</h3>

		<!-- role 속성:
			. HTML5에서 새롭게 추가된 속성
			. ARIA(Accessible Rich Internet Application)라는 HTML5의 상세 규격 중 하나
			. 시각 장애인이 컴퓨터의 리더기를 사용해서 웹 페이지를 읽을 때 "해당 부분이 form이다" 라고 정의해주는 것
			. role은 필수적인 요소는 아니지만 화면용 리더기를 이용해야하는 사람들에게도
			  불편함이 없는 사이트를 제공하고자 하는 경우에 이 속성을 이용함.
		  -->
		<!-- <form role="form" method="post">	
				
		</form> -->

		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<form class="form-horizontal style-form" method="post" action="/bbs/modify">
						<input type="hidden" name="bid" value="${bbsVO.bid}" />
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 조회내용
						</h4>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="subject"
									value="${bbsVO.subject}" readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="content" rows="4"
									readonly="readonly">${bbsVO.content}</textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">작성자</label>
							<div class="col-sm-10">
								<input type="text" name="writer" class="form-control"
									value="${bbsVO.writer}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12" align="center">
								<button type="submit" id="btn_modify" class="btn btn-primary">수정하기</button>&nbsp;
								<button type="button" class="btn btn-danger" onclick="location.href='/bbs/remove?bid=${bbsVO.bid}'">삭제하기</button>&nbsp;
								<button type="button" class="btn btn-info" onclick="location.href='/bbs/list'">목록으로</button>
							</div>
						</div>
					</form>
				</div>
				<!-- form-panel-->
			</div>
			<!-- col-lg-12-->
		</div>
		<!-- /row -->
	</section>
	<! --/wrapper -->
</section>
<!-- /MAIN CONTENT -->
<%@include file="../include/footer.jsp"%>
<script>
	/* $(document).ready(function(){
		var frmObj = $("form[role='form']");
		
		console.log("폼태그입니다..");
		
		$("#btn_modify").on("click", function(){
			console.log("클릭1");
			frmObj.attr("action", "/bbs/modify");
			frmObj.attr("method", "get");
			frmObj.submit();
		});
		
		$(".btn-danger").on("click", function(){
			console.log("클릭2");
			frmObj.attr("action", "/bbs/delete");
			frmObj.submit();
		});
		
		$(".btn-info").on("click", function(){
			console.log("클릭3");
			self.location = "/bbs/list";
			$(location).attr('href', "/bbs/list");
		});
	}); */
</script>