<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@include file="/WEB-INF/views/login/login.jsp"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<button onclick="location.href='/join'">버튼</button>
<button onclick="location.href='/login'">login</button>

<%	
	if(session.getAttribute("user") != null){
		%><p>aaaaaa </p><%
	}else{
		%>bbbb<%
	}
	
%>
</body>
</html>
