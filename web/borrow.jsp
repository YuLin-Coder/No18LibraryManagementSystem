<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'borrow.jsp' starting page</title>
    
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
				  location.href = "/book?method=findAllBorrow&page="+page;
			  })

			  $("#previous").click(function () {
				  var page = parseInt($("#currentPage").html());
				  if(page == 1){
					  return;
				  }
				  page--;
				  location.href = "/book?method=findAllBorrow&page="+page;
			  })

			  $("#first").click(function () {
				  location.href = "/book?method=findAllBorrow&page=1";
			  })

			  $("#last").click(function(){
				  var pages = parseInt($("#pages").html());
				  location.href = "/book?method=findAllBorrow&page="+pages;
			  })
		  })
	  </script>
  </head>
  
  <body>
    <%@ include file="top.jsp" %>
  	
  	
  	<div id="main">
		<div class="navigation">
				当前位置:&nbsp;&nbsp;<a href="/book?page=1">首页</a>
				<div id="readerBlock">欢迎回来&nbsp;:${reader.name }&nbsp;<a href="/logout">注销</a></div>
		</div>
		<div class="img_block">
			<img src="images/main_booksort.gif" class="img" />
		</div>
		
		<table class="table" cellspacing="0">
			<tr>
				<td>编号</td>
				<td>图书名称</td>
				<td>图书作者</td>
				<td>出版社</td>
				<td>读者姓名</td>
				<td>联系电话</td>
				<td>证件编号</td>
				<td>借书时间</td>
				<td>还书时间</td>
				<td>审核状态</td>
			</tr>
			<c:forEach items="${list}" var="borrow">
				<tr>
					<td>${borrow.id}</td>
					<td>${borrow.book.name}</td>
					<td>${borrow.book.author}</td>
					<td>${borrow.book.publish}</td>
					<td>${borrow.reader.name}</td>
					<td>${borrow.reader.tel}</td>
					<td>${borrow.reader.cardId}</td>
					<td>${borrow.borrowTime}</td>
					<td>${borrow.returnTime}</td>
					<td>
						<c:if test="${borrow.state == 0}">
							<font color="black">未审核</font>
						</c:if>
						<c:if test="${borrow.state == 1}">
							<font color="green">审核通过</font>
						</c:if>
						<c:if test="${borrow.state == 2}">
							<font color="red">未通过</font>
						</c:if>
						<c:if test="${borrow.state == 3}">
							<font color="yellow">已归还</font>
						</c:if>
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
