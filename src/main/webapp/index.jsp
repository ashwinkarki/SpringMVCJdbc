<%-- 
    Document   : index
    Created on : Jan 2, 2017, 10:20:59 AM
    Author     : Telus
--%>

<%@page import="com.leapfrog.custommvc.entity.Department"%>
<%@page import="com.leapfrog.custommvc.dao.DepartmentDAO"%>
<%@page import="com.leapfrog.custommvc.dao.impl.DepartmentDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            DepartmentDAO deptDAO=new DepartmentDAOImpl();
           for(Department d:deptDAO.getAll()){
               out.print(d.getId());
           
         %>
         <%}%>
    </body>
</html>
