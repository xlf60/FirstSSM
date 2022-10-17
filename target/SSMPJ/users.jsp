<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>test03</title>
    <link href="3rd/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{
            padding: 1px;
        }
        .my-pan{
            margin-bottom: 5px;
        }
        .mynav{
            text-align: center;
        }
        .mynav > nav{
            padding-top: 25%;
        }
        .mynav > nav >ul{
            margin: 0;
        }
    </style>
</head>
<body>
<div class="app">
    <!-- Modal -->
    <div class="modal fade" id="mymod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="width: 450px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">编辑数据</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="uname">姓名</label>
                        <input type="text" class="form-control" id="uname" placeholder="请输入姓名" v-model="ed.account">
                    </div>
                    <div class="form-group">
                        <label>性别</label>
                        <input id="sexna" type="radio" name="sex" value="0" v-model="ed.sex">
                        <label for="sexna"> 男</label>
                        <input id="sexnv" type="radio" name="sex" value="1" v-model="ed.sex">
                        <label for="sexnv"> 女</label>
                    </div>
                    <div class="form-group">
                        <label for="uage">年龄</label>
                        <input type="text" class="form-control" id="uage" placeholder="请输入年龄" v-model="ed.age">
                    </div>
                    <div class="form-group">
                        <label>状态</label>
                        <input id="statusno" type="radio" name="status" value="0" v-model="ed.status">
                        <label for="statusno"> 禁用</label>
                        <input id="statusyes" type="radio" name="status" value="1" v-model="ed.status">
                        <label for="statusyes"> 启用</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="save()">保存</button>
                    <button type="button" class="btn btn-default" @click="closeMo()">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default my-pan">
        <div class="panel-heading">用户数据列表</div>
        <div class="panel-body">
            <form class="form-inline">
                <button type="button" class="btn btn-info" @click="selAll()">{{selType ? '取消' : '全选' }}</button>
                <button type="button" class="btn btn-success" @click="openMo()">新增</button>
                <button type="button" class="btn btn-danger" @click="delMore()">删除</button>

                <div class="form-group">
                    <label for="saccount">用户名</label>
                    <input type="text" class="form-control" id="saccount" placeholder="请输入用户名" v-model="sd.account">
                </div>
                <div class="form-group">
                    <label for="sage">年龄</label>
                    <input type="text" class="form-control" id="sage" placeholder="请输入年龄" v-model="sd.age">
                </div>
                <button type="button" class="btn btn-default" @click="doSearch()">搜索</button>
            </form>
        </div>
        <table class="table table-hover table table-striped table table-bordered">
            <thead>
            <td>选择</td>
            <td>序号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>年龄</td>
            <td>状态</td>
            <td>操作</td>
            </thead>
            <tbody >
            <tr v-for="(user,i) in dataList">
                <td>
                    <input type="checkbox" :value="user.id" v-model="ids"/>
                </td>
                <td>{{i + 1}}</td>
                <td>{{user.account}}</td>
                <td>{{user.sex == 0 ? '男' : '女'}}</td>
                <td>{{user.age}}</td>
                <td>{{user.status == 0 ? '禁用' : '启动'}}</td>
                <td>
                    <button class="btn btn-info btn-xs" @click="edit(user)">编辑</button>
                    <button class="btn btn-danger btn-xs" @click="del(user.id)">删除</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="mynav">
        <nav aria-label="Page navigation">
            <ul class="pagination pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#" @click="up()">上一页</a></li>
                <li><a href="#" @click="down()">下一页</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

<script src="3rd/jquery/jquery.min.js"></script>
<script src="3rd/bootstrap/js/bootstrap.min.js" ></script>
<script src="3rd/vue2/vue.min.js"></script>
<script src="3rd/layui/layui.js"></script>
<script>
    var vv = new Vue({
        el:'.app',
        data:{
            //当前页面
            pageIndex: 1,
            //最大页面
            maxPage: 1,
            //判断数据
            dataList: [],
            ed:{
                id: 0,
                account: '',
                sex: '',
                age: '',
                status: ''
            },
            //搜索数据
            sd:{
                account:'',
                age:''
            },
            //选中的id
            ids: [],
            //全选状态
            selType: false
        },
        methods:{
            //全选
            selAll:function(){
                if(this.selType){
                    //取消
                    this.ids = [];
                }else {
                    //全选
                    for(var i in this.dataList){
                        var id = this.dataList[i].id;
                        this.ids.push(id);
                    }
                }
                this.selType = !this.selType;
            },
            //多选删除
            delMore: function(){
                var idStr = this.ids.join(",");
                if(idStr == ""){
                    layer.msg("请选择要删除的数据！");
                    return;
                }
                this.del(idStr);
            },
            //编辑保存
            save: function(){
                $.ajax({
                    url:"users-save",
                    type:"POST",
                    dataType:"JSON",
                    data: vv.ed,
                    success:function (resp) {
                        if(resp.type){
                            //成功
                            layer.msg("数据保存成功");
                            vv.closeMo();
                            vv.getData();
                        }else {
                            layer.msg("数据保存失败！")
                        }
                    },
                    error:function (resp) {
                        layer.alert("系统错误");
                    }
                })
            },

            //编辑
            edit: function(data){
                this.ed.id = data.id;
                this.ed.account = data.account;
                this.ed.sex = data.sex;
                this.ed.age = data.age;
                this.ed.status = data.status;
                this.openMo(data);
            },
            //打开模态框
            openMo:function () {
                $('#mymod').modal({
                    show: true,
                    keyboard: false,
                    backdrop:'static'
                });
            },
            //关闭模态框
            closeMo:function(){
                this.ed = {
                    id: 0,
                    account: '',
                    sex: '',
                    age: '',
                    status:''
                };
                $('#mymod').modal('hide');
            },
            //删除
            del:function(ids){
                //询问层
                layer.confirm('是否删除？', {
                    btn: ['确定','取消'] //按钮
                }, function(){
                    //确定
                    $.ajax({
                        url:"users-del",
                        type:"POST",
                        dataType:"JSON",
                        data:{
                            ids:ids
                        },
                        success:function (resp) {
                            if(resp.type){
                                //成功
                                layer.msg("删除成功");
                                vv.getData();
                            }else {
                                layer.msg("数据删除失败！");
                            }
                        },
                        error:function (resp) {
                            layer.alert("系统错误");
                        }
                    });
                });
            },
            //上一页
            up:function () {
                this.pageIndex = this.pageIndex - 1;
                if(this.pageIndex < 1){
                    this.pageIndex = 1;
                    layer.msg("第一页！",{icon: 7});
                    return
                }
                this.getData();
            },
            //下一页
            down:function () {
                this.pageIndex = this.pageIndex + 1;
                if(this.pageIndex > this.maxPage){
                    this.pageIndex = this.maxPage;
                    layer.msg("最后一页！",{icon: 7});
                    return
                }
                this.getData();
            },
            //搜索
            doSearch:function(){
                this.pageIndex = 1;
                this.getData();
            },
            //分页
            getData: function() {
                $.ajax({
                    url:"users-list",
                    type:"POST",
                    dataType:"JSON",
                    data:{
                        pageIndex:vv.pageIndex,
                        account: vv.sd.account,
                        age:vv.sd.age
                    },
                    success:function (resp) {
                        vv.maxPage = resp.maxPage;
                        vv.dataList = resp.dataList;
                    },
                    error:function (resp) {
                        layer.alert("系统错误");
                    }
                })
            }
        }
    });
    vv.getData();
</script>
</body>
</html>