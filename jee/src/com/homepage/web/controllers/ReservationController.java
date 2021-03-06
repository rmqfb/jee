package com.homepage.web.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homepage.web.serviceimpls.ReservationServiceImpl;
import com.homepage.web.services.ReservationService;
/*
@Date : someday;
@Author : itbank;
@Stroy : 예약 요청을 JSP에서 받아서 처리하는 컨트롤러 
*/
@WebServlet({"/reservation/checkIn.do","/reservation/checkOut.do"})
public class ReservationController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    ReservationService service = new ReservationServiceImpl();
    String[][] seat = new String[3][5];
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        int floor = Integer.parseInt(request.getParameter("floor"))-1;
        int row=Integer.parseInt(request.getParameter("row"))-1;
        String id = request.getParameter("id");
		String path = request.getServletPath();
		
        switch (path) {
        case "/reservation/checkIn.do":
        	String msg=service.checkIn(floor,row,id);
        	seat[floor][row] = id; 
        	request.setAttribute("seat",seat);
        	request.setAttribute("msg",msg);
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/views/model2/reservationForm.jsp");
           	dispatcher.forward(request, response);
            break; // 체크인
        case "/reservation/checkOut.do":
        	String msg2=service.checkOut(floor,row,id);
        	seat[floor][row] = null;
        	request.setAttribute("msg", msg2);
        	request.setAttribute("seat",seat);
        	   RequestDispatcher dispatcher1 = request.getRequestDispatcher("/views/model2/reservationForm.jsp");
           	dispatcher1.forward(request, response);
            break; // 체크아웃
            
        case "/reservation/showStatus.do":
        	System.out.println("2");
        	String[][]seat =service.showStatus();
        	
        	   RequestDispatcher dispatcher2 = request.getRequestDispatcher("/views/model2/reservation.jsp");
           	dispatcher2.forward(request, response);
        	break;
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

