<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY>
	<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
		<TR height=28>
			<TD background=images/title_bg1.jpg></TD>
		</TR>
		<TR>
			<TD bgColor=#b1ceef height=1></TD>
		</TR>
		<TR height=20>
			<TD background=images/shadow_bg.jpg></TD>
		</TR>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
		<TR height=100>
			<TD align=middle width=100><IMG height=100
				src="images/admin_p.gif" width=90></TD>
			<TD width=60>&nbsp;</TD>
			<TD>
				<TABLE height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>

					<TR>
						<TD>当前时间：2008-12-27 17:03:55</TD>
					</TR>
					<TR>
						<TD style="FONT-WEIGHT: bold; FONT-SIZE: 16px">admin</TD>
					</TR>
					<TR>
						<TD>欢迎进入网站管理中心！</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD colSpan=3 height=10></TD>
		</TR>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
		<TR height=20>
			<TD></TD>
		</TR>
		<TR height=22>
			<TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff"
				align=middle background=images/title_bg2.jpg>您的相关信息</TD>
		</TR>
		<TR bgColor=#ecf4fc height=12>
			<TD></TD>
		</TR>
		<TR height=20>
			<TD></TD>
		</TR>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=2 width="95%" align=center border=0>
		<TR>
			<TD align=right width=100>登陆帐号：</TD>
			<TD style="COLOR: #880000">admin</TD>
		</TR>
		<TR>
			<TD align=right>真实姓名：</TD>
			<TD style="COLOR: #880000">admin</TD>
		</TR>
		<TR>
			<TD align=right>注册时间：</TD>
			<TD style="COLOR: #880000">2007-7-25 15:02:04</TD>
		</TR>
		<TR>
			<TD align=right>登陆次数：</TD>
			<TD style="COLOR: #880000">58</TD>
		</TR>
		<TR>
			<TD align=right>上线时间：</TD>
			<TD style="COLOR: #880000">2008-12-27 17:02:54</TD>
		</TR>
		<TR>
			<TD align=right>IP地址：</TD>
			<TD style="COLOR: #880000">222.240.172.117</TD>
		</TR>
		<TR>
			<TD align=right>身份过期：</TD>
			<TD style="COLOR: #880000">30 分钟</TD>
		</TR>
	</TABLE>
</BODY>
</HTML>