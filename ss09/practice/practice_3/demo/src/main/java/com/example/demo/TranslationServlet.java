package com.example.demo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslationServlet", value = "/translation-servlet")
public class TranslationServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Cuốn sách");
        dictionary.put("note", "Vở ");
        dictionary.put("computer", "Máy tính");

        String search = request.getParameter("textSearch");
        PrintWriter writer = response.getWriter();

        writer.println("<html>");
        String result = dictionary.get(search);
        if (result != null) {
            writer.println("Word: " +search);
            writer.println("<br>");
            writer.println("Result: " + result);
        } else {
            writer.println("Not found");
        }
        writer.println("</html>");
    }
}