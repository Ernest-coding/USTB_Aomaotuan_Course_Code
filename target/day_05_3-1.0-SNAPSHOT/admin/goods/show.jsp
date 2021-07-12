<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'show.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
<script type="text/javascript">
function dodel(id){
	if(confirm("是否确认删除?")){
		location.href="${pageContext.request.contextPath }/admin/goods/delete.do?goodsId="+id;
	}
}
function dodels(){
	if(confirm("是否确认删除?")){
		document.deletesForm.submit();
	}
}
</script>

</head>
  
<body>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[基础数据管理]-[商品管理]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="cbox_all" id="cbox_all" onclick="doCheckAll()"/>
                      <script type="text/javascript">
                      	function doCheckAll(){
                      		var cbox_all_obj = document.getElementById("cbox_all");
                      		var cbox_goodsIds_arr = document.getElementsByName("goodsIds");
                      		for(var i=0 ; i<cbox_goodsIds_arr.length ; i++){
                      			cbox_goodsIds_arr[i].checked = cbox_all_obj.checked;
                      		}
                      	}
                      </script>
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><A href="${pageContext.request.contextPath }/admin/goods/save.jsp">新增</A></div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  	
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><A href="javascript:dodels()">删除</A></div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <!-- 商品显示 -->
        <td><span class="STYLE1" >
        <!-- 多条件查询表单 -->
        <script type="text/javascript">
        	function toPage(p){
        		document.searchForm.page.value = p;
        		document.searchForm.submit();
        	}
        </script>
        <center>
        <form id="searchForm" name="searchForm" action="${pageContext.request.contextPath }/admin/goods/search.action" method="post">
        	<input type="hidden" name="page" id="page" value="1">
        	商品名称：<input type="text" name="goodsName" value="${param.goodsName }">&nbsp;&nbsp; 
        	商品价格：<input type="text" name="minPrice" value="${param.minPrice }" size="5">
        					- <input type="text" name="maxPrice" value="${param.maxPrice }" size="5">&nbsp;&nbsp; 
        	商品类型：<select name="typeId">
        		<option value="-1">不限</option>
        		<c:forEach items="${ applicationScope.goodsTypeList }" var="type">
        			<option value="${type.typeId }" ${ param.typeId eq type.typeId ? 'selected' :''  }>${type.typeName }</option>
        		</c:forEach>
        	</select>
        	<input type="submit" value="搜索">
        </form></center>
        <!-- 多条件查询表单 end-->
		</span>
		<form action="${pageContext.request.contextPath }/admin/goods/deletes.do" name="deletesForm"  id="deletesForm"   method="post">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="19" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center">
            </div></td>
            <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">商品图片</span></div></td>
            <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">商品编号</span></div></td>
            <td width="30%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">商品名称</span></div></td>
            <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">商品价格</span></div></td>
            <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">库存数量</span></div></td>
            <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">生产日期</span></div></td>
            <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">商品类型</span></div></td>
            <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">基本操作</span></div></td>
          </tr>
          <c:choose>
          <c:when test="${ empty requestScope.goodsList }">
          <tr><td colspan="10" align="center" bgcolor="#FFFFFF"><div class="STYLE1" style="font-size:36px;color:red;">本次查询没有商品！</div></td></tr>
          </c:when>
          <c:otherwise>
          <c:forEach items="${requestScope.goodsList }"    var="goods"     varStatus="status">
          <tr>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
              <input type="checkbox" name="goodsIds"  value="${goods.goodsId }" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
            	<span class="STYLE1">${ status.count }</span></div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
          	 	<span class="STYLE1"><img width="48px"  src="uploadimg/${goods.goodsImg }"></span></div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
            	<span class="STYLE1">${goods.goodsId }</span></div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
            	<span class="STYLE1">${goods.goodsName }</span></div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
            	<span class="STYLE1">￥<fmt:formatNumber value="${goods.goodsPrice }" pattern="#,###.00" /></span></div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
            	<span class="STYLE1">${goods.goodsNum }</span></div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
            	<span class="STYLE1"><fmt:formatDate value="${goods.goodsCreateTime }"  pattern="yyyy-MM-dd"/></span></div></td>
<%--            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">--%>
<%--            	<span class="STYLE1">${goods.goodsType.typeName }</span></div></td>--%>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE4"><img src="images/edt.gif" width="16" height="16" /><A href="${pageContext.request.contextPath }/admin/goods/toupdate.do?goodsId=${goods.goodsId }">编辑</A>&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" /><A href="javascript:dodel(${goods.goodsId })">删除</A></span></div></td>
          </tr>
          </c:forEach>
          </c:otherwise>
          </c:choose>
        </table></form></td><!-- 商品显示 -->
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>
        <!-- 分页控制 -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;
            	共有${requestScope.pageInfo.total }条记录，
            	当前第${requestScope.pageInfo.pageNum}/${requestScope.pageInfo.pages}页</td>
            <td>
            <table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <c:choose>
                  <c:when test="${requestScope.pageInfo.pageNum eq 1}">
                  <td width="40"><img src="images/first.gif" width="37" height="15" /></td>
                  <td width="45"><img src="images/back.gif" width="43" height="15" /></td>
                  </c:when>
                  <c:otherwise>
                  <td width="40"><A href="javascript:toPage(1)"><img src="images/first.gif" width="37" height="15" /></A></td>
                  <td width="45"><A href="javascript:toPage(${requestScope.pageInfo.prePage})"><img src="images/back.gif" width="43" height="15" /></A></td>
                  </c:otherwise>
                  </c:choose>
                  <c:choose>
                  <c:when test="${requestScope.pageInfo.pageNum eq requestScope.pageInfo.pages}">
                  	<td width="45"><img src="images/next.gif" width="43" height="15" /></td>
                  	<td width="40"><img src="images/last.gif" width="37" height="15" /></td>
                  </c:when>
                  <c:otherwise>
                 	<td width="45"><A href="javascript:toPage(${requestScope.pageInfo.nextPage})"><img src="images/next.gif" width="43" height="15" /></A></td>
                  	<td width="40"><A href="javascript:toPage(${requestScope.pageInfo.pages})"><img src="images/last.gif" width="37" height="15" /></A></td>
                  </c:otherwise>
                  </c:choose>
                  <td width="100"><div align="center"><span class="STYLE1">转到第<input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" /> 
                    	页 </span></div></td>
                  <td width="40"><img src="images/go.gif" width="37" height="15" /></td>
                </tr>
            </table>
            </td>
          </tr>
        </table><!-- 分页控制 end-->
        </td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
  </body>
</html>
