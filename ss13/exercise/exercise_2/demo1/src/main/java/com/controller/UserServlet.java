package com.controller;

import com.model.User;
import com.service.IUserService;
import com.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "users", value = "/users")
public class UserServlet extends HttpServlet {
    private IUserService service = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "show-list":
                showList(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "sort":
                showSortForm(request, response);
                break;
            case "add-transaction":
                showAddTransactionForm(request, response);
                break;
        }
    }

    private void showAddTransactionForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/add-transaction.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showSortForm(HttpServletRequest request, HttpServletResponse response) {
        List<User> list = this.service.sortByCountry();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/sort.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.service.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        request.setAttribute("user", user);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> list = service.getList();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/add.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "find":
                findByCountry(request, response);
                break;
            case "add-transaction":
                addWithTransaction(request, response);
                break;
        }
    }

    private void addWithTransaction(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        this.service.addUserTransaction(user);
        try {
            response.sendRedirect("/users?action=show-list");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id_delete = Integer.parseInt(request.getParameter("id_delete"));
        this.service.delete(id_delete);

        try {
            response.sendRedirect("/users?action=show-list");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void findByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> findResult = service.findByCountry(country);
        if (findResult.isEmpty()) {
            String notice = "Cant find customer with country: " + country;
            request.setAttribute("notice", notice);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/find-empty.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("findResult", findResult);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/find.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User temp = new User(id, name, email, country);
        service.edit(temp);
        try {
            response.sendRedirect("/users?action=show-list");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(name, email, country);
        this.service.addUser(user);

        try {
            response.sendRedirect("/users?action=show-list");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}