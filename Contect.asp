<%dim dh
dh=10%>
<!--#include virtual="head.asp"--> 
<div id="mainBg">
    	<div id="main">
    	<div id="header">

</div>
<div id="content" class="clearfix">
	<p class="crumbs"><a href="http://www.huayuanguanjia.com">首页</a><em>&gt;</em><span>媒体中心</span></p>
    <div class="contentList"> 
        <div class="bgList">
        <!--#include virtual="left.asp"-->
            <div class="midCenter" style="width:770px; overflow:hidden;">
                <h3>联系我们</h3>
                <%call sHowInfo("联系我们")%>
            </div>
        </div>
        <div class="right" style="display:none;">
            <div class="subpoena"><p>媒体传讯部<br /><em>Media@huayuanguanjia.com</em></p></div>
            <h4>非媒体人士咨询</h4>
            <p>非媒体人士咨询，请访问<a href="http://www.huayuanguanjia.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=30">联系我们</a>页面。</p>
            <h4>公司地址</h4>
            <p>中国上海浦东新区川沙川图路300号</p>
        </div>
    </div>
</div>
<!--#include virtual="footer.asp"--> 