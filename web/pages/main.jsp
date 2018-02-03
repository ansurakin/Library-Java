<%-- 
    Document   : main
    Created on : 02.02.2018, 21:40:37
    Author     : Alex
--%>

<%@page import="ru.alexander.library.testconnection.TestConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% request.setCharacterEncoding("UTF-8"); %>
        <%= "Привет" %>
        <h3><%= request.getParameter("username") %></h3>
        <h3>${param["password"]}</h3>
        
        <%
            TestConnection tc = new TestConnection();
            tc.check();
            
        %>
        
    </body>
</html>
