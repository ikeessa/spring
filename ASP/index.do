<!--#include virtual="/common/const.do"-->
<%
	'Call LoginChk("page")
	menucode = "Z0000"
	Call PageLog(menucode)
%>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<%=Html_meta%>
		<title><%=SiteTitle%></title>
		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/font-awesome.min.css">

		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/smartadmin-skins.min.css">

		<link rel="stylesheet" type="text/css" media="screen" href="/common/css/style.css">

		<!--#include virtual="/common/inc/inc_pageIcon.do"-->
		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">


	</head>
	<style>
	#main {
    margin-left: 0px;
	
	}
	#val_tbl span {
	margin-right: 5px;
	margin-bottom: 5px;
	}
	</style>
	
	<body>

		<!--#include virtual="/common/inc/inc_pageHeader.do"-->

		<div id="main" role="main">

				<ol class="breadcrumb">
				</ol>

			<div id="content">

				<section id="widget-grid" class="">
					<!-- row -->
					<div class="row">
						<!-- NEW WIDGET START -->
						<article class="col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
				
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-blue" id="wid-id-1" data-widget-editbutton="false" role="widget" style="position: relative; opacity: 1; left: 0px; top: 0px;">
								<!-- widget options:
								usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
				
								data-widget-colorbutton="false"
								data-widget-editbutton="false"
								data-widget-togglebutton="false"
								data-widget-deletebutton="false"
								data-widget-fullscreenbutton="false"
								data-widget-custombutton="false"
								data-widget-collapsed="true"
								data-widget-sortable="false"
				
								-->
								<header role="heading"><div class="jarviswidget-ctrls" role="menu"></div>
									<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
									<h2>Validation List</h2>
								<span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span></header>
								<!-- widget div-->
								<div role="content">
									<div class="table-responsive">
										<%
											Dim row,srow,inhtml
											sql= "SELECT DISTINCT LINE_NAME,(CASE WHEN LINE_NAME = 'CARRIER LINE' THEN '1' WHEN LINE_NAME = 'EXD4' THEN '2' "_
												 &"WHEN LINE_NAME = 'PACKAGING' THEN '3' WHEN LINE_NAME = 'UTILITY' THEN '4' WHEN LINE_NAME = 'GENERAL' THEN '5' WHEN LINE_NAME = 'CSV' THEN '6'"_				
												 &"END) A FROM TBL_VAL_LIST ORDER BY A " 
											Set rs = dbcon.execute(sql)
										%>
										<table id="val_tbl" class="table m-0" style="table-layout:fixed;">
											<tbody>
												<input type="hidden" name="wtype" value="line"> 
												<tr id="line" value="line">
													<td class="col col-lg-1"><strong>Line</strong></td> 
													<td class="line">
													<%
														If Not rs.eof Then
															arr_list = rs.getRows()
															If isarray(arr_list)  Then 
																for row=0 to ubound(arr_list,2)
																	inhtml = inhtml & "<span id='"&arr_list(1,row)&"' class='btn btn-primary btn-sm'>  "&arr_list(0,row)&"</span>"
																Next
															End If
																	'inhtml = inhtml & "<span class='btn btn-primary btn-sm'>CSV</span>"
														End If
														Response.write inhtml
													%>
													</td>
												</tr>
												<tr>
													<td><strong>System</strong></td>
													<td class="System">
													
													</td>
												</tr>
												<tr>
													<td><strong>Unit</strong></td> 
													<td class="Unit">
													
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</article>
					</div>
					<div class="row" id="tab1">
						<!--<h2 class="row-seperator-header"><i class="fa fa-plus"></i> Customized Tabs </h2>-->
						<!-- NEW WIDGET START -->
						<article class="col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false" role="widget" >
								<header role="heading"><div class="jarviswidget-ctrls" role="menu">  </div>
									<span class="widget-icon"> <i class="fa fa-file-text-o"></i> </span>
									<h2>Document Type</h2>
									<span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span>
								</header>
								<div role="content">
									<div class="widget-body">
										<ul class="nav nav-tabs">
											<li class="active">
												<a href="#iss4" data-toggle="tab" aria-expanded="false">VP</a>
											</li>
											<li class="">
												<a href="#iss5" data-toggle="tab" aria-expanded="false">DWg</a>
											</li>
											<li class="">
												<a href="#iss6" data-toggle="tab" aria-expanded="false">DQ</a>
											</li>
											<li class="">
												<a href="#iss7" data-toggle="tab" aria-expanded="false">FAT</a>
											</li>
											<li class="">
												<a href="#iss8" data-toggle="tab" aria-expanded="false">SAT</a>
											</li>
											<li class="">
												<a href="#iss9" data-toggle="tab" aria-expanded="false">IQ</a>
											</li>
											<li class="">
												<a href="#iss10" data-toggle="tab" aria-expanded="false">OQ</a>
											</li>
											<li class="">
												<a href="#iss11" data-toggle="tab" aria-expanded="true">PQ</a>
											</li>
										</ul>
										<div id="myTabContent1" class="tab-content padding-10">
											<div class="tab-pane fade in active" id="s1">
												<div class="table-responsive">
													<table class="table table-bordered table-hover medi_list">
														<thead>
															
															<tr>
																<th>Doc Type</th>
																<th>Doc No.</th>
																<th>Rev No.</th>
																<th>Test(From)</th>
																<th>Test(To)</th>
																<th>Approvaed</th>
																<th>문서명(첨부파일)</th>
																<th>팀</th>
																<th>작성지/담당자</th>
																<th>Binder No.</th>
																<th>Remark</th>
															</tr>
														</thead>
														<tbody>
															
															
														</tbody>	
													</table>
												</div>
											</div>
											<div class="tab-pane fade" id="s2">
												<p>
													
												</p>
											</div>
											<div class="tab-pane fade" id="s3">
												<p>
													
												</p>
											</div>
											<div class="tab-pane fade" id="s4">
												<p>
													
												</p>
											</div>
										</div>
									</div>
									<!-- end widget content -->
								</div>
							</div>
							<!-- end widget -->
						</article>
					</div>
					<div class="row" id="tab2">
						<!--<h2 class="row-seperator-header"><i class="fa fa-plus"></i> Customized Tabs </h2>-->
						<!-- NEW WIDGET START -->
						<article class="col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false" role="widget" >
								<header role="heading"><div class="jarviswidget-ctrls" role="menu">  </div>
									<span class="widget-icon"> <i class="fa fa-file-text-o"></i> </span>
									<h2>Document Type</h2>
									<span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span>
								</header>
								<div role="content">
									<div class="widget-body">
										<ul class="nav nav-tabs">
											<li class="active">
												<a href="#iss1" data-toggle="tab" aria-expanded="false">Validation</a>
											</li>
											<li class="">
												<a href="#iss2" data-toggle="tab" aria-expanded="false">VA</a>
											</li>
											<li class="">
												<a href="#iss3" data-toggle="tab" aria-expanded="false">RA</a>
											</li>
											<li class="">
												<a href="#iss4" data-toggle="tab" aria-expanded="false">URS</a>
											</li>
											<li class="">
												<a href="#iss5" data-toggle="tab" aria-expanded="false">DQ</a>
											</li>
											<li class="">
												<a href="#iss6" data-toggle="tab" aria-expanded="false">F&DS</a>
											</li>
											<li class="">
												<a href="#iss7" data-toggle="tab" aria-expanded="false">SDS</a>
											</li>
											<li class="">
												<a href="#iss8" data-toggle="tab" aria-expanded="false">HDS</a>
											</li>
											<li class="">
												<a href="#iss9" data-toggle="tab" aria-expanded="false">FAT</a>
											</li>
											<li class="">
												<a href="#iss10" data-toggle="tab" aria-expanded="false">ASW</a>
											</li>
											<li class="">
												<a href="#iss11" data-toggle="tab" aria-expanded="true">DT</a>
											</li>
											<li class="">
												<a href="#iss11" data-toggle="tab" aria-expanded="true">H/SAT</a>
											</li>
											<li class="">
												<a href="#iss11" data-toggle="tab" aria-expanded="true">S/SAT</a>
											</li>
											<li class="">
												<a href="#iss11" data-toggle="tab" aria-expanded="true">IQ</a>
											</li>
											<li class="">
												<a href="#iss11" data-toggle="tab" aria-expanded="true">OQ</a>
											</li>
											<li class="">
												<a href="#iss11" data-toggle="tab" aria-expanded="true">PQ</a>
											</li>
										</ul>
										<div id="myTabContent1" class="tab-content padding-10">
											<div class="tab-pane fade in active" id="ss1">
												<div class="table-responsive">
													<table class="table table-bordered table-hover medi_list">
														<thead>
															<tr>
																<th>Doc Type</th>
																<th>Doc No.</th>
																<th>Rev No.</th>
																<th>Test(From)</th>
																<th>Test(To)</th>
																<th>Approvaed</th>
																<th>문서명(첨부파일)</th>
																<th>팀</th>
																<th>작성지/담당자</th>
																<th>Binder No.</th>
																<th>Remark</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th>Plan</th>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<th>Report</th>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															
														</tbody>	
													</table>
												</div>
											</div>
											<div class="tab-pane fade" id="ss2">
												
											</div>
											<div class="tab-pane fade" id="ss3">
												<p>
													
												</p>
											</div>
											<div class="tab-pane fade" id="ss4">
												<p>
													
												</p>
											</div>
										</div>
									</div>
									<!-- end widget content -->
								</div>
							</div>
							<!-- end widget -->
						</article>
					</div>
					<div class="row" id="tab3">
						<!--<h2 class="row-seperator-header"><i class="fa fa-plus"></i> Customized Tabs </h2>-->
						<!-- NEW WIDGET START -->
						<article class="col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false" role="widget" >
								<header role="heading"><div class="jarviswidget-ctrls" role="menu">  </div>
									<span class="widget-icon"> <i class="fa fa-file-text-o"></i> </span>
									<h2>Document Type</h2>
									<span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span>
								</header>
								<div role="content">
									<div class="widget-body">
										<ul class="nav nav-tabs">
											<li class="active">
												<a href="#iss1" data-toggle="tab" aria-expanded="false">F&DS</a>
											</li>
											<li class="">
												<a href="#iss2" data-toggle="tab" aria-expanded="false">URS</a>
											</li>
											<li class="">
												<a href="#iss3" data-toggle="tab" aria-expanded="false">RA</a>
											</li>
										</ul>
										<div id="myTabContent1" class="tab-content padding-10">
											<div class="tab-pane fade in active" id="s1">
												<div class="table-responsive">
													<table class="table table-bordered table-hover medi_list">
														<thead>
															
															<tr>
																<th>Doc Type</th>
																<th>Doc No.</th>
																<th>Rev No.</th>
																<th>Test(From)</th>
																<th>Test(To)</th>
																<th>Approvaed</th>
																<th>문서명(첨부파일)</th>
																<th>팀</th>
																<th>작성지/담당자</th>
																<th>Binder No.</th>
																<th>Remark</th>
															</tr>
														</thead>
														<tbody>
															
															
														</tbody>	
													</table>
												</div>
											</div>
											<div class="tab-pane fade" id="s2">
												<p>
													
												</p>
											</div>
											<div class="tab-pane fade" id="s3">
												<p>
													
												</p>
											</div>
											<div class="tab-pane fade" id="s4">
												<p>
													
												</p>
											</div>
										</div>
									</div>
									<!-- end widget content -->
								</div>
							</div>
							<!-- end widget -->
						</article>
					</div>
					<!-- end row -->
				</section>
				<!-- end widget grid -->
			</div>
		<!-- Footer include  생략함 -->
		<!--#include virtual="/common/inc/inc_defaultJs.do"-->
		<script type="text/javascript">
		</script>
	</body>
</html>
<script>
	//$('#clickme').click(function() { $('#book').toggle('slow', function() { // Animation complete. }); });




	function timesheetbtn() {
		window.open("http://duqm_mysql.erns.co.kr/member/timesheet/timesheet_input.do", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=1000,width=1500,height=1000");
	}
	function timesheetviewbtn(){
		window.open("http://duqm_mysql.erns.co.kr/member/timesheet/timesheet_view.do", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=1000,height=800");
	}

	$(document).ready(function() {
		pageSetUp();
		runAllForms();
		LoadCode();
	
		//LoadMenu();
		
	});
	//메뉴 호출,url 경로 설정 할 것
	/*
	function LoadMenu(){
		$.ajax({
			  type: 'post'
			, async: false
			, url: '/common/inc/inc_pageLeft_proc.do'
			, data: {}
			, dataType: "text"
			, success: function (result) {
				console.log("ajax 연결 성공");
				console.log("result : " + result);
				$("nav").html(result);
			  }
		});
	}
	*/

	/* 트리 스크립트	
	$(document).ready(function() {
			
			// PAGE RELATED SCRIPTS
			$('.tree > ul').attr('role', 'tree').find('ul').attr('role', 'group');
			
		
		});

	$('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', 'Collapse  this branch').on('click', function(e) {
		var children = $(this).parent('li.parent_li').find(' > ul > li');
		if (children.is(':visible')) {
			children.hide('fast');
			$(this).attr('title', 'Expand this branch').find(' > i').removeClass().addClass('fa fa-lg fa-plus-circle');
		} else {
			children.show('fast');
			$(this).attr('title', 'Collapse this branch').find(' > i').removeClass().addClass('fa fa-lg fa-minus-circle');
		}
		e.stopPropagation();
	});
	*/
	$("#tab1").hide();
	$("#tab2").hide();
	$("#tab3").hide();
	</script>
	
	<script>
	
	$(document).on("click",".line span",function(){
		
		var line = $(this).text();

		if (line=="  CSV"){
			$("#tab1").hide();
			$("#tab3").hide();

			$(document).on("click",".System span",function(){
			$("#tab2").show();
			$("#tab3").hide();
					
			});

		}else {
			$("#tab2").hide();
			$(document).on("click",".System span",function(){
			$("#tab2").hide();
			$("#tab3").show();
					
			});
			
		}
	
	});

	
	$(document).on("click",".line span",function(){
		$("#val_tbl .Unit").empty()
		$('.check1').remove();
		$(this).prepend('<i class="fa fa-check check1"></i>');
		var thisidx = $(this).attr("id");
		var line = $(this).text();
		var wtype = $(this).parents("tr").val();
		$.ajax({
			  type: 'post'
			, async: false
			, url: 'val_proc.do'
			, data: {"thisidx" : thisidx 
					,"line":line
					,"wtype":"system_list" 
			} 
			, dataType: "text"
			, success: function (result) {
				$("#val_tbl .System").html(result);
			}
		});
		$(document).on("click",".System span",function(){
			//$("#tab3").show();
			$("#tab1").hide();
			$('.check2').remove();
			$(this).prepend('<i class="fa fa-check check2"></i>');
			var thisidx = $(this).attr("id");
			var system = $(this).text();
			$.ajax({
				  type: 'post'
				, async: false
				, url: 'val_proc.do'
				, data: {"thisidx" : thisidx 
						,"line":line
						,"system":system
						,"wtype":"unit_list" 
				} 
				, dataType: "text"
				, success: function (result) {
					$("#val_tbl .Unit").html(result);
					
				}
			});
		});
	});

	$(document).on("click",".Unit span",function(){
		$("#tab3").hide();
		$("#tab1").show();
		$('.check3').remove();
		$(this).prepend('<i class="fa fa-check check3"></i>');
		var thisidx = $(this).attr("id");
		var doc = $(this).text();
		var unit = $('.check3').parent().text();
		var li = $('.active:eq(1)').text().trim()
		$.ajax({
			  type: 'post'
			, async: false
			, url: 'val_proc.do'
			, data: {"thisidx" : thisidx 
					,"doc":doc
					,"wtype":"doc_list" 
			} 
			, dataType: "text"
			, success: function (result) {
				$("#val_tbl .doc").html(result);
			}
		});
		$.ajax({
			  type: 'post'
			, async: false
			, url: 'val_proc.do'
			, data: {"li" : li
					,"unit" : unit
					,"wtype":"li_list" 
			} 
			, dataType: "text"
			, success: function (result) {
				$("#tab1 tbody").html(result);
			}
		});
	});

	$(document).on("click","#tab1 li",function(){
		$("#tab1").show();
		var li = $(this).children().text();
		var unit = $('.check3').parent().text();
		var thisidx = $(this).attr("id");
		var doc = $(this).text();
	
		$.ajax({
			  type: 'post'
			, async: false
			, url: 'val_proc.do'
			, data: {"li" : li
					,"unit" : unit
					,"wtype":"li_list" 
			} 
			, dataType: "text"
			, success: function (result) {
				$("tbody:eq(1)").html(result);
			}
		});
				
	});

	$(document).on("click","#tab3 li",function(){
		//$("#tab1").show();
		var li = $(this).children().text();	
		var unit = $('.check3').parent().text();
		var thisidx = $(this).attr("id");
		var doc = $(this).text();
	
		$.ajax({
			  type: 'post'
			, async: false
			, url: 'val_proc.do'
			, data: {"li" : li
					,"unit" : unit
					,"wtype":"li_list" 
			} 
			, dataType: "text"
			, success: function (result) {
				$("tbody:eq(3)").html(result);
			}
		});
	});
	
	$(document).on("click","#tab1 .bluetd",function(){
					var doc = $(this).text();
					var li_active = $('.active:eq(1)').text().trim()
					location.href="download.do?doc="+doc+"&li_active="+li_active
			});
	
</script>
<%
Dbcon.close
set Dbcon = nothing
%>