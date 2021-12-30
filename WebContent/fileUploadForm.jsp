<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#uploadFormArea {
		margin: auto;
		width: 350px;
		border: 1px solid black;
	}
	.td_title {
		font-size: xx-large;
		text-align: center;
	}



</style>
</head>

<body>
	<section id = "uploadFormArea">
		<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td colspan="2">파일 업로드 폼</td>
				<tr>
					<td></td>
					<td></td>
				</tr>			
				<tr>
					<td><label for = "name">올린 사람 : </label></td>
					<td><input type="text" name="name" id="name"></td>
				</tr>			
				<tr>
					<td><label for = "subject">제목 : </label></td>
					<td><input type="text" name="subject" id="subject"></td>
				</tr>			
				<tr>
					<td><label for = "filename1">파일명1 : </label></td>
					<td><input type="file" name="filename1" id="nafilename1me"></td>
				</tr>			
				<tr>
					<td><label for = "filename2">파일명2 : </label></td>
					<td><input type="file" name="filename2" id="filename2"></td>
				</tr>			
				<tr>
					<td colspan="2" align="center"><input type="submit" value="전송"></td>
				
					
				</tr>	
			</table>
		</form>
	
	</section>
</body>
</html>