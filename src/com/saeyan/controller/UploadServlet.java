package com.saeyan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.naming.Context;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String savePath = "upload";
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);

		try {
			
			MultipartRequest multi = new MultipartRequest(
					request,  			// 매개변수 5가지 리퀘스트 객체
					uploadFilePath,		// 저장할 폴더의 실제 경로 
					uploadFileSizeLimit,// 업로드할 최대 사이즈
					encType,            // 인코딩 타입
					new DefaultFileRenamePolicy());   // 파일이름이 중복일떄 저절로 이름값을 추가해줌(중복방지)

			Enumeration files = multi.getFileNames();
			
			while(files.hasMoreElements()) {
				String file = (String)files.nextElement();
				out.print(multi.getFilesystemName(file)+"<br>");
				out.print(multi.getOriginalFileName(file)+"<br>");
			}
			
			
		;
			String name = multi.getParameter("name");
			String subject = multi.getParameter("subject");
			
			out.print(name + "<br>");
			out.print(subject + "<br>");
		} catch (Exception e) {
			System.out.print("업로드 실패");
		}

		
	
	}

}
