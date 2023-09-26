package com.example.productdiscountcalculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "Discount Product", urlPatterns = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String description = req.getParameter("description");
        double price = Float.parseFloat(req.getParameter("price"));
        int percent = Integer.parseInt(req.getParameter("percent"));
        double discountAmount = price*percent*0.01;
        req.setAttribute("description",description);
        req.setAttribute("price",price);
        req.setAttribute("percent",percent);
        req.setAttribute("discountAmount",discountAmount);

        RequestDispatcher requestDispatcher =  req.getRequestDispatcher("/display-discount.jsp");
        requestDispatcher.forward(req,resp);
    }
}
