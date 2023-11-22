<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/index.css" type="text/css" rel="stylesheet"> 
	 
  	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  	<script type="text/javascript">
		$(function(){
			$("#next").click(function(){
				var pages = parseInt($("#pages").html());
				var page = parseInt($("#currentPage").html());
				if(page == pages){
					return;
				}
				page++;
				location.href = "/book?page="+page;
			})

			$("#previous").click(function () {
				var page = parseInt($("#currentPage").html());
				if(page == 1){
					return;
				}
				page--;
				location.href = "/book?page="+page;
			})

			$("#first").click(function () {
				location.href = "/book?page=1";
			})

			$("#last").click(function(){
				var pages = parseInt($("#pages").html());
				location.href = "/book?page="+pages;
			})
		})
	</script>
  </head>
  
  <body>
  <%@ include file="top.jsp" %>

  	<div id="main">
		<div class="navigation">
				当前位置:&nbsp;&nbsp;<a href="book.do">首页</a>
				<div id="readerBlock">欢迎回来&nbsp;:<a href="/book?method=findAllBorrow&page=1">${sessionScope.reader.name }</a>&nbsp;<a href="/logout">注销</a></div>
		</div>
		<div class="img_block">
			<img src="images/main_booksort.gif" class="img" />
		</div>
		
		<table class="table" cellspacing="0">
			<tr>
				<td>编号</td>
				<td>图书名称</td>
				<td>作者</td>
				<td>出版社</td>
				<td>图书页数</td>
				<td>定价(元)</td>
				<td>书架</td>
				<td>操作</td>
			</tr>

			<c:forEach items="${list}" var="book">
				<tr>
					<td>${book.id}</td>
					<td>${book.name}</td>
					<td>${book.author}</td>
					<td>${book.publish}</td>
					<td>${book.pages}</td>
					<td>${book.price}</td>
					<td>${book.bookCase.name}</td>
					<td>
						<a href="/book?method=addBorrow&bookid=${book.id}">借阅</a>
					</td>
				</tr>
			</c:forEach>
			
		</table>
		<hr class="hr"/>
		<div id="pageControl">
			<div class="pageControl_item">每页<font id="dataPrePage">${dataPrePage }</font>条数据</div>
			<div class="pageControl_item" id="last">最后一页</div>
			<div class="pageControl_item" id="next">下一页</div>
			<div class="pageControl_item"><font id="currentPage">${currentPage }</font>/<font id="pages">${pages }</font></div>
			<div class="pageControl_item" id="previous">上一页</div>
			<div class="pageControl_item" id="first">首页</div>
		</div>
		
	</div>
  	
   <%@ include file="footer.jsp" %>
  </body>
</html>
