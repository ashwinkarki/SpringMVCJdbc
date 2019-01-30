/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.custommvc.controller;

import com.leapfrog.custommvc.dao.DepartmentDAO;
import com.leapfrog.custommvc.dao.impl.DepartmentDAOImpl;
import com.leapfrog.custommvc.entity.Department;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Telus
 */
@WebServlet(name = "deptController", urlPatterns = {"/department/*"})
public class DepartmentController extends HttpServlet {

    private DepartmentDAO deptDAO = new DepartmentDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "/WEB-INF/views/department/index.jsp";
        boolean redirect = false;
        try {
            String path = request.getRequestURI().toLowerCase();
            if (path.contains("/add")) {
                viewPage = "/WEB-INF/views/department/add.jsp";
            } else if (path.contains("/edit")) {
                if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()){ 
                int id=Integer.parseInt(request.getParameter("id"));
                    Department dept=deptDAO.getById(id);
                    if(dept==null){
                         redirect = true;
                    response.sendRedirect(request.getContextPath() + "/department?error");
                    }
                    request.setAttribute("department", dept);
                } 
                else{
                    redirect = true;
                    response.sendRedirect(request.getContextPath() + "/department?error");
                }
                viewPage = "/WEB-INF/views/department/edit.jsp";
            } else {
                request.setAttribute("departments", deptDAO.getAll());
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e.getMessage());
        }
        if (!redirect) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Department dept = new Department();
        dept.setName(request.getParameter("dept_name"));
        dept.setDescription(request.getParameter("dept_desc"));
        dept.setStatus((request.getParameter("status") != null) ? true : false);
        try {
            if(request.getParameter("id")==null || request.getParameter("id").isEmpty()){
            deptDAO.insert(dept);
            }
            else{
             int id=Integer.parseInt(request.getParameter("id"));
                dept.setId(id);
                dept.setModifiedDate(Calendar.getInstance().getTime());
                deptDAO.update(dept);
        }
            response.sendRedirect(request.getContextPath() + "/department");
        } catch (Exception e) {

        }

    }
}
