<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div id="sidebar"> 
  <ul id="menu">
<!--     <li><a href="index.do"><i class="icon icon-home"></i> <span>用户管理</span></a> </li> -->
<!--     <li><a href="roles.do"><i class="icon icon-signal"></i> <span>角色管理</span></a> </li> -->
<!--     <li><a href="resources.do"><i class="icon icon-inbox"></i> <span>资源管理</span></a> </li> -->
  </ul>
</div>
<script src="${ss }/js/jquery-1.11.2.min.js"></script> 
<script type="text/javascript">
var header = $("meta[name='_csrf_header']").attr("content");  
var token = $("meta[name='_csrf']").attr("content");  
$.ajax({
	cache: true,
	type: "POST",
	url:'${ss}/resources/loadMenu.do',
	dataType:"json",
	beforeSend: function(xhr){  
        xhr.setRequestHeader(header, token);  
    },
    success: function(data) {
		var html="";
    	for(var i=0;i<data.length;i++){
    		html+="<li><a href='"+'${ss}'+data[i].resUrl+"'><i class='icon icon-home'></i> <span>"+data[i].name+"</span></a> </li>"
    	}
		$("#menu").append(html);
		//改变当前菜单样式
		$("#menu li a").each(function(){
		    $this = $(this); 
		    if($this[0].href==String(window.location)){ 
		        $this.attr("href","javascript:;");
		        $this.parent().addClass("active");  
		    }
		}); 
    }
});




</script>