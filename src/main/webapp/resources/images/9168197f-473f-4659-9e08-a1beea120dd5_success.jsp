<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Success</title>
</head>
<body>
	<h2>Result</h2>

<%
	String path = "c://";
	File file = new File(path);
	File[] files = file.listFiles();
	for(File f : files){
		out.println("<br/>"+f.getAbsolutePath());
	}


%>




</body>
</html>