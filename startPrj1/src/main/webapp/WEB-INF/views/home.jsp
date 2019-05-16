<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="include/header.jsp" %>
<!-- main -->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">SIGN IN NOW</h4>
                        </div>
                        <div class="modal-body">
                            <div class="login-wrap">
                                <input type="text" class="form-control" placeholder="User ID"
                                       autofocus=""> <br> <input type="password"
                                                                 class="form-control" placeholder="Password"> <label
                                    class="checkbox"> <span class="pull-right">
										<button id="createAccount" class="btn btn-primary btn-block">SIGN UP</button><br>
                              </span>
                            </label>
                                <button class="btn btn-theme btn-block" href="index.html"
                                        type="submit">
                                    <i class="fa fa-lock"></i> SIGN IN
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal" id="signUp" tabindex="-1" role="dialog"
                 aria-labelledby="signUpLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title" id="signUpLabel">SIGN UP NOW</h4>
                        </div>
                        <div class="modal-body">
                            <div class="login-wrap">
                                <input type="text" class="form-control" placeholder="User ID" autofocus=""> <br>
                                <input type="password" class="form-control" placeholder="Password"> <br>
                                <input type="text" class="form-control" placeholder="이름" autofocus=""> <br>
                                <input type="number" class="form-control" placeholder="학번" autofocus=""> <br>
                                <input type="text" class="form-control" placeholder="이메일" autofocus=""> <br>
                                <%--<div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary">
                                    <input type="radio" name="options" id="option1" autocomplete="off"> 남자
                                </label>
                                <label class="btn btn-secondary">
                                    <input type="radio" name="options" id="option2" autocomplete="off"> 여자
                                </label>
                            </div>--%>
                                <p><strong>성별</strong></p>
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
                                    <label class="custom-control-label" for="jb-radio-1">남자</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
                                    <label class="custom-control-label" for="jb-radio-2">여자</label>
                                </div>
                                <br>
                                <button id="signUpBtn" class="btn btn-theme btn-block" href="index.html" type="submit">
                                    <i class="fa fa-lock"></i> SIGN UP
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-9 main-chart">
            </div><!-- /col-lg-9 END SECTION MIDDLE -->
            <!-- **********************************************************************************************************************************************************
            RIGHT SIDEBAR CONTENT
            *********************************************************************************************************************************************************** -->
        </div>
    </section>
</section>
<%@include file="include/footer.jsp" %>
<script>
    $(document).ready(function () {
        var arraySize = 8;
        var blockSize =4;
        var array = [];
        for (var i = 1; i <= arraySize; i++) {
            array.push(i);
        }
        for (var x = 1; x <= arraySize / 4; x++) {
            var template = "";
            template += '<div class=\"row mt\">';
            console.log(Math.ceil(arraySize / (arraySize / 4.0)));
            for (var y = 1; y <= Math.ceil(arraySize / (arraySize / 4.0)); y++) {
                console.log("for y");
                template += '<div class="col-md-3 col-sm-3 mb">\n' +
                    '\t\t\t\t\t\t\t\t<div class="white-panel pn">\n' +
                    '\t\t\t\t\t\t\t\t\t<div class="white-header">\n' +
                    '\t\t\t\t\t\t\t\t\t\t<h5>좌석 <span>' + (((x - 1) * 4
                    ) + y) + '</span></h5>\n' +
                    '\t\t\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t\t\t<div class="row">\n' +
                    '\t\t\t\t\t\t\t\t\t\t<div class="col-sm-6 col-xs-6 goleft">\n' +
                    '\t\t\t\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t\t\t\t<div class="col-sm-6 col-xs-6"></div>\n' +
                    '\t\t\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t\t\t<div class="centered">\n' +
                    '\t\t\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t</div>';
            }
            template += '\t\t\t\t\t\t</div>';
            $(".main-chart").append(template);
        }

        $("#createAccount").click(function () {
            console.log("create 클릭"); //제이쿼리로 바꿔줌
            $("#myModal").hide();
            $("#signUp").show();
        });

        $(".close").click(function () {
            $("#myModal").hide();
            $("#signUp").hide();
            $('#myModal').modal("hide");
            $('#signUp').modal("hide");
            $('.modal input').val('');
        })

        $(".white-panel").click(function(){
            var value = $(this).find('span').text();
            console.log(value);
            console.log(value+"번째 좌석 클릭");

        });

    });


</script>
