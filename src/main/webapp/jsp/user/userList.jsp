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
<%--<link rel="stylesheet" href="${ss }/css/uniform.css" />--%>
<link rel="stylesheet" href="${ss }/css/bootstrap.min.css" />
 <link rel="stylesheet" href="${ss }/css/jquery.dataTables.min.css" /> 
<%--<link rel="stylesheet" href="${ss }/css/select2.css" />--%>

<link rel="stylesheet" href="${ss }/css/matrix-style.css" />
<link rel="stylesheet" href="${ss }/css/matrix-media.css" />
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
				  <div class="form-group">
				    <label for="exampleInputName2">编号:</label>
				    <input type="text" class="form-control" id="id-search" placeholder="编号:">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail2">名称:</label>
				    <input type="text" class="form-control" id="name-search" placeholder="名称">
				  </div>
				   <div class="form-group">
			        <label class="control-label">状态:</label>
			        <select id="status-search"  class="form-control">  
			            <option value="">全部</option>  
			            <option value="1">开启</option>  
			            <option value="0">关闭</option>  
			        </select>  
			        </div>
			        <button type="button" id="btn_search" onclick="search();" class="btn btn-primary">查询</button>
			          <button type="button" id="btn_search" onclick="$('#addUser').modal();" class="btn btn-info" style="float: right; margin-right: 5;">新增</button>
				</form>
	            <table class="table table-bordered data-table" id="datatable" >
	              <thead>
	              	<tr>
	                  <th>ID</th>
	                  <th>用户名</th>
	                  <th>是否启用</th>
	                  <th>拥有角色</th>
                   	  <th>操作</th>
	                </tr>
	              </thead>
	             <!--  <tfoot>
		            <tr>
	                  <th>ID</th>
	                  <th>用户名</th>
	                  <th>是否启用</th>
		            </tr>
		        </tfoot> -->
	            </table>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="selectRole" tabindex="-1" role="dialog" aria-labelledby="selectRoleLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="selectRoleLabel">分配角色</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm" >
			          <%--<div class='checkbox'>
			          	<label><input type='checkbox' id=''/>First One</label>
			          </div>
			        --%>
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
<%--	<script src="${ss }/js/jquery.uniform.js"></script> --%>
<%--	<script src="${ss }/js/select2.min.js"></script> --%>
	<script src="${ss }/js/jquery.dataTables.min.js"></script> 
	<script src="${ss }/js/layer.js"></script> 
<%--	<script src="${ss }/js/matrix.js"></script> --%>
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
			  	
			  	//"ajax": '${ss}/user/userList.do', 
			  	  ajax : function(data, callback, settings) {  
                //封装请求参数  
                var param = getQueryCondition(data);  
             
                $.ajax({  
                        type: "POST",  
                        url: '${ss}/user/userList.do',
                        cache : false,  //禁用缓存  
                        data: param,    //传入已封装的参数  
                        dataType: "json",  
                        beforeSend: function(xhr){  
                            xhr.setRequestHeader(header, token);  
                        },
                        success: function(result) {  	
                                //封装返回数据  如果参数相同，可以直接返回result ，此处作为学习，先这么写了。
                                var returnData = {};  
                                returnData.draw = result.draw;//这里直接自行返回了draw计数器,应该由后台返回  
                                returnData.recordsTotal = result.recordsTotal;//总记录数  
                                returnData.recordsFiltered = result.recordsFiltered;//后台不实现过滤功能，每次查询均视作全部结果  
                                returnData.data = result.data;  
                                //调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染  
                                //此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕  
                                callback(returnData);  
                        },  
                        error: function(XMLHttpRequest, textStatus, errorThrown) {  
                            alert("查询失败");  
                        }  
                    });  
            },  
			  	"columns": [
		            { "data": "id" },
		            { "data": "username" },
		            { "data": "enable" },
		            { "data": "roles" },
		            {data: null}
		        ],
			columnDefs:[{
                targets: 4,
                render: function (data, type, row, meta) {
                    return '<p><a type="button" class="btn btn-danger  btn-default" href="#" onclick=delFromID(' + row.id + ') >删除</a> '+
                    '<a type="button" class="btn btn-success btn-default" href="javascrip:;" onclick=allotRole(' + row.id + ') >分配角色</a></p>';
                }
            },
                { "orderable": false, "targets": 0 },
                { "orderable": false, "targets": 1 },
                {	 
                	"orderable": false,
                    "render": function(data, type, row) {
                        if(data==1){
                        	return "开启";
                        }else{
                        	return "关闭";
                        }
                    },
                    "targets": 2
                },
                { "orderable": false, "targets": 3 ,
                	"render": function(data, type, row) {
                		var str="";
<%--                       for(i=0;i<data.length;i++){--%>
<%--                		   //如果没有角色，直接返回“无”--%>
<%--                    	   if(data[i].roleDesc==undefined){--%>
<%--							str = "无"; --%>
<%--							break;--%>
<%--                		   }--%>
<%--                    	   str+=data[i].roleDesc;--%>
<%--                		   //列表上就显示两个角色，多余的用 “...”表示--%>
<%--                    	   if(i==1){--%>
<%--                    		 str+="...";--%>
<%--                    		 break;--%>
<%--                		   }else if(i!=data.length-1){--%>
<%--                    	   	str+=",";--%>
<%--                		   }--%>
<%--                		   --%>
<%--                       }--%>
                	   return str;
                    }	
                },
            ],
                
		    } );
			
			
			
	} );
	
	function search(){
		table.ajax.reload();
	}
	//封装查询参数
	function getQueryCondition(data){
		   var param = {};  
           //组装排序参数  
		   param.id = $("#id-search").val();//查询条件  
           param.username = $("#name-search").val();//查询条件  
           param.enable = $("#status-search").val();//查询条件  
           //组装分页参数  
           param.start = data.start;  
           param.length = data.length;  
           param.draw = data.draw;  
           return param;  
	}
	//弹出选择角色的框
	function allotRole(id){
		$.ajax({
			async:false,
			type : "POST",
			data:{uid:id},
			url: '${ss}/role/roleListWithUser.do',
			dataType:'json',
			beforeSend: function(xhr){  
                xhr.setRequestHeader(header, token);  
            },
			success: function(data){
				$("#boxRoleForm").empty();
				var htm = "<input type='hidden' name='userId' value='"+id+"'>";
				for(var i=0;i<data.length;i++){
					htm += "<div class='checkbox'><label><input type='checkbox' name='roleId' value='"+data[i].id+"'";
					if(data[i].selected==1){
						htm += " checked='checked'";
					}
					htm +="/>"+data[i].roleDesc+"</label></div>";
				}
				$("#boxRoleForm").append(htm);		      			
			  }
		});   
		
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
					table.ajax.reload();
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
