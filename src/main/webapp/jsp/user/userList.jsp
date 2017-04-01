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
<link rel="stylesheet" href="${ss }/css/uniform.css" />
<!-- <link rel="stylesheet" href="${ss }/css/jquery.dataTables.min.css" /> -->
<link rel="stylesheet" href="${ss }/css/select2.css" />
<link rel="stylesheet" href="${ss }/css/matrix-style.css" />
<link rel="stylesheet" href="${ss }/css/matrix-media.css" />
<link href="${ss }/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

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
	            <table class="table table-bordered data-table" id="datatable" >
	              <thead>
	              	<tr>
	                  <th><input type="checkbox" class="checkall" /></th>
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
	<!--Footer-part-->
	<div class="row-fluid">
	  <div id="footer" class="span12"> 2017 &copy; yqj <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
	</div>
	<!--end-Footer-part-->
	<script src="${ss }/js/jquery.min.js"></script> 
	<script src="${ss }/js/jquery.ui.custom.js"></script> 
	<script src="${ss }/js/bootstrap.min.js"></script> 
	<script src="${ss }/js/jquery.uniform.js"></script> 
	<script src="${ss }/js/select2.min.js"></script> 
	<script src="${ss }/js/jquery.dataTables.min.js"></script> 
	<script src="${ss }/js/matrix.js"></script> 
<!-- 	<script src="${ss }/js/matrix.tables.js"></script> -->
	<script type="text/javascript">
	$(document).ready(function() {
			$('#datatable').DataTable( {
			  	"dom": '<""l>t<"F"fp>',
			  	"bJQueryUI": true,
				"sPaginationType": "full_numbers",
			  	"serverSide": true,//开启服务器模式，使用服务器端处理配置datatable
			  	"processing": true,//开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
			  	"ajax": '${ss}/user/userList.do', 
		        "columns": [
					{
					    "sClass": "text-center",
					    "data": "id",
					    "render": function (data, type,row) {
					        return '<input type="checkbox"  class="checkchild"  value="' + data + '" />';
					    },
					    "bSortable": false
					},
		            { "data": "id" },
		            { "data": "username" },
		            { "data": "enable" },
		            {data: null}
		        ],
			columnDefs:[{
                targets: 4,
                render: function (data, type, row, meta) {
                    return '<a type="button" class="btn btn-danger btn-block" href="#" onclick=delFromID(' + row.id + ') >删除</a>';
                }
            },
                { "orderable": false, "targets": 4 },
            ],
                
		    } );
			
			
	//		 $("div.toolbar").html('<b style="color:red">自定义文字、图片等等</b>');
			
			//设置全选
			$(".checkall").click(function () {
			      var check = $(this).prop("checked");
			      $(".checkchild").prop("checked", check);
			});
			
	} );
	
	</script>

  </body>
</html>
