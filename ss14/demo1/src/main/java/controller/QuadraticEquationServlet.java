package controller;

import service.SolveQuadraticEquation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PhuongTrinhBacHai", value = "/quadratic")
public class QuadraticEquationServlet extends HttpServlet {
    private SolveQuadraticEquation solve = new SolveQuadraticEquation();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        double first  = Double.parseDouble(request.getParameter("first"));
        double second = Double.parseDouble(request.getParameter("second"));
        double third = Double.parseDouble(request.getParameter("third"));
        List<Double> doubleList = solve.solveQuadraticEquation(first, second, third);
        if (doubleList.size()==0) {
            request.setAttribute("result", "Phương trình vô nghiệm");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if(doubleList.size() == 1) {
            request.setAttribute("result","Phương trình có 1 nghiệm x1 = " + doubleList.get(0));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else if(doubleList.size() == 2){
            request.setAttribute("result", "Phương trình có 2 nghiệm x1 = " + doubleList.get(0)
                    + " và x2 = " + doubleList.get(1) );
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }
}