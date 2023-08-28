package com.example.demo2.controller;

import com.example.demo2.service.DiscountCalculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "discount", value = "/discount")
public class DiscountServlet extends HttpServlet {
    private DiscountCalculator discountCalculator = new DiscountCalculator();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        Double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        Double discountAmount = discountCalculator.discountCalculator(listPrice, discountPercent);
        request.setAttribute("discountAmount",discountAmount);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }
}