<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ss }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ss }/css/jquery.dataTables.min.css" /> 
<link rel="stylesheet" href="${ss }/css/matrix-style.css" />
<link rel="stylesheet" href="${ss }/css/matrix-media.css" />
<link rel="stylesheet" href="${ss }/css/metroStyle.css" type="text/css">
<link href="${ss }/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<meta name="_csrf" content="${_csrf.token}"/><meta name="_csrf_header" content="${_csrf.headerName}"/>

  </head>
  
  <body>
	
	<!--Header-part-->
	<div id="header">
	  <h1><a href="dashboard.html">Matrix Admin</a></h1>
	</div>
	<!--close-Header-part--> 
	
	<!--top-Header-menu-->
	<%@include file="../common/top.jsp"%>
	<%@include file="../common/menu.jsp"%>
	
	<div id="content">
	  <div id="content-header">
	    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Tables</a> </div>
	    <h1>Tables</h1>
	  </div>
	  <div class="container-fluid">
	    <hr>
	    <div class="row-fluid">
	      <div class="span12">
	        
	        <div class="widget-box">
	          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
	            <h5>用户列表</h5>
	          </div>
	          	<form class="form-inline">
			          <button type="button" id="btn_search" onclick="$('#addUser').modal();" class="btn btn-info" style="float: right; margin-right: 1;">新增</button>
				</form>
	            <table class="table table-bordered data-table" id="datatable" >
	              <thead>
	              	<tr>
	                  <th>ID</th>
	                  <th>角色key</th>
	                  <th>角色名称</th>
                   	  <th>操作</th>
	                </tr>
	              </thead>
	            </table>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="selectRole" tabindex="-1" role="dialog" aria-labelledby="selectRoleLabel">
			  <div class="modal-dialog modal-sm" role="document" style="height: 600px; "  >
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="selectRoleLabel">分配角色</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm" >
			          <ul id="treeDemo" class="ztree"></ul>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" onclick="saveUserRoles();" class="btn btn-primary">Save</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
			
			
		<!--添加弹框-->
				<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="addroleLabel">添加用户</h4>
				      </div>
				      <div class="modal-body">
				        <form id="userForm">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">用户名:</label>
				            <input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名"/>
				             <span class="btn-action single glyphicons circle_question_mark" data-toggle="tooltip" data-placement="top" data-original-title="必填"><i></i></span> 
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">密码:</label>
				            <input type="password" class="form-control" id="password" name="password"  placeholder="请输入密码 6位以上">
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="button" onclick="addUser();" class="btn btn-primary">Save</button>
				      </div>
				    </div>
				  </div>
				</div>
			<!--/添加弹框-->
	
	
	
	<!--Footer-part-->
	<div class="row-fluid">
	  <div id="footer" class="span12"> 2017 &copy; yqj <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
	</div>
	<!--end-Footer-part-->
	<script src="${ss }/js/jquery-1.11.2.min.js"></script> 
	<script src="${ss }/js/bootstrap.min.js"></script> 
	<script src="${ss }/js/jquery.dataTables.min.js"></script> 
	<script src="${ss }/js/layer.js"></script> 
 	<script type="text/javascript" src="${ss }/js/jquery.ztree.core.js"></script>
 	<script type="text/javascript" src="${ss }/js/jquery.ztree.excheck.js"></script>
	
	<script type="text/javascript">
	//_csrf参数设置
  	var header = $("meta[name='_csrf_header']").attr("content");  
     var token = $("meta[name='_csrf']").attr("content");  
     var table;
     $(document).ready(function() {
		table = $('#datatable').DataTable( {
				"dom": '<"top"i>rt<"bottom"flp><"clear">',
			  	 "searching" : false,
			  	"bJQueryUI": true,
				"sPaginationType": "full_numbers",
			  	"serverSide": true,//开启服务器模式，使用服务器端处理配置datatable
			  	"processing": true,//开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
			  	
			  	"ajax": '${ss}/role/roleList.do', 
			  	"columns": [
		            { "data": "id" },
		            { "data": "roleKey" },
		            { "data": "roleDesc" },
		            {data: null}
		        ],
			columnDefs:[{
                targets: 3,
                render: function (data, type, row, meta) {
                    return '<p><a type="button" class="btn btn-danger  btn-default" href="#" onclick=delFromID(' + row.id + ') >删除</a> '+
                    '<a type="button" class="btn btn-success btn-default" href="javascrip:;" onclick=allotResources(' + row.id + ') >分配权限</a></p>';
                }
            },
                { "orderable": false, "targets": 0 },
                { "orderable": false, "targets": 1 },
                { "orderable": false, "targets": 2 },
            ],
                
		    } );
			
			
			
	} );
	
	function search(){
		table.ajax.reload();
	}
	//弹出选择角色的框
	function allotResources(id){
		var setting = {
				check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "parentId",
						rootPId: 0
					}
				}
			};
		var zNodes =[
		 			{ id:1, pId:0, name:"随意勾选 1", open:true},
		 			{ id:11, pId:1, name:"随意勾选 1-1", open:true},
		 			{ id:111, pId:11, name:"随意勾选 1-1-1"},
		 			{ id:112, pId:11, name:"随意勾选 1-1-2"},
		 			{ id:12, pId:1, name:"随意勾选 1-2", open:true},
		 			{ id:121, pId:12, name:"随意勾选 1-2-1"},
		 			{ id:122, pId:12, name:"随意勾选 1-2-2"},
		 			{ id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
		 			{ id:21, pId:2, name:"随意勾选 2-1"},
		 			{ id:22, pId:2, name:"随意勾选 2-2", open:true},
		 			{ id:221, pId:22, name:"随意勾选 2-2-1", checked:true},
		 			{ id:222, pId:22, name:"随意勾选 2-2-2"},
		 			{ id:23, pId:2, name:"随意勾选 2-3"}
		 		];
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		$('#selectRole').modal();
	}
	
	//保存角色的选择
	function saveUserRoles() {
		
		$.ajax({
			cache: true,
			type: "POST",
			url:'${ss}/user/saveUserRoles.do',
			data:$('#boxRoleForm').serialize(),// 你的formid
			async: false,
			dataType:"json",
			beforeSend: function(xhr){  
                xhr.setRequestHeader(header, token);  
            },
		    success: function(data) {
				if(data=="success"){
					layer.msg('保存成功');
					 $('#selectRole').modal('hide');
				}else{
					layer.msg('保存失败');
					 $('#selectRole').modal('hide');
				}
		    }
		})
	}
	
	
	//添加用户
	function addUser() {
		var username = $("#username").val();
		var password = $("#password").val();
		if(username == "" || username == undefined || username == null){
			return layer.msg('用户名不能为空', function(){
				//关闭后的操作
			});
		}
		if(password.length<6||password.length>=16){
			return layer.msg('密码长度为6-16', function(){
				//关闭后的操作
			});
		}
		
		$.ajax({
			cache: true,
			type: "POST",
			url:'${ss}/user/addUser.do',
			data:$('#userForm').serialize(),// 你的formid
			async: false,
			dataType:"json",
			beforeSend: function(xhr){  
                xhr.setRequestHeader(header, token);  
            },
		    success: function(data) {
		    	if(data=="success"){
					layer.msg('保存成功');
					 $('#addUser').modal('hide');
				}else{
					layer.msg('保存失败');
					 $('#addUser').modal('hide');
				}
		    }
		});
	}
	
	</script>

  </body>
</html>
