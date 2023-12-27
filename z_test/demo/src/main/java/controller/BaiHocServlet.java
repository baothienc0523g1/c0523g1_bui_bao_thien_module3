package controller;

import model.BaiHoc;
import service.BaiHocService;
import service.IBaiHocService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BaiHocServlet", value = "/bai-hoc")
public class BaiHocServlet extends HttpServlet {
    private IBaiHocService service = new BaiHocService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "hienThi":
                hienThiDanhSach(request, response);
                break;
            case "themBaiHoc":
                hienThiThemBaiHoc(request, response);
                break;
        }
    }

    private void hienThiDanhSach(HttpServletRequest request, HttpServletResponse response) {
        List<BaiHoc> list = this.service.hienThiBaiHoc();
        try {
            request.setAttribute("list", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("danh-sach.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienThiThemBaiHoc(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("them-bai-hoc.jsp");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "themBaiHoc":
                themBaiHoc(request, response);
                break;
        }
    }

    private void themBaiHoc(HttpServletRequest request, HttpServletResponse response) {
        int maLoaiBaiHoc = Integer.parseInt(request.getParameter("maLoaiBaiHoc"));
        int doKho = Integer.parseInt(request.getParameter("doKho"));
        int module = Integer.parseInt(request.getParameter("module"));
        String link = request.getParameter("link");
        BaiHoc baiHoc = new BaiHoc(maLoaiBaiHoc, doKho, module, link);
        this.service.themBaiHoc(baiHoc);
        request.setAttribute("baiHoc", baiHoc);
        RequestDispatcher dispatcher = request.getRequestDispatcher("them-moi-thanh-cong.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}