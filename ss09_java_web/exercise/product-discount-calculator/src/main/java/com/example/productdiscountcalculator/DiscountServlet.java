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
        double price = Double.parseDouble(req.getParameter("price"));
        double percent = Double.parseDouble(req.getParameter("percent"));
        double discountAmount = price*percent*0.01;
        double priceAfterDiscount = price-discountAmount;
        req.setAttribute("description",description);
        req.setAttribute("price",price);
        req.setAttribute("percent",percent);
        req.setAttribute("discountAmount",discountAmount);
        req.setAttribute("priceAfterDiscount",priceAfterDiscount);

        RequestDispatcher requestDispatcher =  req.getRequestDispatcher("/display-discount.jsp");
        requestDispatcher.forward(req,resp);
    }
}
