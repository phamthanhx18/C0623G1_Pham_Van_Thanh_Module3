package com.example.productmanagement.controller;

import com.example.productmanagement.model.Product;
import com.example.productmanagement.service.IProductService;
import com.example.productmanagement.service.impl.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product Management", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private final IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            displayListProduct(req, resp);
        } else {
            switch (action) {
                case "create":
                    creatProduct(req, resp);
                    break;
                case "view":
                    viewProduct(req, resp);
                    break;
                case "delete":
                    showFromDeleteProduct(req, resp);
                    break;
                case "edit":
                    editProduct(req, resp);
                    break;
                default:
                    show404(req,resp);
                    break;
            }
        }
    }
    public void viewProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        if (product == null) {
            show404(req,resp);
        } else {
            req.setAttribute("product", product);
            dispatcher(req, resp, "/view.jsp");
        }
    }

    public void creatProduct(HttpServletRequest req, HttpServletResponse resp) {
        dispatcher(req, resp, "/create.jsp");
    }

    private void showFromDeleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.setAttribute("id", id);
        dispatcher(req, resp, "/delete.jsp");
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        dispatcher(req, resp, "/edit.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            displayListProduct(req, resp);
        } else {
            switch (action) {
                case "create":
                    addNewProduct(req, resp);
                    break;
                case "delete":
                    deleteProduct(req, resp);
                    break;
                case "edit":
                    updateProduct(req, resp);
                    break;
                default:
                    show404(req, resp);
                    break;
            }
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        float price = Float.parseFloat(req.getParameter("price"));
        if (price > 0) {
            productService.update(id, new Product(name, description, price));
            displayListProduct(req, resp);
        } else {
            String error = "Giá phải là số dương";
            req.setAttribute("error", error);
            dispatcher(req, resp, "/edit.jsp");
        }
    }

    private void addNewProduct(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        float price = Float.parseFloat(req.getParameter("price"));
        if (price > 0) {
            productService.add(new Product(name, description, price));
            displayListProduct(req, resp);
        } else {
            String error = "Giá phải là số dương";
            req.setAttribute("error", error);
            dispatcher(req, resp, "/create.jsp");
        }
    }

    private void displayListProduct(HttpServletRequest req, HttpServletResponse resp) {
        List<Product> productList = this.productService.findAll();
        req.setAttribute("productList", productList);
        dispatcher(req, resp, "/index.jsp");
    }

    private static void dispatcher(HttpServletRequest req, HttpServletResponse resp, String path) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }


    public void deleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        if (product == null) {
            show404(req,resp);
        } else {
            productService.remove(id);
            displayListProduct(req, resp);
        }
    }

    public void show404(HttpServletRequest req, HttpServletResponse resp) {
        dispatcher(req, resp, "/error-404.jsp");
    }
}