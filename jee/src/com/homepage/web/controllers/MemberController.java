package com.homepage.web.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homepage.web.beans.MemberBean;
import com.homepage.web.serviceimpls.MemberServiceImpl;
import com.homepage.web.services.MemberService;
import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;

/**
 * @ Date : 2015.6.15;
 * @ Author : 킴요!;
 * @ Story : 회원가입과 로그인 담당하는 컨트롤러;
 */
@WebServlet({"/model2/join.do","/model2/login.do",
			"/member/searchIdForm.do","/member/searchPassForm.do"})
public class MemberController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberServiceImpl();
	MemberBean bean = new MemberBean();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  // 자동완성 했을때 변수(현재는 객체)가 달라서 오류가 날 수 있기 때문에 확인해서 다르면 수정해준다.
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String path = request.getServletPath();
		switch(path){
			case "/member/searchIdForm.do" : 
				RequestDispatcher dispatcher2 = request.getRequestDispatcher("/views/model2/searchIdForm.jsp");
				dispatcher2.forward(request, response);
				break;
			case "/member/searchPassForm.do" : 
				RequestDispatcher dispatcher3 = request.getRequestDispatcher("/views/model2/searchPassForm.jsp");
				dispatcher3.forward(request, response);
				break;
			default:
				break;
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		RequestDispatcher dispatcher;
		
		switch(request.getServletPath()){
		case "/model2/join.do":  
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String addr = request.getParameter("address");
			bean.setId(id);
			bean.setPassword(password);
			bean.setName(name);
			bean.setAge(age);
			bean.setAddr(addr);
			service.join(id, password, name, age, addr);
			
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("age", age);
			request.setAttribute("address", addr);
			
			
			dispatcher = request.getRequestDispatcher("/views/model2/memberForm.jsp");
			dispatcher.forward(request, response);
			break;
		case "/model2/login.do":  goLogin(request, response); break;
		case "/member/searchIdForm.do" : 
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("/views/model2/searchIdForm.jsp");
			dispatcher2.forward(request, response);
			break;
		case "/member/searchPassForm.do" : 
			RequestDispatcher dispatcher3 = request.getRequestDispatcher("/views/model2/searchPassForm.jsp");
			dispatcher3.forward(request, response);
			break;
		default:
			dispatcher = request.getRequestDispatcher("/views/model2/memberFail.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

	private void goLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = bean.getName();
		int age = bean.getAge();
		String addr = bean.getAddr();
		
		service.login(id, password);
				
		RequestDispatcher dispatcher;
		request.setAttribute("id", id);
	 	 request.setAttribute("password", password);
		 request.setAttribute("name", name);
		 request.setAttribute("age", age);
		 request.setAttribute("address", addr);

		String msg = service.login(id, password);
		 
		if(msg.equals("환영합니다.")){
			 dispatcher = request.getRequestDispatcher("/views/model2/member.jsp");
			 dispatcher.forward(request, response); 
	
		}else {
	 		 request.setAttribute("msg", msg);
	 		 dispatcher = request.getRequestDispatcher("/views/model2/loginFail.jsp");
	 		 dispatcher.forward(request, response); 
		}
	}

}
