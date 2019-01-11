<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
    
<%@ include file="../include/header.jsp" %>

    <!-- main -->
     <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 글쓰기 페이지</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 입력 사항</h4>
                      <form class="form-horizontal style-form" method="post">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제목</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="subject">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">내용</label>
                              <div class="col-sm-10">
                                      <textarea class="form-control" name="content" rows="4">
                                      </textarea>                              
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">작성자</label>
                              <div class="col-sm-10">
                                  <input type="text" name="writer" class="form-control">
                              </div>
                          </div>                              
                          <div class="form-group">
                          	<div class="col-sm-12" align="center">    
                              <button type="submit" class="btn btn-theme">등록하기</button>
                            </div>  
                          </div>  
                      </form>
                  </div><!-- form - pannel --> 
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->          	
          	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
    
<%@include file="../include/footer.jsp" %>