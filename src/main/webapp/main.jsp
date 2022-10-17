<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>主页面</title>
    <link href="3rd/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html,
        body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .main {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .main>div:nth-child(1) {
            width: 100%;
            min-height: 51px;
            max-height: 51px;
        }

        .main>div:nth-child(2) {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: row;
        }

        .main>div:nth-child(2)>div:first-child {
            height: 100%;
            min-width: 200px;
            max-width: 200px;
            padding-top: 5px;
        }

        .main>div:nth-child(2)>div:last-child {
            height: 100%;
            width: 100%;
            /* background-color: blanchedalmond; */
        }

        .main>div:nth-child(3) {
            width: 100%;
            min-height: 35px;
            max-height: 35px;
            text-align: center;
            line-height: 35px;
            border-top: black 1px solid;
            /* background-color: seashell; */
        }
        .menupanel{
            padding: 0;
        }
        .menupanel button{
            text-align: left;
        }
        .mainif{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<div class="main">
    <div>

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">标签</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">

                        <button type="button"  class="btn btn-info btn-primary  active " onclick="relogin()">退出登录</button>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

    </div>
    <div>
        <div>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#userset" aria-expanded="true" aria-controls="collapseOne">
                                用户设置
                            </a>
                        </h4>
                    </div>
                    <div id="userset" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body menupanel">
                            <button type="button" class="btn btn-link btn-block  mybtn" url= "users.jsp">table</button>
                            <button type="button" class="btn btn-link btn-block mybtn" url= "https://www.bilibili.com">bilibili</button>
                            <button type="button" class="btn btn-link btn-block mybtn" url= "https://www.taobao.com">淘宝</button>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#systemset" aria-expanded="false" aria-controls="collapseTwo">
                                系统设置
                            </a>
                        </h4>
                    </div>
                    <div id="systemset" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body menupanel">
                            <button type="button" class="btn btn-link">（链接）Link</button>
                            <button type="button" class="btn btn-link">（链接）Link</button>
                            <button type="button" class="btn btn-link">（链接）Link</button>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#menuset" aria-expanded="false" aria-controls="collapseThree">
                                菜单管理
                            </a>
                        </h4>
                    </div>
                    <div id="menuset" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body menupanel">
                            <button type="button" class="btn btn-link">（链接）Link</button>
                            <button type="button" class="btn btn-link">（链接）Link</button>
                            <button type="button" class="btn btn-link">（链接）Link</button>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#journalset" aria-expanded="false" aria-controls="collapseTwo">
                                日志管理
                            </a>
                        </h4>
                    </div>
                    <div id="journalset" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body menupanel">
                            <button type="button" class="btn btn-link btn-block mybtn" url= "https://www.bilibili.com">bilibili</button>
                            <button type="button" class="btn btn-link btn-block mybtn" url= "https://www.taobao.com">淘宝</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <iframe class="mainif" src="users.jsp"></iframe>
        </div>
    </div>
    <div>人才</div>
</div>

<script src="3rd/jquery/jquery.min.js"></script>
<script src="3rd/bootstrap/js/bootstrap.min.js"></script>
<script src="3rd/vue2/vue.min.js"></script>
<script src="3rd/layui/layui.js"></script>

<script>
    $(".mybtn").bind("click",function(){
        var url = $(this).attr("url");
        $(".mainif").attr("src",url);
    })

    // function relogin() {
    //     window.location.href = "login.html"
    // }

    function relogin() {
        layer.confirm('是否退出？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            //确定
            window.location.href = "login.html"
        })
    }
</script>
</body>
</html>

