package com.example.demo1.controller;

import com.example.demo1.service.Calculator;
import com.example.demo1.service.ICalculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "calculator", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    private ICalculator calculator = new Calculator();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double first = Double.parseDouble(request.getParameter("first"));
        Double second = Double.parseDouble(request.getParameter("second"));
        Double result = null;
        String conditional = request.getParameter("operator");
        result = calculator.calculator(conditional, first, second);
        request.setAttribute("first",first);
        request.setAttribute("second",second);
        request.setAttribute("result",result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }
}