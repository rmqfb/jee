package com.homepage.web.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reservationControllerMine
 */
@WebServlet({"/result.do","/del.do"})
public class reservationControllerMine extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 String memberId;
	 String pass;
	 String seatNo;
	 String wanted;
	 String time;  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  switch (request.getServletPath()) {
		  case "/result.do" : goResult(request, response); break;
		  case "/del.do" : goDel(request, response); break;
		  default:
			   System.out.println("페이지 없음");
			   break;
		  }
	}
	private void goResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  goData(request);
	  RequestDispatcher dispatcher = request.getRequestDispatcher("/library/reservation/resultForm.jsp");
	  dispatcher.forward(request, response);
	}
	 private void goDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  goData(request);
	  RequestDispatcher dispatcher = request.getRequestDispatcher("/library/reservation/delForm.jsp");
	  dispatcher.forward(request, response);
	 }
	 private void goData(HttpServletRequest request) {
	  memberId = request.getParameter("memberId");
	  pass = request.getParameter("pass");
	  seatNo = request.getParameter("seatNo");
	  wanted = request.getParameter("wanted");
	  time = request.getParameter("time");
	  request.setAttribute("memberId", memberId);
	  request.setAttribute("seatNo", seatNo);
	  request.setAttribute("wanted", wanted);
	  request.setAttribute("time", time);
	 }

}
