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
    
    <title>资源管理</title>
    
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
	            <h5>资源列表</h5>
	          </div>
	          	<form class="form-inline">
	          		<security:authorize buttonUrl="/resources/addResources.do">
			          <button type="button" id="btn_search" onclick="$('#resourcesModal').modal();" class="btn btn-info" style="float: right; margin-right: 1;">新增</button>
					</security:authorize>
				</form>
	            <table class="table table-bordered data-table" id="datatable" >
	              <thead>
	              	<tr>
	                  <th>ID</th>
	                  <th>资源名称</th>
	                  <th>资源key</th>
	                  <th>父资源</th>
	                  <th>资源链接</th>
	                  <th>资源类型</th>
	                  <th>排序</th>
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
			<div class="modal fade bs-example-modal-sm"  id="selectResources" tabindex="-1" role="dialog" aria-labelledby="selectRoleLabel">
			  <div class="modal-dialog modal-sm" role="document" style="height: 600px; "  >
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="selectRoleLabel">分配权限</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm" >
			          <ul id="treeDemo" class="ztree"></ul>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" onclick="saveRoleResources();" class="btn btn-primary">Save</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
			
			
		<!--添加弹框-->
				<div class="modal fade" id="resourcesModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="addroleLabel">添加资源</h4>
				      </div>
				      <div class="modal-body">
				        <form id="resourcesForm">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">资源名称:</label>
				            <input type="text" class="form-control" name="name" id="name" placeholder="请输入资源名称"/>
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">资源key:</label>
				            <input type="text" class="form-control" name="resKey" id="resKey" placeholder="请输入资源名称"/>
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">父资源ID:</label>
				            <input type="text" class="form-control" id="parentId" name="parentId"  placeholder="请输入父资源ID">
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">资源链接:</label>
				            <input type="text" class="form-control" id="resUrl" name="resUrl"  placeholder="请输入资源链接">
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">资源类型:</label>
				            <select class="form-control" name="type" id="type" >
							  <option value="1">菜单</option>
							  <option value="2">按钮</option>
							</select>
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">排序:</label>
				            <input type="text" class="form-control" id="sort" name="sort"  placeholder="请输入排序">
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="button" onclick="addResources();" class="btn btn-primary">Save</button>
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
			  	
			  	"ajax": '${ss}/resources/resourcesList.do', 
			  	"columns": [
		            { "data": "id" },
		            { "data": "name" },
		            { "data": "resKey" },
		            { "data": "parentId" },
		            { "data": "resUrl" },
		            { "data": "type" },
		            { "data": "sort" },
		            {data: null}
		        ],
			columnDefs:[{
                targets: 7,
                render: function (data, type, row, meta) {
                    return '<p><security:authorize buttonUrl='/resources/delResources.do'><a type="button" class="btn btn-danger  btn-default" href="javascrip:;" onclick=delById(' + row.id + ') >删除</a></security:authorize>'+
                    '<security:authorize buttonUrl='/role/editResources.do'><a type="button" class="btn btn-success btn-default" href="javascrip:;" onclick=allotResources(' + row.id + ') >修改</a></security:authorize></p>';
                }
            },
                { "orderable": false, "targets": 0 },
                { "orderable": false, "targets": 1 },
                { "orderable": false, "targets": 2 },
                { "orderable": false, "targets": 3 },
                { "orderable": false, "targets": 4 },
                {	 
                	"orderable": false,
                    "render": function(data, type, row) {
                        if(data==1){
                        	return "菜单";
                        }else if(data==2){
                        	return "按钮";
                        }else{
                        	return "其他";
                        }
                    },
                    "targets": 5
                },
                { "orderable": false, "targets": 6 }
            ],
                
		    } );
			
			
			
	} );
	
	function search(){
		table.ajax.reload();
	}
	
	//添加用户
	function addResources() {
		var name = $("#name").val();
		var resKey= $("#resKey").val();
		var parentId = $("#parentId").val();
		var resUrl = $("#resUrl").val();
		var sort = $("#sort").val();
		
		if(name == "" || name == undefined || name == null){
			return layer.msg('资源名称不能为空', function(){
				//关闭后的操作
			});
		}
		if(resKey == "" || resKey == undefined || resKey == null){
			return layer.msg('资源key不能为空', function(){
				//关闭后的操作
			});
		}
		if(parentId == "" || parentId == undefined || parentId == null){
			return layer.msg('父资源id不能为空', function(){
				//关闭后的操作
			});
		}
		if(resUrl == "" || resUrl == undefined || resUrl == null){
			return layer.msg('资源链接不能为空', function(){
				//关闭后的操作
			});
		}
		if(sort == "" || sort == undefined || sort == null){
			return layer.msg('资源排序不能为空', function(){
				//关闭后的操作
			});
		}

		$.ajax({
			cache: true,
			type: "POST",
			url:'${ss}/resources/addResources.do',
			data:$('#resourcesForm').serialize(),// 你的formid
			async: false,
			dataType:"json",
			beforeSend: function(xhr){  
                xhr.setRequestHeader(header, token);  
            },
		    success: function(data) {
		    	if(data=="success"){
					layer.msg('保存成功');
					table.ajax.reload();
					 $('#resourcesModal').modal('hide');
				}else{
					layer.msg('保存失败');
					 $('#resourcesModal').modal('hide');
				}
		    }
		});
	}
	
	function delById(id) {
		layer.confirm('您确定要删除该角色吗？', {
			  btn: ['确认','取消'] //按钮
			}, function(){
				$.ajax({
					cache: true,
					type: "POST",
					url:'${ss}/resources/delResources.do',
					data:{id:id},
					async: false,
					dataType:"json",
					beforeSend: function(xhr){  
		                xhr.setRequestHeader(header, token);  
		            },
				    success: function(data) {
				    	if(data=="success"){
							layer.msg('删除成功');
							table.ajax.reload();
						}else{
							layer.msg('删除失败');
						}
				    }
				});
			});
		
	}
	
	</script>

  </body>
</html>
