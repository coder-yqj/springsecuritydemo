  使用zTree时，由于同时使用了bootstrap插件，导致样式起了冲突，生成的树都挤在一起了，
最后的解决办法是设置zTreeStyle.css文件的.ztree li ul{}属性，在里面加入height: auto就ok了！
(metro分格则改metroStyle.css文件)


第一次使用时导入mytest.sql
admin 的密码为admin ,因为密码的加密是后面加入的，所以现在库里只有admin可以登录。要想使用其他用户，请重新创建，
并分配相应的权限。

详情请查看博客 http://blog.csdn.net/poorCoder_/article/details/70231779