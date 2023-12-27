package controller;

import model.BaiHoc;
import model.LoaiBaiHoc;
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "hienThi":
                hienThiDanhSach(request, response);
                break;
            case "sua":
                hienThiSua(request, response);
                break;
            case "themMoi":
                hienThiThemMoi(request, response);
                break;
        }
    }

    private void hienThiThemMoi(HttpServletRequest request, HttpServletResponse response) {
        List<LoaiBaiHoc> danhSachTenBaiHoc = this.service.danhSachTenBaiHoc();
        List<Integer> danhSachDoKho = this.service.danhSachDoKho();
        List<Integer> danhSachModule = this.service.danhSachModule();
        request.setAttribute("danhSachTenBaiHoc",danhSachTenBaiHoc);
        request.setAttribute("danhSachDoKho",danhSachDoKho);
        request.setAttribute("danhSachModule",danhSachModule);
        RequestDispatcher dispatcher = request.getRequestDispatcher("demo.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienThiSua(HttpServletRequest request, HttpServletResponse response) {
        int maBaiHoc = Integer.parseInt(request.getParameter("maBaiHoc"));
        BaiHoc baiHoc = this.service.timBaiHoc(maBaiHoc);
        request.setAttribute("baiHoc", baiHoc);
        request.setAttribute("maBaiHoc", maBaiHoc);
        RequestDispatcher dispatcher = request.getRequestDispatcher("sua.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienThiDanhSach(HttpServletRequest request, HttpServletResponse response) {
        List<BaiHoc> list = this.service.danhSachBaiHoc();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/hien-thi.jsp");
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "sua":
                sua(request, response);
                break;
            case "xoa":
                xoa(request, response);
                break;
            case "themMoi":
                themMoi(request, response);
                break;
        }
    }

    private void themMoi(HttpServletRequest request, HttpServletResponse response) {
        int maLoaiBaiHoc = Integer.parseInt(request.getParameter("maLoaiBaiHoc"));
        int doKho = Integer.parseInt(request.getParameter("doKho"));
        int module = Integer.parseInt(request.getParameter("module"));
        String tenBaiHoc = request.getParameter("tenBaiHoc");
        BaiHoc baiHoc = new BaiHoc(maLoaiBaiHoc, doKho, module, tenBaiHoc);
        this.service.themMoi(baiHoc);
        try {
            response.sendRedirect("bai-hoc?action=hienThi");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void xoa(HttpServletRequest request, HttpServletResponse response) {
        int maBaiHoc = Integer.parseInt(request.getParameter("maBaiHoc"));
        this.service.xoaBaiHoc(maBaiHoc);
        try {
            response.sendRedirect("bai-hoc?action=hienThi");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void sua(HttpServletRequest request, HttpServletResponse response) {
        int maBaiHoc = Integer.parseInt(request.getParameter("maBaiHoc"));
        int doKho = Integer.parseInt(request.getParameter("doKho"));
        int module = Integer.parseInt(request.getParameter("module"));
        String tenBaiHoc = request.getParameter("tenBaiHoc");
        int loaiBaiHoc = Integer.parseInt(request.getParameter("loaiBaiHoc"));

        BaiHoc baiHoc1 = new BaiHoc(maBaiHoc, doKho, module, loaiBaiHoc, tenBaiHoc);
        this.service.suaBaiHoc(baiHoc1);
        try {
            response.sendRedirect("/bai-hoc?action=hienThi");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}