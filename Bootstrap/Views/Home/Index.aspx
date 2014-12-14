<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <script src="/Scripts/jquery.1.9.1.min.js" type="text/javascript"></script>
    <script src="/Content/bootstrap2.3.2/bootstrap.min.js" type="text/javascript"></script>
    <link href="/Content/bootstrap2.3.2/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/avalon.js" type="text/javascript"></script>
    <style type="text/css">
        .header
        {
            width:100%;
            background:#010101;
            height:50px;
        }
        .main
        {
            position:absolute;
            top:50px;
            bottom:0px;
            width:100%;
        }
        .sidebar
        {
            height:100%;
            width:200px;
            background:#f5f5f5;
            border-right:solid 1px #eee;
         }
         .center
         {
             position:absolute;
             top:0px;
             bottom:0px;
             left:201px;
             right:0px;
             overflow:auto;
             padding:10px 10px;
         }
         .table td
         {
             font-family:微软雅黑;
             vertical-align:middle;
         }
         .alertModal
         {
            position: fixed;
            top: 50%;
            left: 50%;
            z-index: 1050;
            width: 300px;
            margin-left: -150px;
            margin-top: -70px;
            background-color: #fff;
            border: 1px solid #999;
            border: 1px solid rgba(0,0,0,0.3);
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            outline: 0;
            -webkit-box-shadow: 0 3px 7px rgba(0,0,0,0.3);
            -moz-box-shadow: 0 3px 7px rgba(0,0,0,0.3);
            box-shadow: 0 3px 7px rgba(0,0,0,0.3);
            -webkit-background-clip: padding-box;
            -moz-background-clip: padding-box;
            background-clip: padding-box;
         }
         .alertModal .modal-header
         {
             padding: 0px 15px;
             border-bottom: 1px solid #eee;
         }
         .alertModal .modal-footer
         {
             padding: 5px 15px 5px;
         }
        
    </style>
    <script type="text/javascript">
        var dataModel = avalon.define("dataModel", function (vm) {
            vm.dataList = [];
        })
        $(function () {
            $.ajax({
                url: '/home/getData',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    dataModel.dataList = data;
                }
            });
        });
    </script>
</head>

<body>
   <div class="header">
   </div>
   <div class="main">
     <div class="sidebar">

     </div>
     <div class="center" ms-controller="dataModel" >
        <form class="form-inline">
             <button class="btn btn-primary" style="margin-right:50px;">添加</button>
             <label>产品名称：</label>
             <input type="text" class="input" placeholder="产品名称">
              <div class="btn-group">
                <input type="text" class="input-small" placeholder="产品分类">
                <button class="btn dropdown-toggle" data-toggle="dropdown" style="height:30px;"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </div>
              <button type="submit" class="btn">查询</button>
       </form>
        <table class="table  table-striped table-hover">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                  <th>操作</th>
                </tr>
              </thead>
                <tbody>
                    <tr ms-repeat="dataList">
                        <td>{{el.id}}</td>
                        <td>{{el.name}}</td>
                        <td>{{el.name}}</td>
                        <td>{{el.name}}</td>
                        <td>
                            <button type="button" class="btn btn-info">查看</button>
                            <button type="button" class="btn btn-warning">修改</button>
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">删除</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="pagination">
              <ul>
                <li><a href="#">Prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">Next</a></li>
              </ul>
            </div>
            <div class="alertModal hide" id="myModal">
  <div class="modal-header" >
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h5>提示</h5>
  </div>
  <div class="modal-body">
    <p>你确定要删除当前数据吗？</p>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-primary" data-dismiss="modal" >确定</button>
  </div>
</div>
     </div>
   </div>
</body>
</html>
