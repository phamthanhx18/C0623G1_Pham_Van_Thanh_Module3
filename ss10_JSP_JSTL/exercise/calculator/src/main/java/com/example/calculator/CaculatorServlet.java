package com.example.calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Caculator", value = "/caculator")
public class CaculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int numberA = Integer.parseInt(req.getParameter("numberA"));
        int numberB = Integer.parseInt(req.getParameter("numberB"));
        String operator = req.getParameter("operator");
        int result = 0;
        String error = null;
        try {
            switch (operator) {
                case "plus":
                    result = numberA+numberB;
                    break;
                case "minus":
                    result = numberA-numberB;
                    break;
                case "multiplication":
                    result = numberA*numberB;
                    break;
                case "division":
                    result = numberA/numberB;
                    break;
            }
        } catch (Exception e) {
            error = "Error: "+e.getMessage();
        }

        if (error != null) {
            req.setAttribute("error",error);
        } else {
            req.setAttribute("result",result);
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/result.jsp");
        requestDispatcher.forward(req,resp);
    }
}