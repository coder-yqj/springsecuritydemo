  使用zTree时，由于同时使用了bootstrap插件，导致样式起了冲突，生成的树都挤在一起了，
最后的解决办法是设置zTreeStyle.css文件的.ztree li ul{}属性，在里面加入height: auto就ok了！
(metro分格则改metroStyle.css文件)