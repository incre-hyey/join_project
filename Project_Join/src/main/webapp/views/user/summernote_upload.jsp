<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8"%>
<%
	// 업로드할 위치
	String path = application.getRealPath("/upload");

	int size = 10*1024*1024; //10M
	
	MultipartRequest mr = 
		new MultipartRequest(request, path, size,
				"utf-8",
				new DefaultFileRenamePolicy());
	
	Enumeration files = mr.getFileNames();
	String file = (String)files.nextElement();
	String fileName = mr.getFilesystemName(file);
	
%>    
{
	"name":"<%=fileName %>",
	"url":"upload/<%=fileName %>"
}









