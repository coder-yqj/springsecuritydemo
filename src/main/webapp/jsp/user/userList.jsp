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
    
    <title>My JSP 'index.jsp' starting page</title>
    
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%--<link rel="stylesheet" href="${ss }/css/uniform.css" />--%>
<!-- <link rel="stylesheet" href="${ss }/css/jquery.dataTables.min.css" /> -->
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
	            <h5>Data table</h5>
	          </div>
	          
	          <div class="widget-content nopadding">
	          	  <span>编号:</span> <input type="text" placeholder="编号" id="id-search">  
			        <span>名称:</span> <input type="text" placeholder="名称" id="name-search">  
			        <span>状态:</span> <select id="status-search">  
			            <option value="">全部</option>  
			            <option value="1">可以查发</option>  
			            <option value="2">可以链接</option>  
			            <option value="3">仅供查询</option>  
			            <option value="4">不可用</option>  
			        </select>  
			        <button type="button" id="btn_search">查询</button>
	            <table class="table table-bordered data-table" id="datatable" >
	              <thead>
	              	<tr>
	                  <th>ID</th>
	                  <th>用户名</th>
	                  <th>是否启用</th>
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
			        <h4 class="modal-title" id="selectRoleLabel">添加角色</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          loading...
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" onclick="selectRole();" class="btn btn-primary">Save</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
	
	
	
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
<%--	<script src="${ss }/js/matrix.js"></script> --%>
	<script type="text/javascript">
	$(document).ready(function() {
			$('#datatable').DataTable( {
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
                var header = $("meta[name='_csrf_header']").attr("content");  
                var token = $("meta[name='_csrf']").attr("content");  
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
                                //异常判断与处理  
                                if (result.errorCode) {  
                                    alert("查询失败");  
                                    return;  
                                }  
                                //封装返回数据  
                                var returnData = {};  
                                returnData.draw = result.draw;//这里直接自行返回了draw计数器,应该由后台返回  
                                returnData.recordsTotal = result.recordsTotal;//总记录数  
                                returnData.recordsFiltered = result.recordsTotal;//后台不实现过滤功能，每次查询均视作全部结果  
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
		            {data: null}
		        ],
			columnDefs:[{
                targets: 3,
                render: function (data, type, row, meta) {
                    return '<p><a type="button" class="btn btn-danger  btn-default" href="#" onclick=delFromID(' + row.id + ') >删除</a> '+
                    '<a type="button" class="btn btn-success btn-default" href="javascrip:;" onclick=allotRole(' + row.id + ') >分配角色</a></p>';
                }
            },
                { "orderable": false, "targets": 3 },
                {
                    "render": function(data, type, row) {
                        if(data==1){
                        	return "开启";
                        }else{
                        	return "关闭";
                        }
                    },
                    "targets": 2
                },
            ],
                
		    } );
			
			
	//		 $("div.toolbar").html('<b style="color:red">自定义文字、图片等等</b>');
			
			//设置全选
			$(".checkall").click(function () {
			      var check = $(this).prop("checked");
			      $(".checkchild").prop("checked", check);
			});
			
	} );
	
	function getQueryCondition(data){
		   var param = {};  
           //组装排序参数  
		  // param.id = $("#id-search").val();//查询条件  
           //param.name = $("#name-search").val();//查询条件  
           //param.status = $("#status-search").val();//查询条件  
           //组装分页参数  
           param.startIndex = data.start;  
           param.pageSize = data.length;  
           param.draw = data.draw;  
           return param;  
	}
	
	function allotRole(id){
		$.ajax({
			async:false,
			type : "POST",
			data:{id:id},
			url: "${ss}/role/roleListWithUser.do",
			dataType:'json',
			beforeSend: function(xhr){  
                xhr.setRequestHeader(header, token);  
            },
			success: function(data){
				if(data=="success"){
					alert("删除成功");
				}else{
					alert("删除失败");
				}
		      			
			  }
		});   
		
		$('#selectRole').modal();
	}
	
	</script>

  </body>
</html>
