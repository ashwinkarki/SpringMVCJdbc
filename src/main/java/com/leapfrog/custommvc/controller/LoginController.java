/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.custommvc.controller;

import com.leapfrog.custommvc.system.Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AshwinKArki
 */
@WebServlet(name="login",urlPatterns={"/login/*"})
public class LoginController extends Controller {
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     request.getRequestDispatcher("/WEB-INF/views/login/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String email=request.getParameter("email");
        String password=request.getParameter("password");
        if(email.equalsIgnoreCase("admin@gmail.com") && password.equalsIgnoreCase("admin")){
            request.getSession().setAttribute("loggedin", true);
            response.sendRedirect(request.getContextPath()+"/department");
        }
        else{
            response.sendRedirect(request.getContextPath()+"/login?error");
        }
    }
    
}
