package com.homepage.web.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homepage.web.beans.KaupBean;
import com.homepage.web.serviceimpls.KaupServiceImpl;
import com.homepage.web.services.KaupService;

/**
 * @ Date : 2015.6.15;
 * @ Author : ;
 * @ Story : 키와 몸무게가 입력되면 카우푸지수와 메세지를 웹브라우저에 랜더링(값을 출력) 하는 역할;
 */
@WebServlet({"/KaupController","/model2/kaup.do"})
public class KaupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KaupService service = new KaupServiceImpl();
		
		double height = Double.parseDouble(request.getParameter("height"));
		double weight = Double.parseDouble(request.getParameter("weight"));
		
		
		// KaupBean bean = new KaupBean(height, weight);
		
		int idx = service.getKaupIndex(height, weight);
		String msg = service.getResultMsg(idx);
		
		request.setAttribute("msg", msg);
		request.setAttribute("height", height);
		request.setAttribute("weight", weight);
		request.setAttribute("index", idx);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/model2/kaup.jsp");
		dispatcher.forward(request, response);
	}


}
