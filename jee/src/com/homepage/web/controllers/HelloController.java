package com.homepage.web.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homepage.web.serviceimpls.HelloServiceImpl;
import com.homepage.web.services.HelloService;

/**
 * Servlet implementation class NowServlet
 */
@WebServlet({"/name/hello.nhn","/hi.do"})  // 가상의 경로를 정해준것 form에 작성된 경로값과 같아(매핑)야 한다. >> 실제 경로를 노출시기지 않기 위해  // String배열로 받을수 있다.
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		String path = request.getServletPath(); // 서블릿 주소값을 path에 넣는다
		System.out.println("Path : " + path);
		
		if(path.equalsIgnoreCase("/name/hello.nhn")){
			goHello(request, response);
		}else if(path.equalsIgnoreCase("/hi.do")){
			goHi(request, response);
		}*/
		
		
		switch (request.getServletPath()) {
		case "/name/hello.nhn":  goHello(request, response); break;
		case "/hi.do":  goHi(request, response); break;

		default:
			System.out.println("페이지 없음");
			break;
		}
		
		/*PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>인사</title></head>");
		out.println("<body>");
		out.println("안녕하세요");
		out.println(request.getParameter("name"));
		out.println("님");
		out.println("</body></html>");	*/	 // 필요없음
	}


	private void goHi(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		request.setAttribute("name", name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/model2/hi.jsp");
		dispatcher.forward(request, response);
	}


	private void goHello(HttpServletRequest request,
		HttpServletResponse response) throws UnsupportedEncodingException,
		ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); // 가져온 값들의 글자가 깨지지 않기 위해 설정  >> 같은 문자열 체제로 통일 시키기 위해 작성
		response.setContentType("text/html;charset=UTF-8");  // 결과값의 형태를 지정한다 (html 이거나 xml , json)  
		
		HelloService hs = new HelloServiceImpl();
		String msg = hs.greet();
		
		System.out.println("msg" + msg);
		String name = request.getParameter("name");  // form 에서 불러오기
		request.setAttribute("name", msg+name);  // key, value >> Map 과 같은 형태 // 추가
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/model2/hello.jsp");  /*절대경로    RequestDispatcher는 경로관리자.조달자 */
		dispatcher.forward(request, response); // hello.jsp의 경로로 가게 하는 메소드 호출(request와 response 의 저장된 값들도 같이 가져간다)
	}
}
