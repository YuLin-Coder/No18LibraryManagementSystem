package com.southwind.controller;

import com.southwind.entity.Admin;
import com.southwind.entity.Borrow;
import com.southwind.service.BookService;
import com.southwind.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if(method == null){
            method = "findAllBorrow";
        }
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        switch (method){
            case "findAllBorrow":
                String pageStr = req.getParameter("page");
                Integer page = Integer.parseInt(pageStr);
                List<Borrow> borrowList = bookService.findAllBorrowByState(0,page);
                req.setAttribute("list",borrowList);
                req.setAttribute("dataPrePage",6);
                req.setAttribute("currentPage",page);
                req.setAttribute("pages",bookService.getBorrowPagesByState(0));
                req.getRequestDispatcher("admin.jsp").forward(req,resp);
                break;
            case "handle":
                String idStr = req.getParameter("id");
                String stateStr = req.getParameter("state");
                Integer id = Integer.parseInt(idStr);
                Integer state = Integer.parseInt(stateStr);
                bookService.handleBorrow(id,state,admin.getId());
                if(state == 1 || state == 2){
                    resp.sendRedirect("/admin?page=1");
                }
                if(state == 3){
                    resp.sendRedirect("/admin?method=getBorrowed&page=1");
                }
                break;
            case "getBorrowed":
                pageStr = req.getParameter("page");
                page = Integer.parseInt(pageStr);
                borrowList = bookService.findAllBorrowByState(1,page);
                req.setAttribute("list",borrowList);
                req.setAttribute("dataPrePage",6);
                req.setAttribute("currentPage",page);
                req.setAttribute("pages",bookService.getBorrowPagesByState(1));
                req.getRequestDispatcher("return.jsp").forward(req,resp);
                break;
        }
    }
}
