package com.example.listcustomer.controller;

import com.example.listcustomer.model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Discount Product", urlPatterns = "")
public class CustomerServlet extends HttpServlet {
    private static final List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer(1,"Mai Van Hoan","01/01/1999","Ha Noi","https://photocross.net/wp-content/uploads/2020/03/bo-cuc-chup-anh-chan-dung.jpg"));
        customerList.add(new Customer(2,"Nguyen Van Nam","01/01/1996","Bac Giang","https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg"));
        customerList.add(new Customer(3,"Nguyen Thai Hoa","01/01/1999","Ha Noi","https://www.paratime.vn/wp-content/uploads/2020/02/TIME-Studio-headshot-3-elements.jpg"));
        customerList.add(new Customer(4,"Tran Dang Khoa","01/01/2005","Da Nang","https://lavenderstudio.com.vn/wp-content/uploads/2019/10/gia-chup-hinh-chan-dung-ca-nhan-tp-hcm-01.jpg"));
        customerList.add(new Customer(5,"Nguyen Dinh Thi","01/01/2001","Ha Noi","https://camerabox.vn/uploads/news/2018_06/den-gan-chu-the.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
