<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String savePath = "upload";
	int uploadFileSizeLimit = 5 * 1024 * 1024;
	String encType ="UTF-8";
	String uploadFilePath = request.getRealPath(savePath);
	
	String name = null;
	String subject = null;
	String fileName1 = null;
	String fileName2 = null;
	String orifileName1 = null;
	String orifileName2 = null;
	
	try {
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				uploadFileSizeLimit,
				encType,
				new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		fileName1 = multi.getFilesystemName("filename1");
		fileName2 = multi.getFilesystemName("filename2");
		orifileName1 = multi.getFilesystemName("filename1");
		orifileName2 = multi.getFilesystemName("filename2");
		
	} catch (Exception e) {
		e.getStackTrace();
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="filecheck" action="filecheck.jsp" method="post">
		<input type="hidden" name="name" value="<%= name %>">
		<input type="hidden" name="subject" value="<%= subject %>">
		<input type="hidden" name="filename1" value="<%= fileName1 %>">
		<input type="hidden" name="filename2" value="<%= fileName2 %>">
		<input type="hidden" name="origfilename1" value="<%= orifileName1 %>">
		<input type="hidden" name="origfilename2" value="<%= orifileName2 %>">
	</form>
	<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>